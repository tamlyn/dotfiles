#!/bin/sh

# Ask for the administrator password upfront
#sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Symlink dotfiles
#ln -s ./.bash_profile ~/.bash_profile
#ln -s ./.gitconfig ~/.gitconfig

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install essentials
brew install git hub bash-completion composer

# brew install apple-gcc42

# Install Homebrew Cask
brew install caskroom/cask/brew-cask brew-cask-completion

# Install binary apps
brew cask install \
  google-chrome firefox acorn utorrent flycut \
  skype dropbox spotify sonos karabiner jitouch scroll-reverser cyberduck \
  java phpstorm atom virtualbox vagrant sqlitebrowser

# Tweak PhpStorm memory
mkdir -p ~/Library/Preferences/WebIde10/
# ... todo

brew install redis mongodb openssl

# Install Node
brew install nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install 4

# npm bash completions
npm completion > /usr/local/etc/bash_completion.d/npm

# Install CLI apps from NPM
npm i -g gulp bower http-server mocha node-inspector

# Load customised key map
./karabiner.sh

# Add key to SSH agent
/usr/bin/ssh-add -K ~/.ssh/id_rsa

# Disable the sound effects on boot
#sudo nvram SystemAudioVolume=" "

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Use F1-12 keys as normal
defaults write -g com.apple.keyboard.fnState -bool true 

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 28
