-- Open the macOS settings area for Keyboard Shortcuts.
-- Run with Script Editor, or from Terminal:
--   osascript open_keyboard_shortcuts_settings.applescript

use framework "Foundation"

on run
	set shortcutsURL to "x-apple.systempreferences:com.apple.Keyboard-Settings.extension?Shortcuts"
	set keyboardURL to "x-apple.systempreferences:com.apple.Keyboard-Settings.extension"
	set legacyKeyboardURL to "x-apple.systempreferences:com.apple.preference.keyboard"
	
	set openStatus to runTask("/usr/bin/open", {shortcutsURL})
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {keyboardURL})
	end if
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {legacyKeyboardURL})
	end if
	
	tell application "System Settings" to activate
	
	return "Opened System Settings for Keyboard Shortcuts."
end run

on runTask(launchPath, taskArguments)
	set taskRef to current application's NSTask's alloc()'s init()
	(taskRef's setLaunchPath:launchPath)
	(taskRef's setArguments:taskArguments)
	(taskRef's |launch|())
	(taskRef's waitUntilExit())
	return taskRef's terminationStatus()
end runTask
