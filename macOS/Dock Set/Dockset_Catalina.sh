
echo "running dockutil"
DOCKUTIL=/usr/local/bin/dockutil
loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

echo "remove default apps"
# remove default apps 
$DOCKUTIL --remove all --no-restart --allhomes
echo "adding to dock"
# add items to dock
$DOCKUTIL --add '/System/Applications/Launchpad.app' --position 1 --no-restart --allhomes
$DOCKUTIL --add '' --type spacer --section apps --after "Launchpad" --allhomes
$DOCKUTIL --add /Applications/Google\ Chrome.app --no-restart --allhomes
$DOCKUTIL --add /Applications/Firefox.app --after "Google Chrome" --no-restart --allhomes
$DOCKUTIL --add '' --type spacer --section apps --after "FireFox" --allhomes
$DOCKUTIL --add /Applications/Microsoft\ Outlook.app --no-restart --allhomes
$DOCKUTIL --add /Applications/Microsoft\ Word.app --after "Microsoft Outlook" --no-restart --allhomes
$DOCKUTIL --add /Applications/Microsoft\ Excel.app --after "Microsoft Word" --no-restart --allhomes
$DOCKUTIL --add /Applications/Microsoft\ PowerPoint.app --after "Microsoft Excel" --no-restart --allhomes
$DOCKUTIL --add '' --type spacer --section apps --after "Microsoft PowerPoint" --allhomes
$DOCKUTIL --add /Applications/Zoom.us.app --no-restart --allhomes
$DOCKUTIL --add '' --type spacer --section apps --after "Zoom.us" --allhomes
$DOCKUTIL --add /Applications/Self\ Service.app --no-restart --allhomes
$DOCKUTIL --add '/System/Applications/System Preferences.app' --after "Self Service" --no-restart --allhomes
$DOCKUTIL --add '' --type spacer --section apps --after "Self Service" --allhomes

$DOCKUTIL --add '/Applications' --view grid --display folder --sort name  --section others --position 1 --allhomes
$DOCKUTIL --add '~/Documents' --view list --display folder --section others  --position 2 --allhomes
$DOCKUTIL --add '~/Downloads' --view list --display folder --sort dateadded --section others --position end --allhomes

sleep 5

# Variables
loggedInUser=$(id -un)
UsrLib=/Users/$loggedInUser/Library/Preferences

###########

defaults write $UsrLib/com.apple.dock show-recents -bool false

killall 'Dock'

exit 0
