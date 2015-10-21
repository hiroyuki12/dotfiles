#!/usr/bin/env bash

tempfile=/tmp/dotfiles.zip
workspace=/tmp/dotfiles

# Download zipped installer
curl -LSfs -o ${tempfile} https://github.com/hiroyuki12/dotfiles/archive/master.zip

# Unzip installer into workspace
unzip -oq ${tempfile} -d ${workspace}

# Move to repository root path
pushd ${workspace}/dotfiles-master > /dev/null

# Install homebrew
which brew > /dev/null
if [ "$?" -ne 0 ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install serverkit and its dependencies
sudo which bundle > /dev/null || sudo gem install bundler
sudo bundle install > /dev/null

# Run installer
sudo bundle exec serverkit apply recipe.yml

# Copy .bash_profile
cp .bash_profile ~/

# Copy .vimrc
cp .vimrc ~/

# Copy .gitconfig
cp .gitconfig ~/

# git clone, install bundler serverkit
mkdir ~/github
cd ~/github
git clone https://github.com/hiroyuki12/dotfiles.git
cd dotfiles
sudo gem install bundler
sudo gem install serverkit
serverkit apply recipe.yml

# Move to original path
popd > /dev/null

# Cleanup
rm -rf ${tempfile} ${workspace}
