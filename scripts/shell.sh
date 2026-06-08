#!/usr/bin/env zsh

install_oh_my_zsh() {
  if [[ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]]; then
    log_success "Oh My Zsh is installed."
    return
  fi

  log_info "Installing Oh My Zsh without changing existing dotfiles."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}
