#!/usr/bin/env zsh

set -euo pipefail

: "${DOTFILES_DIR:=$(cd "$(dirname "$0")/.." && pwd)}"

log_info() { print -- "[info] $*"; }
log_success() { print -- "[ok] $*"; }
log_warn() { print -u2 -- "[warn] $*"; }
die() { print -u2 -- "[error] $*"; exit 1; }

section() {
  print -- ""
  print -- "==> $*"
}

has() {
  command -v "$1" >/dev/null 2>&1
}

require_macos() {
  [[ "$(uname -s)" == "Darwin" ]] || die "This bootstrap is designed for macOS."
}

brew_shellenv() {
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

clone_or_update() {
  local repo="$1"
  local dest="$2"

  if [[ -d "$dest/.git" ]]; then
    log_info "Updating $dest"
    git -C "$dest" pull --ff-only
    return
  fi

  if [[ -e "$dest" ]]; then
    log_warn "$dest exists and is not a git repo; leaving it unchanged."
    return
  fi

  mkdir -p "$(dirname "$dest")"
  git clone "$repo" "$dest"
}

append_line_if_missing() {
  local line="$1"
  local file="$2"

  mkdir -p "$(dirname "$file")"
  touch "$file"

  if ! grep -Fqx "$line" "$file" 2>/dev/null; then
    print -- "$line" >> "$file"
  fi
}
