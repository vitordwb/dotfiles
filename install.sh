#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_ROOT="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
backed_up=0
default_packages=(git tmux nvim zsh borders ssh aerospace btop)

if ! command -v stow >/dev/null 2>&1; then
  print -u2 "stow is required. Install it with: brew install stow"
  exit 1
fi

if [[ $# -gt 0 ]]; then
  packages=("$@")
else
  packages=("${default_packages[@]}")
fi

targets_for_package() {
  case "$1" in
    git) print ".gitconfig" ;;
    tmux) print ".tmux.conf" ;;
    nvim) print ".config/nvim" ;;
    zsh) print ".zshrc"; print ".zprofile" ;;
    borders) print ".config/borders" ;;
    ssh) print ".ssh/config" ;;
    aerospace) print ".config/aerospace" ;;
    btop) print ".config/btop" ;;
  esac
}

backup_target() {
  local rel="$1"
  local target="$HOME/$rel"

  if [[ -L "$target" || ! -e "$target" ]]; then
    return
  fi

  local backup="$BACKUP_ROOT/$rel"
  mkdir -p "$(dirname "$backup")"
  mv "$target" "$backup"
  backed_up=1
  print "Backed up $target to $backup"
}

for package in "${packages[@]}"; do
  if [[ ! -d "$DOTFILES_DIR/$package" ]]; then
    print -u2 "Skipping missing package: $package"
    continue
  fi

  while IFS= read -r target; do
    [[ -n "$target" ]] && backup_target "$target"
  done < <(targets_for_package "$package")

  stow --dir="$DOTFILES_DIR" --target="$HOME" --restow "$package"
  print "Linked $package"
done

if [[ "$backed_up" -eq 1 ]]; then
  print "Backups saved in $BACKUP_ROOT"
fi
