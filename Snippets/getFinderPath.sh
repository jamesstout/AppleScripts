#!/usr/bin/env bash

# James Stout July 2013
# A simple script to get the path of the selected item in Finder 

_path=$(osascript << EOF

tell app "Finder"
	set selectedItem to quoted form of (posix path of (the selection as alias))
end tell

EOF
)

echo -n "$_path" 

# echo -n is POSIX compliant
# but some versions of bash/sh may not accept it
# so for improved portability consider:
# echo $_path | tr -d '\n'
# or:
# printf %b "$_path"