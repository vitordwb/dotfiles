#!/usr/bin/env zsh

configure_macos_defaults() {
  [[ "${SKIP_MACOS_DEFAULTS:-0}" == "1" ]] && return

  log_info "Applying macOS defaults."

  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock launchanim -bool true
  defaults write com.apple.dock mineffect -string "genie"
  defaults write com.apple.dock minimize-to-application -bool true
  defaults write com.apple.dock show-recents -bool false

  defaults write com.apple.finder FXRemoveOldTrashItems -bool true
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.finder ShowStatusBar -bool true

  killall Dock >/dev/null 2>&1 || true
  killall Finder >/dev/null 2>&1 || true

  log_success "macOS defaults applied. Some changes may need logout/restart."
}
