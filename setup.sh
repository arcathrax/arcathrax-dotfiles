#!/bin/zsh

echo "Installing commandline tools..."
xcode-select --install

echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

echo "Installing Brew Formulae..."
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick font-symbols-only-nerd-font mpv
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install FelixKratz/formulae/borders
brew install FelixKratz/formulae/sketchybar

echo "Cloning config..."
git clone https://github.com/arcathrax/arcathrax-dotfiles.git /tmp/dotfiles
cp $HOME/.config $HOME/.config_backup
mv /tmp/dotfiles/sketchybar $HOME/.config/sketchybar
mv /tmp/dotfiles/skhd $HOME/.config/skhd
mv /tmp/dotfiles/yabai $HOME/.config/yabai
mv /tmp/dotfiles/yazi $HOME/.config/yazi
rm -rf /tmp/dotfiles

echo "Starting services"
skhd --restart-service
yabai --restart-service
sketchybar --reload
