-- this controls what time you want the due date to be set to
-- in 24h clock (so setting this to 16 sets it to 16:00)
-- this might get a little screwy around DST
set oclock to 16

-- code below based on https://github.com/lemonmade/later by Chris Sauvé

set myTime to current date
set the time of myTime to (oclock * 60 * 60)

tell application "OmniFocus"
	tell content of first document window of front document
		set tasksSelected to value of (selected trees where (class of its value is not item) and (class of its value is not folder))
		if length of tasksSelected is 0 then
			display alert "You didn't select any OmniFocus tasks."
			return
		end if
	end tell
end tell

tell application "OmniFocus"
	repeat with i from 1 to (length of tasksSelected)
		tell item i of tasksSelected
			set due date to myTime
		end tell
	end repeat
end tell

