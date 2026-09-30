tell application "Finder"
	activate
	tell application "System Events"
		keystroke "," using {command down}
		tell application process "Finder"
			tell window "Finder Settings"
				tell toolbar 1
					click button "Sidebar"
				end tell
				
				if value of checkbox "hiroyuki" is 0 then
					click checkbox "hiroyuki"
				end if
				
				key code 53
			end tell
		end tell
	end tell
end tell
