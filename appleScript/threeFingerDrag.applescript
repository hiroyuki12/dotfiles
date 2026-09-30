on run
	do shell script "/usr/bin/defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true"
	do shell script "/usr/bin/defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true"
end run
