#!/usr/bin/env bash

tempfile=/tmp/dotfiles.zip
workspace=/tmp/dotfiles

# start Initial Setting

while true; do
read -p 'Now Initial Setting? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

defaults write com.apple.dock orientation -string "left"
killall Dock

# ng tapToClickOn
#curl -LSfs -o /tmp/tapToClickOn.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/tapToClickOn.scpt
#osascript /tmp/tapToClickOn.scpt
#rm /tmp/tapToClickOn.scpt

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

# correct spelling off
curl -LSfs -o /tmp/CorrectSpellingOff.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/CorrectSpellingOff.scpt
osascript /tmp/CorrectSpellingOff.scpt
rm /tmp/CorrectSpellingOff.scpt

# change input source Control J (After Add Input Sources Japanese)
curl -LSfs -o /tmp/changeInputSourceControlJ.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/changeInputSourceControlJ.scpt
osascript /tmp/changeInputSourceControlJ.scpt
rm /tmp/changeInputSourceControlJ.scpt

# show Safari Favorites Bar
curl -LSfs -o /tmp/showFavoritesBar.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/showFavoritesBar.scpt
osascript /tmp/showFavoritesBar.scpt
rm /tmp/showFavoritesBar.scpt

# ng change dock position left
#curl -LSfs -o /tmp/changeDockPositionLeft.scpt https://github.com/hiroyuki12/dotfiles/raw/master/appleScript/changeDockPositionLeft.scpt
#osascript /tmp/changeDockPositionLeft.scpt
#rm /tmp/changeDockPositionLeft.scpt

# Download zipped installer
curl -LSfs -o ${tempfile} https://github.com/hiroyuki12/dotfiles/archive/master.zip

# Unzip installer into workspace
unzip -oq ${tempfile} -d ${workspace}

# Move to repository root path
pushd ${workspace}/dotfiles-master > /dev/null


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

# start Exec Automator

while true; do
read -p 'Now exec automator? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

##
# ok tapToClickOn
automator -v automator/TapToClickOn.app

# Add Input Sources Japanese
#automator -v automator/addInputSourceJapanese.app

# Finder Show Home
automator -v automator/FinderShowHome.app

# ng Safari Prevent cross-site tracking off
#automator -v automator/SafariPreventOff.app

break;
;;
[Nn]* )
  echo "Skip Exec automator"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;

# Install homebrew
which brew > /dev/null
if [ "$?" -ne 0 ]; then
    #ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/hiroyuki/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install mas

# start Install rbenv
while true; do
read -p 'Now install rbenv? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

# Install rbenv
brew install rbenv ruby-build rbenv-gemset rbenv-default-gems
echo 'eval "$(rbenv init -)"' >> ~/.zsh_profile
source ~/.zsh_profile
#rbenv install 3.0.0
#rbenv install 2.7.2 
#rbenv rehash
#rbenv global 3.0.0
#rbenv global 2.7.2

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

# Run installer

while true; do
read -p 'Now install bundler serverkit? exec serverkit? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

# Install bundler,serverkit and its dependencies
#sudo which bundle > /dev/null || sudo gem install bundler:1.17.2
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

# start Install nodenv

while true; do
read -p 'Now install nodenv & node 16.13.2? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

which nodenv > /dev/null
if [ "$?" -ne 0 ]; then
  anyenv install --init
  anyenv install nodenv
  exec $SHELL -l
  nodenv -v
  mkdir -p "$(nodenv root)"/plugins
  git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
fi

# nodenv install 16.13.2
nodenv install 18.16.0
nodenv rehash
# nodenv global 16.13.2
nodenv global 18.16.0
node -v

break;
;;
[Nn]* )
  echo "Skip install nodenv & node 16.13.2"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;

# start Install dein

while true; do
read -p 'Now install dein? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

#which nodenv > /dev/null
#if [ "$?" -ne 0 ]; then
  mkdir -p ~/.cache/dein
  cd ~/.cache/dein
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  sh ./installer.sh ~/.cache/dein
  mkdir -p ~/.config/nvim/dein/
#fi

break;
;;
[Nn]* )
  echo "Skip install dein"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;

#open Basic2.terminal  # add Terminal Profile

# Move to original path
popd > /dev/null

# Cleanup
rm -rf ${tempfile} ${workspace}
