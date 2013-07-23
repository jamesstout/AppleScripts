-- James Stout July 2013
-- A simple script to get the path of the selected item in Finder - and properly quote it

tell app "Finder"
	set selectedItem to quoted form of (posix path of (the selection as alias))
end tell

-- e.g.
-- if you selected:
-- /Volumes/media/TVShows/James May's Toy Stories/Season 01/James May's Toy Stories - 1x02 - Plasticine.avi

-- it would return:
-- '/Volumes/media/TVShows/James May'\''s Toy Stories/Season 01/James May'\''s Toy Stories - 1x02 - Plasticine.avi'
-- which can then be pasted into a terminal etc
