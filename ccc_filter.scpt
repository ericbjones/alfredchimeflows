tell application "System Events"
	tell application process "Amazon Chime"
		set allRowNames to get name of first UI element of every row of table 1 of scroll area 1 of splitter group 1 of window "Amazon Chime"
		
	end tell
end tell
set json to "{
\"items\":[
"
repeat with eachRowName in allRowNames
	set json to json & "    { 
	\"title\": " & "\"" & eachRowName & "\",
	" & "\"arg\": \"" & eachRowName & "\",
	" & "\"icon\": {\"path\": \"chime.png\"}
    },
"
end repeat
set json to text 1 thru -3 of json
set json to json & "]}"
return json