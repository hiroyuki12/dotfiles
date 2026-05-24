-- Open the macOS settings area for Accessibility > Pointer Control.
-- Run with Script Editor, or from Terminal:
--   osascript open_trackpad_options.applescript

use framework "Foundation"

on run
	set pointerControlURL to "x-apple.systempreferences:com.apple.preference.universalaccess?Mouse"
	set accessibilityURL to "x-apple.systempreferences:com.apple.Accessibility-Settings.extension"
	set extensionPointerURL to "x-apple.systempreferences:com.apple.Accessibility-Settings.extension?pointer"
	
	set openStatus to runTask("/usr/bin/open", {pointerControlURL})
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {extensionPointerURL})
	end if
	if openStatus is not 0 then
		set openStatus to runTask("/usr/bin/open", {accessibilityURL})
	end if
	
	tell application "System Settings" to activate
	
	return "Opened System Settings for Accessibility / Pointer Control."
end run

on runTask(launchPath, taskArguments)
	set taskRef to current application's NSTask's alloc()'s init()
	(taskRef's setLaunchPath:launchPath)
	(taskRef's setArguments:taskArguments)
	(taskRef's |launch|())
	(taskRef's waitUntilExit())
	return taskRef's terminationStatus()
end runTask
