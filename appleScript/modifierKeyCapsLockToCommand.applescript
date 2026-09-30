use framework "Foundation"
use scripting additions

on run
	set modifierKeysURL to "x-apple.systempreferences:com.apple.Keyboard-Settings.extension?ModifierKeys"
	set keyboardURL to "x-apple.systempreferences:com.apple.Keyboard-Settings.extension"
	set legacyKeyboardURL to "x-apple.systempreferences:com.apple.preference.keyboard"
	
	set openStatus to runTask("/usr/bin/open", {modifierKeysURL})
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {keyboardURL})
	end if
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {legacyKeyboardURL})
	end if
	if openStatus is not 0 then error "Could not open Modifier Keys settings."
	
	tell application "System Settings" to activate
	display notification "Assign Caps Lock to Command." with title "Modifier Keys"
	return "Opened Modifier Keys. Assign Caps Lock to Command."
end run

on runTask(launchPath, taskArguments)
	set taskRef to current application's NSTask's alloc()'s init()
	(taskRef's setLaunchPath:launchPath)
	(taskRef's setArguments:taskArguments)
	(taskRef's |launch|())
	(taskRef's waitUntilExit())
	return taskRef's terminationStatus()
end runTask
