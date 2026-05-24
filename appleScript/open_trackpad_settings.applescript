-- Open the macOS settings area for Trackpad.
-- Run with Script Editor, or from Terminal:
--   osascript open_trackpad_settings.applescript

use framework "Foundation"

on run
	set trackpadURL to "x-apple.systempreferences:com.apple.Trackpad-Settings.extension"
	set legacyTrackpadURL to "x-apple.systempreferences:com.apple.preference.trackpad"
	
	set openStatus to runTask("/usr/bin/open", {trackpadURL})
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {legacyTrackpadURL})
	end if
	
	tell application "System Settings" to activate
	
	return "Opened System Settings for Trackpad."
end run

on runTask(launchPath, taskArguments)
	set taskRef to current application's NSTask's alloc()'s init()
	(taskRef's setLaunchPath:launchPath)
	(taskRef's setArguments:taskArguments)
	(taskRef's |launch|())
	(taskRef's waitUntilExit())
	return taskRef's terminationStatus()
end runTask
