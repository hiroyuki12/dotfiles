-- Open the macOS settings area for Keyboard > Modifier Keys.
-- Run with Script Editor, or from Terminal:
--   osascript open_modifier_keys_settings.applescript

use framework "Foundation"

on run
	set modifierKeysURL to "x-apple.systempreferences:com.apple.Keyboard-Settings.extension?ModifierKeys"
	set customizeModifierKeysURL to "x-apple.systempreferences:com.apple.Keyboard-Settings.extension?CustomizeModifierKeys"
	set keyboardURL to "x-apple.systempreferences:com.apple.Keyboard-Settings.extension"
	set legacyKeyboardURL to "x-apple.systempreferences:com.apple.preference.keyboard"
	
	set openStatus to runTask("/usr/bin/open", {modifierKeysURL})
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {customizeModifierKeysURL})
	end if
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {keyboardURL})
	end if
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {legacyKeyboardURL})
	end if
	
	tell application "System Settings" to activate
	
	return "Opened System Settings for Keyboard / Modifier Keys."
end run

on runTask(launchPath, taskArguments)
	set taskRef to current application's NSTask's alloc()'s init()
	(taskRef's setLaunchPath:launchPath)
	(taskRef's setArguments:taskArguments)
	(taskRef's |launch|())
	(taskRef's waitUntilExit())
	return taskRef's terminationStatus()
end runTask
