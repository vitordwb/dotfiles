#!/usr/bin/env zsh
set -euo pipefail

export DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
source "$DOTFILES_DIR/scripts/lib.sh"

export PATH="$HOME/.bun/bin:$PATH"
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  source "$HOME/.nvm/nvm.sh"
  nvm use default >/dev/null 2>&1 || true
fi

failures=0

check_command() {
  local command_name="$1"

  if has "$command_name"; then
    log_success "$command_name is available."
  else
    log_warn "$command_name is missing."
    failures=$((failures + 1))
  fi
}

check_symlink() {
  local target="$1"

  if [[ -L "$HOME/$target" ]]; then
    log_success "~/$target is symlinked."
  else
    log_warn "~/$target is not symlinked."
    failures=$((failures + 1))
  fi
}

section "Commands"
for command_name in git stow brew nvim tmux node npm bun; do
  check_command "$command_name"
done

section "Dotfile Links"
for target in .gitconfig .tmux.conf .zshrc .zprofile .ssh/config .config/nvim .config/aerospace .config/btop; do
  check_symlink "$target"
done

section "Homebrew Bundle"
brew_shellenv
if has brew && brew bundle check --file="$DOTFILES_DIR/Brewfile" --no-upgrade >/dev/null 2>&1; then
  log_success "Brewfile is satisfied."
else
  log_warn "Brewfile is not fully satisfied."
  failures=$((failures + 1))
fi

if [[ "$failures" -gt 0 ]]; then
  log_warn "Doctor found $failures issue(s)."
  exit 1
fi

log_success "Doctor passed."
