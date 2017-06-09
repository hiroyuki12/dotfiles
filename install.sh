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

# Install rbenv
brew install rbenv ruby-build rbenv-gemset rbenv-default-gems
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
rbenv install 2.4.1
rbenv rehash
rbenv global 2.4.1

# Install bundler,serverkit and its dependencies
sudo gem install bundler
sudo bundle install > /dev/null

# Run installer
bundle exec serverkit apply recipe.yml

# install bundler serverkit
#cd ~/github/dotfiles
#sudo which bundle > /dev/null || sudo gem install bundler
#sudo which serverkit > /dev/null || sudo gem install serverkit
open Basic2.terminal  # add Terminal Profile
#serverkit apply recipe.yml

# Move to original path
popd > /dev/null

# Cleanup
rm -rf ${tempfile} ${workspace}
