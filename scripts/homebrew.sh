#!/usr/bin/env zsh

ensure_xcode_cli_tools() {
  if xcode-select -p >/dev/null 2>&1; then
    log_success "Xcode Command Line Tools are installed."
    return
  fi

  log_info "Starting Xcode Command Line Tools installer."
  xcode-select --install || true
  log_warn "Finish the installer dialog, then press Enter here to continue."
  read -r

  xcode-select -p >/dev/null 2>&1 || die "Xcode Command Line Tools are still missing."
}

ensure_homebrew() {
  brew_shellenv

  if has brew; then
    log_success "Homebrew is installed."
    return
  fi

  log_info "Installing Homebrew."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew_shellenv
  has brew || die "Homebrew installation failed."
}

install_homebrew_bundle() {
  brew_shellenv

  [[ -f "$DOTFILES_DIR/Brewfile" ]] || die "Missing Brewfile."

  if brew bundle check --file="$DOTFILES_DIR/Brewfile" --no-upgrade >/dev/null 2>&1; then
    log_success "Homebrew bundle is already satisfied."
    return
  fi

  log_info "Installing Homebrew bundle. This can take a while on a fresh laptop."
  brew bundle --file="$DOTFILES_DIR/Brewfile" --no-upgrade
}
