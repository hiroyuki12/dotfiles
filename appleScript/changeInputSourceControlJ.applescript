use framework "Foundation"
use scripting additions

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
	if openStatus is not 0 then error "Could not open Keyboard Shortcuts settings."
	
	tell application "System Settings" to activate
	display notification "Choose Input Sources and set the shortcut to Control-J." with title "Keyboard Shortcuts"
	return "Opened Keyboard Shortcuts. Choose Input Sources and set the shortcut to Control-J."
end run

on runTask(launchPath, taskArguments)
	set taskRef to current application's NSTask's alloc()'s init()
	(taskRef's setLaunchPath:launchPath)
	(taskRef's setArguments:taskArguments)
	(taskRef's |launch|())
	(taskRef's waitUntilExit())
	return taskRef's terminationStatus()
end runTask
