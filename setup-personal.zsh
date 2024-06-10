#!/usr/bin/env zsh

source ./src/brew_install_list.sh
source ./src/log_message.sh

## Alias
alias strip-empty="egrep -v '^\s*$'"

# Install local fonts using Homebrew
log_message "Installing local fonts using Homebrew ..."
brew_install_list "lists/casks-fonts.local" "true"

# Install local applications using Homebrew
log_message "Installing local apps using Homebrew ..."
brew_install_list "lists/casks-personal.local" "true"

# Add more files here as needed
# install_list "lists/another-list.local" "false"