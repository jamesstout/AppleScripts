-- James Stout July 2013
-- A simple script to tell QuickTime to start playing all open windows

tell application "QuickTime Player"
	
	set theWindows to documents

	repeat with aWindow in theWindows
		play aWindow
	end repeat
	
end tell