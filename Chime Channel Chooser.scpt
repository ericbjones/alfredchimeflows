on alfred_script(q)
	clickChannel(q)
end alfred_script

on clickChannel(q)

	--CONFIG:Set path for dependancy cliclick (https://www.bluem.net/en/mac/cliclick/)
	set cliclickpath to "/usr/local/bin/cliclick"

	set channelLocation to getChannel(q)
	tell application "System Events"
		tell application "Amazon Chime" to activate
		tell application process "Amazon Chime"

			-- From http://macscripter.net/viewtopic.php?pid=170532#p170532
			perform action "AXRaise" of (first window whose name contains "Amazon Chime")


			try
				tell UI element 1 of row channelLocation of table 1 of scroll area 1 of splitter group 1 of window "Amazon Chime"
					set {xPosition, yPosition} to position
					set {xSize, ySize} to size
				end tell
				-- modify offsets if hot spot is not centered:
				--click at {xPosition + (xSize div 10), yPosition + (ySize div 2)}
				do shell script cliclickpath & " c:" & (xPosition + (xSize div 10)) & "," & (yPosition + (ySize div 2))
			end try
		end tell
	end tell

	return fzfMatch


end clickChannel

on getChannel(q)
	tell application "System Events"
		tell application process "Amazon Chime"
			set allRowNames to get name of first UI element of every row of table 1 of scroll area 1 of splitter group 1 of window "Amazon Chime"

			set iterate to 1
			repeat with eachRowName in allRowNames
				log iterate & eachRowName
				if text of eachRowName is q then
					return iterate
				end if
				set iterate to iterate + 1
			end repeat

		end tell
	end tell
end getChannel