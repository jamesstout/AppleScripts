-- James Stout July 2013
-- A simple script to tell QuickTime to loop the playing of all open windows

tell application "QuickTime Player"
	
	set theWindows to documents
	
	repeat with aWindow in theWindows
		set the looping of aWindow to true
	end repeat
	
end tell