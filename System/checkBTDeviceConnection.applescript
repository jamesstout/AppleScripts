-- James Stout July 2013
-- A simple script to check the Bluetooth connection status of a specified device
-- edit below for the names of your BT devices

on run argv
	
	if (count of argv) < 1  or  (count of argv) > 1 then
		return "USAGE: osascript me.scpt 'param'"
	end if

	-- pass in as as M or TP, or skip the on run func and hardcode	--set doWhat to "M"
	-- M for mouse, TP for Trackpad
	-- adjust as needed
	set doWhat to item 1 of argv  	

	set theFile to (path to temporary items as string) & "test1.plist"
	
	-- this  outputs a plist file with all the BT data
	do shell script "system_profiler -xml -detailLevel basic SPBluetoothDataType > " & POSIX path of theFile

	-- read property list comes from Property List Tools.osax 
	-- from http://www.latenightsw.com/freeware/PListTools/index.html
	set xxplist to read property list file (theFile)
	
	set _devices to device_title of item 1 of _items of item 1 of xxplist
	
	--count _devices -- for me it's 2 as I have 2 BT devices

	-- |apple wireless trackpad| and |james mouse| are variable names, well, record keys
	-- Alas AppleScript record keys cannot be read programmatically
	-- debug and look in _devices for YOUR variable names 
	-- substitute the vars below
	-- if you have more than 2 devices, add extra try/on error conditions
	set dev1 to ""
	set dev1Connected to true
	
	if doWhat = "TP" then
		try
			set dev1 to |apple wireless trackpad| of item 1 of _devices
			if device_isconnected of dev1 = "attrib_No" then
				set dev1Connected to false
			end if
		on error
			set dev1 to |apple wireless trackpad| of item 2 of _devices
			if device_isconnected of dev1 = "attrib_No" then
				set dev1Connected to false
			end if
		end try
		
	end if
	
	if doWhat = "M" then
		try
			set dev1 to |james mouse| of item 2 of _devices
			if device_isconnected of dev1 = "attrib_No" then
				set dev1Connected to false
			end if
			
			
		on error
			set dev1 to |james mouse| of item 1 of _devices
			if device_isconnected of dev1 = "attrib_No" then
				set dev1Connected to false
			end if
		end try
	end if
	--log "connected = " & dev1Connected
	return dev1Connected
end run
