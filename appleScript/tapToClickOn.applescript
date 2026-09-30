on run
	do shell script "/usr/bin/defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true"
	do shell script "/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true"
	do shell script "/usr/bin/defaults write -g com.apple.mouse.tapBehavior -int 1"
end run
