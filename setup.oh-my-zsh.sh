
# oh-my-zsh
# https://ohmyz.sh
if [[ ! -d $HOME/.oh-my-zsh ]]; then
  echo Installing oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo oh-my-zsh is already intalled
fi

# Desired Theme:
# https://github.com/agnoster/agnoster-zsh-theme
echo Installing Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

echo iTerm2 Setup
echo "iTerm2 users need to set both the Regular font and the Non-ASCII Font in \"iTerm > Preferences > Profiles > Text\" to use a patched font"
echo "Font: Menlo"
echo "Non-ASCII Font: DejaVu Sans Mono for Powerline"
Echo "Theme: Solarized Dark"
