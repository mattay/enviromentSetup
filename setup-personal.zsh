#!/usr/bin/env zsh

source ./src/brew_install_list.sh

# Install fonts using Homebrew
brew_install_list "lists/casks-fonts.local" "true"

# Install applications using Homebrew
brew_install_list "lists/casks-personal.local" "true"
