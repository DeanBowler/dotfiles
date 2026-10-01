#!/bin/sh

echo "Starting setup"

echo "Checking for Homebrew"
if test ! $(which brew); then
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Copying .zshrc"
if [[ -L $HOME/.zshrc ]]; then
  echo ".zshrc already linked"
else
  rm -rf $HOME/.zshrc
  # ln -s .zshrc $HOME/.zshrc
  cp .zshrc $HOME/.zshrc
fi

echo "Refreshing .zshrc"
source $HOME/.zshrc

echo "Linking .gitconfig"
if [[ -L $HOME/.gitconfig ]]; then
  echo ".gitconfig already linked"
else
  rm -rf $HOME/.gitconfig
  ln -sf "$PWD/.gitconfig" $HOME/.gitconfig
fi

# Update Homebrew recipes
echo "Updating Homebrew"
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing dependencies"
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Configure node
echo "Configuring node"
volta install node@24
volta install pnpm
volta install yarn@4.7.0

# Set macOS preferences
echo "Setting macOS preferences"
source ./.macos

echo "Linking Ghostty config"
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
ln -sf "$PWD/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

echo "Enjoy your new Mac!"
