<<<<<<< HEAD
on alfred_script(q)
clickPooFire()
end alfred_script

on clickPooFire()

--CONFIG:Set path for dependancy cliclick (https://www.bluem.net/en/mac/cliclick/)
set cliclickpath to null --<--replace null with path of cliclick i.e. "/usr/local/bin/cliclick"

if cliclickpath is null then
		return "ERROR: cliclickpath varriable is not set"
end if
set pooLocation to getPooFire()
	tell application "System Events"
		tell application "Amazon Chime" to activate
		tell application process "Amazon Chime"
			try
				tell UI element 1 of row pooLocation of table 1 of scroll area 1 of splitter group 1 of window "Amazon Chime"
					set {xPosition, yPosition} to position
					set {xSize, ySize} to size
				end tell
				-- modify offsets if hot spot is not centered:
				--click at {xPosition + (xSize div 10), yPosition + (ySize div 2)}
				do shell script cliclickpath & " c:" & (xPosition + (xSize div 10)) & "," & (yPosition + (ySize div 2))
			end try
		end tell
	end tell
end clickPooFire

on getPooFire()
	tell application "System Events"
		tell application process "Amazon Chime"
			set allRowNames to get name of first UI element of every row of table 1 of scroll area 1 of splitter group 1 of window "Amazon Chime"
			set iterate to 1
			repeat with eachRowName in allRowNames
				log iterate & eachRowName
				if text of eachRowName is "𝖕ºº𝖕𝒇ⅈ𝓻𝓮 💩🔥" then
					return iterate
				end if
				set iterate to iterate + 1
			end repeat
			
		end tell
	end tell
end getPooFire
=======
# alfredchimeflows
collection of alfred workflows providing productivity enhancments for Amazon Chime
>>>>>>> 580acb36190c7405107406e7872f12a582d4c45f
