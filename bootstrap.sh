#!/usr/bin/env zsh
set -euo pipefail

export DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$DOTFILES_DIR/scripts/lib.sh"
source "$DOTFILES_DIR/scripts/homebrew.sh"
source "$DOTFILES_DIR/scripts/macos.sh"
source "$DOTFILES_DIR/scripts/shell.sh"
source "$DOTFILES_DIR/scripts/runtimes.sh"
source "$DOTFILES_DIR/scripts/tmux.sh"
source "$DOTFILES_DIR/scripts/ssh.sh"

main() {
  require_macos

  section "Command Line Tools"
  ensure_xcode_cli_tools

  section "Homebrew"
  ensure_homebrew
  install_homebrew_bundle

  section "Shell"
  install_oh_my_zsh


  section "Dotfiles"
  "$DOTFILES_DIR/install.sh"

  section "Runtimes"
  install_nvm
  install_node
  install_global_npm_packages
  install_bun

  section "Tmux"
  install_tmux_plugins

  section "SSH"
  ensure_ssh_key

  section "macOS Defaults"
  configure_macos_defaults

  section "Doctor"
  "$DOTFILES_DIR/scripts/doctor.sh"

  section "Done"
  log_success "Fresh laptop bootstrap complete. Restart the terminal to load all shell changes."
}

main "$@"
