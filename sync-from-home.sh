#!/usr/bin/env zsh
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

sync_item() {
  local source="$1"
  local dest="$2"

  if [[ ! -e "$source" && ! -L "$source" ]]; then
    print "Skipping missing $source"
    return
  fi

  if [[ -L "$source" ]]; then
    print "Skipping symlinked $source"
    return
  fi

  mkdir -p "$(dirname "$dest")"

  if [[ -d "$source" ]]; then
    mkdir -p "$dest"
    rsync -a --delete "$source/" "$dest/"
  else
    cp "$source" "$dest"
  fi

  print "Synced $source -> $dest"
}

sync_item "$HOME/.gitconfig" "$DOTFILES_DIR/git/.gitconfig"
sync_item "$HOME/.tmux.conf" "$DOTFILES_DIR/tmux/.tmux.conf"
sync_item "$HOME/.zshrc" "$DOTFILES_DIR/zsh/.zshrc"
sync_item "$HOME/.zprofile" "$DOTFILES_DIR/zsh/.zprofile"
sync_item "$HOME/.ssh/config" "$DOTFILES_DIR/ssh/.ssh/config"
sync_item "$HOME/.config/nvim" "$DOTFILES_DIR/nvim/.config/nvim"
sync_item "$HOME/.config/borders" "$DOTFILES_DIR/borders/.config/borders"
sync_item "$HOME/.config/aerospace" "$DOTFILES_DIR/aerospace/.config/aerospace"
sync_item "$HOME/.config/btop" "$DOTFILES_DIR/btop/.config/btop"

print "Review changes with: git diff"
