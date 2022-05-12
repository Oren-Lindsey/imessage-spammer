set whoToSpamQuestion to display dialog "Enter the email address or phone number you want to spam." default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"
if button returned of whoToSpamQuestion is "Continue" then
	set whoToSpam to text returned of whoToSpamQuestion
	set whatToSendQuestion to display dialog "What do you want to send?" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"
	set whatToSend to text returned of whatToSendQuestion
	set loopsQuestion to display dialog "How many times should it be sent?" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"
	set loops to text returned of loopsQuestion
	--See if they're ready to send
	set readyToSend to display dialog "Ready to send it?" with icon caution buttons {"No", "Yes"} default button "Yes"
	if button returned of readyToSend is "Yes" then
		tell application "Messages"
			set targetService to 1st account whose service type = iMessage
			set targetBuddy to participant whoToSpam of targetService
			--set targetBuddyTwo to participant "sr.lindsey@icloud.com" of targetService
			repeat loops times
				send whatToSend to targetBuddy
				--send textToSend to whoToSpam
			end repeat
		end tell
		display dialog "Sent" with icon note buttons {"Done"} default button "Done"
	else
		display dialog "Ok, it wasn't sent" with icon note buttons {"Done"} default button "Done"
	end if
else
	display notification "Canceled"
end if
