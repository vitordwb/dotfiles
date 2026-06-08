#!/usr/bin/env zsh

NVM_VERSION="${NVM_VERSION:-v0.40.3}"
NODE_VERSION="${NODE_VERSION:-24}"

install_nvm() {
  if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
    log_success "nvm is installed."
    return
  fi

  log_info "Installing nvm $NVM_VERSION."
  clone_or_update "https://github.com/nvm-sh/nvm.git" "$HOME/.nvm"
  git -C "$HOME/.nvm" checkout "$NVM_VERSION"
}

load_nvm() {
  [[ -s "$HOME/.nvm/nvm.sh" ]] || die "nvm is not installed."
  source "$HOME/.nvm/nvm.sh"
}

install_node() {
  load_nvm

  log_info "Installing Node $NODE_VERSION and setting it as default."
  nvm install "$NODE_VERSION"
  nvm alias default "$NODE_VERSION"
  nvm use default

  if has corepack; then
    corepack enable
  fi

  log_success "Node $(node --version) is ready."
}

install_global_npm_packages() {
  local package_file="$DOTFILES_DIR/runtime/npm-global.txt"

  [[ -f "$package_file" ]] || return
  load_nvm
  nvm use default >/dev/null

  while IFS= read -r package; do
    [[ -z "$package" || "$package" == \#* ]] && continue
    log_info "Installing global npm package: $package"
    npm install -g "$package"
  done < "$package_file"
}

install_bun() {
  export PATH="$HOME/.bun/bin:$PATH"

  if [[ -x "$HOME/.bun/bin/bun" ]]; then
    log_success "Bun is installed."
    return
  fi

  log_info "Installing Bun."
  curl -fsSL https://bun.sh/install | bash
  export PATH="$HOME/.bun/bin:$PATH"
}
