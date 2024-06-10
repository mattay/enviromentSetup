#!/usr/bin/env zsh

source ./src/brew_install_list.sh
source ./src/log_message.sh

# Install fonts
brew_install_list "lists/casks-fonts.local" "true"

# Install shell and extentions
brew_install_list "lists/formulae-shell.local" "false"

# # Set as default shell
echo "Do you need to change default shell used?"
# chsh -s $(which zsh)

# Install oh-my-zsh -> https://ohmyz.sh
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  log_message Installing oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  log_message oh-my-zsh is already intalled
fi

# Install Teminals
brew_install_list "lists/casks-terminal.local" "false"

echo iTerm2 Setup
echo "Font -> Fira Code"
echo "Theme -> Solarized Dark"
#
# echo "Non-ASCII Font: DejaVu Sans Mono for Powerline"



# To activate these completions, add the following to your .zshrc:

#   if type brew &>/dev/null; then
#     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

#     autoload -Uz compinit
#     compinit
#   fi

# You may also need to force rebuild `zcompdump`:

#   rm -f ~/.zcompdump; compinit

# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:

#   chmod -R go-w '/usr/local/share/zsh'
