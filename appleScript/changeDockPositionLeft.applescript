on run
	do shell script "/usr/bin/defaults write com.apple.dock orientation -string left"
	do shell script "/usr/bin/killall Dock"
end run
