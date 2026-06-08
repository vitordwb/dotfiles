#!/usr/bin/env zsh

ensure_ssh_key() {
  local key_path="$HOME/.ssh/id_ed25519"
  local email

  mkdir -p "$HOME/.ssh"
  chmod 700 "$HOME/.ssh"

  if [[ -f "$key_path.pub" ]]; then
    log_success "SSH public key exists at $key_path.pub"
    return
  fi

  email="$(git config --file "$DOTFILES_DIR/git/.gitconfig" user.email 2>/dev/null || true)"
  [[ -n "$email" ]] || email="$(whoami)@$(hostname)"

  log_info "Generating SSH key for $email."
  ssh-keygen -t ed25519 -C "$email" -f "$key_path" -N ""

  ssh-add --apple-use-keychain "$key_path" >/dev/null 2>&1 || ssh-add "$key_path" >/dev/null 2>&1 || true

  if has pbcopy; then
    pbcopy < "$key_path.pub"
    log_success "SSH public key copied to clipboard. Add it to GitHub."
  else
    log_info "Add this SSH public key to GitHub:"
    print -- "$(cat "$key_path.pub")"
  fi
}
