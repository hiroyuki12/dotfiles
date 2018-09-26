#!/usr/bin/env bash

tempfile=/tmp/dotfiles.zip
workspace=/tmp/dotfiles

while true; do
read -p 'Now Initial Setting? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

# tapToClickOn
curl -LSfs -o /tmp/tapToClickOn.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/tapToClickOn.scpt
osascript /tmp/tapToClickOn.scpt
rm /tmp/tapToClickOn.scpt

# changeDisplayResolution
curl -LSfs -o /tmp/changeDisplayResolution.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/changeDisplayResolution.scpt
osascript /tmp/changeDisplayResolution.scpt
rm /tmp/changeDisplayResolution.scpt

# change caps lock to command 
curl -LSfs -o /tmp/modifierKeyCapsLockToCommand.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/modifierKeyCapsLockToCommand.scpt
osascript /tmp/modifierKeyCapsLockToCommand.scpt
rm /tmp/modifierKeyCapsLockToCommand.scpt

# Key Repeat Fast, Delay Util Repeat Short
curl -LSfs -o /tmp/KeyRepeatFast.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/KeyRepeatFast.scpt
osascript /tmp/KeyRepeatFast.scpt
rm /tmp/KeyRepeatFast.scpt

# three finger drag
curl -LSfs -o /tmp/threeFingerDrag.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/threeFingerDrag.scpt
osascript /tmp/threeFingerDrag.scpt
rm /tmp/threeFingerDrag.scpt

break;
;;
[Nn]* )
  echo "Skip Initial Setting"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;

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

while true; do
read -p 'Now install rbenv? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

# Install rbenv
brew install rbenv ruby-build rbenv-gemset rbenv-default-gems
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
rbenv install 2.5.1
rbenv rehash
rbenv global 2.5.1

break;
;;
[Nn]* )
  echo "Skip install rbenv"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;

while true; do
read -p 'Now install bundler serverkit? exec serverkit? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

# Install bundler,serverkit and its dependencies
sudo which bundle > /dev/null || sudo gem install bundler
sudo bundle install > /dev/null

# Run installer
bundle exec serverkit apply recipe.yml.erb

break;
;;
[Nn]* )
  echo "Skip install bundler exec serverkit"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;

# open Basic2.terminal  # add Terminal Profile

# Move to original path
popd > /dev/null

# Cleanup
rm -rf ${tempfile} ${workspace}
