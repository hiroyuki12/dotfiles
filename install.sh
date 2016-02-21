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

# git clone, install bundler serverkit
git clone https://github.com/hiroyuki12/dotfiles.git ~/github/dotfiles
cd ~/github/dotfiles
sudo gem install bundler
sudo gem install serverkit
serverkit apply recipe.yml

# ln .vimrc, .bash_profile, .gitconfig
ln -s ~/github/dotfiles/.vimrc ~/.vimrc
ln -s ~/github/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/github/dotfiles/.gitconfig ~/.gitconfig

# NeoBundle (easy-motion)
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# Move to original path
popd > /dev/null

# Cleanup
rm -rf ${tempfile} ${workspace}
