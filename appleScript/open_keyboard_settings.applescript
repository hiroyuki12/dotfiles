-- Open the macOS settings area for Keyboard.
-- Run with Script Editor, or from Terminal:
--   osascript open_keyboard_settings.applescript

use framework "Foundation"

on run
	set keyboardURL to "x-apple.systempreferences:com.apple.Keyboard-Settings.extension"
	set legacyKeyboardURL to "x-apple.systempreferences:com.apple.preference.keyboard"
	
	set openStatus to runTask("/usr/bin/open", {keyboardURL})
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {legacyKeyboardURL})
	end if
	
	tell application "System Settings" to activate
	
	return "Opened System Settings for Keyboard."
end run

on runTask(launchPath, taskArguments)
	set taskRef to current application's NSTask's alloc()'s init()
	(taskRef's setLaunchPath:launchPath)
	(taskRef's setArguments:taskArguments)
	(taskRef's |launch|())
	(taskRef's waitUntilExit())
	return taskRef's terminationStatus()
end runTask
