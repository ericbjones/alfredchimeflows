set q to "{query}"
on convertListToString(theList, theDelimiter)
	set AppleScript's text item delimiters to theDelimiter
	set theString to theList as string
	set AppleScript's text item delimiters to ""
	return theString
end convertListToString

tell application "System Events"
	tell application process "Amazon Chime"
		set allRowNames to get name of first UI element of every row of table 1 of scroll area 1 of splitter group 1 of window "Amazon Chime"
		
	end tell
end tell

set channels to my convertListToString(allRowNames, "
")
set fzfMatch to do shell script "echo " & quoted form of channels & "| /usr/local/bin/fzf -f " & quoted form of q & "| grep -v 'Chat Rooms\\|Recent Messages\\|Favorites'"

set allMatches to paragraphs of fzfMatch


set json to "{
\"items\":[
"
repeat with eachMatch in allMatches
	set json to json & "    { 
	\"title\": " & "\"" & eachMatch & "\",
	" & "\"arg\": \"" & eachMatch & "\",
	" & "\"icon\": {\"path\": \"chime.png\"}
    },
"
end repeat
set json to text 1 thru -3 of json
set json to json & "]}"
return json

