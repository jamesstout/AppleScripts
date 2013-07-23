-- James Stout July 2013
-- A snippet to get the current username

set _username to system attribute "USER"
if _username is "" then
	set _username to do shell script "whoami"
end if

-- optional
-- if you are executing via sudo 
-- or with administrator privileges syntax in AppleScript
if _username is "root" then
	set _username to do shell script "who | grep console | awk '{print $1}'"
end if