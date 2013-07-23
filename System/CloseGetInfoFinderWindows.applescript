-- James Stout July 2013
-- A script to close all Finder's "Get Info" panels
-- leaves and normal Finder windows with a title ending in "Info" open

tell application "Finder"
	set theWindowList to windows (* get all Finder windows *)
	
	repeat with i from 1 to number of items in theWindowList (* loop through them *)
		set shouldClose to false (* reset to false *)
		set this_item to item i of theWindowList (* get a window from the list *)
		set windowName to name of this_item (* get the window'ss name  *)
		
		(* this list should contain class property that tells you the type of window - which is nice *)
		(* Class would be either "Finder window" for normal windows or "information window" for the Info windows *)
		(* However, it doesn't contain the class property. Alas. *)
		(* So to differentiate, we can use the current view/panel props *)
		set thePropList to get properties of this_item
		
		(* in a try/catch as prop not set for the diff windows *)
		try
			set CurrentView to current panel of thePropList
			set shouldClose to true (* no error, it's an info panel, so close *)
		on error
			log "Not an info panel, leaving open: " & windowName
		end try
		
		(* this try/catch is just for a double check, feel free to comment out *)
		try
			set CurrentView to current view of thePropList
		on error
			if shouldClose = false then log "Not an info panel: " & windowName
		end try
		
		if windowName ends with " Info" and shouldClose then
			close this_item
			log "Closing info panel: " & windowName
		end if
	end repeat
end tell