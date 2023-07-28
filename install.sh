#!/bin/sh

echo "Starting setup"

echo "Checking for Homebrew"
if test ! $(which brew); then
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Symlinking .zshrc"
if [[ test .zshrc - L ]]; then
  rm -rf $HOME/.zshrc
  ln -s .zshrc $HOME/.zshrc
else
  echo ".zshrc already linked"
fi

echo "Symlinking .gitconfig"
if [[ test .gitconfig - L ]]; then
  rm -rf $HOME/.gitconfig
  ln -s .gitconfig $HOME/.gitconfig
else
  echo ".zshrc already linked"
fi

# Update Homebrew recipes
echo "Updating Homebrew"
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing dependencies"
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Configure yarn
echo "Configuring node"
volta install node@18
npm install -g yarn

# Configure JDK
echo "Installing JDK"
sdk install java 11.0.17.zulu

# Set macOS preferences
echo "Setting macOS preferences"
touch ./.macos

echo "Enjoy your new Mac!"