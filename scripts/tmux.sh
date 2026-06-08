#!/usr/bin/env zsh

install_tmux_plugins() {
  has tmux || die "tmux is not installed. Run the Homebrew step first."

  clone_or_update "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"

  if [[ -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]]; then
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"
  fi

  if [[ -x "$HOME/.tmux/plugins/tpm/bin/update_plugins" ]]; then
    "$HOME/.tmux/plugins/tpm/bin/update_plugins" all
  fi

  log_success "tmux plugins are installed or updated."
}
