use framework "Foundation"

on run
	set displaysURL to "x-apple.systempreferences:com.apple.Displays-Settings.extension"
	set legacyDisplaysURL to "x-apple.systempreferences:com.apple.preference.displays"
	
	set openStatus to runTask("/usr/bin/open", {displaysURL})
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {legacyDisplaysURL})
	end if
	
	if openStatus is not 0 then error "Could not open Displays settings."
	
	tell application "System Settings" to activate
	delay 1
	
	tell application "System Events" to tell process "System Settings"
		set frontmost to true
		click radio button "More Space" of radio group 1 of group 1 of window 1
	end tell
end run

on runTask(launchPath, taskArguments)
	set taskRef to current application's NSTask's alloc()'s init()
	(taskRef's setLaunchPath:launchPath)
	(taskRef's setArguments:taskArguments)
	(taskRef's |launch|())
	(taskRef's waitUntilExit())
	return taskRef's terminationStatus()
end runTask
