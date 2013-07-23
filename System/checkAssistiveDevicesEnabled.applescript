-- James Stout July 2013
-- A script to determine if access for assistive devices is enabled
-- if you want to be able to click on buttons or menus in the GUI like in ActivateBTDevice.applescript
-- then access for assistive devices must be enabled
-- this works on 10.8.4. I know this changes in Mavericks 10.9

-- check access for assistive devices is enabled
tell application "System Events"
	if UI elements enabled is false then
		tell application "System Preferences"
			
			activate
			
			set current pane to pane id "com.apple.preference.universalaccess"
			set userCanceled to false

			try
				set dialogResult to display dialog "This script requires access for assistive devices be enabled." & return & return & "To continue, click the OK button and enter an administrative password in the forthcoming security dialog." with icon 1 giving up after 15
			on error number -128
				set userCanceled to true
			end try
		
			if userCanceled or gave up of dialogResult then
				return "user cancelled"
			end if
		end tell

		set UI elements enabled to true
		if UI elements enabled is false then
			return "user cancelled"
		end if
		-- if we get to here then the user enabled access
		-- wait a moment for the system to update
		delay 1
	end if
end tell