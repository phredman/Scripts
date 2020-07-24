#!/bin/bash

echo "running dockutil"
DOCKUTIL=/usr/local/bin/dockutil
loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

echo "remove default apps"
# remove default apps 
$DOCKUTIL --remove all --no-restart --allhomes
echo "adding to dock"
# add items to dock
$DOCKUTIL --add /Applications/Launchpad.app --position 1 --no-restart --allhomes
$DOCKUTIL --add /Applications/Pulse\ Secure.app --after "Launchpad" --no-restart --allhomes
$DOCKUTIL --add /Applications/Firefox.app --after "Pulse Secure" --no-restart --allhomes
$DOCKUTIL --add /Applications/Google\ Chrome.app --after "Firefox" --no-restart --allhomes
$DOCKUTIL --add /Applications/Visual\ Studio\ Code.app --after "Google Chrome" --no-restart --allhomes
$DOCKUTIL --add /Applications/Microsoft\ Teams.app --after "Visual Studio Code" --no-restart --allhomes
DOCKUTIL --add /Applications/Microsoft\ Outlook.app --after "Microsoft Teams" --no-restart --allhomes
DOCKUTIL --add /Applications/Microsoft\ Word.app --after "Microsoft Outlook" --no-restart --allhomes
DOCKUTIL --add /Applications/KeePassX.app --after "Microsoft Word" --no-restart --allhomes
DOCKUTIL --add /Applications/OneDrive.app --after "KeePassX" --no-restart --allhomes
DOCKUTIL --add /Applications/Self\ Service.app --after "OneDrive" --no-restart --allhomes
$DOCKUTIL --add '/Applications/System Preferences.app' --after "Self Service" --no-restart --allhomes


$DOCKUTIL --add '/Applications' --view grid --display folder --sort name  --section others --position 1 --allhomes
$DOCKUTIL --add '~/Documents' --view list --display folder --section others  --position 2 --allhomes
$DOCKUTIL --add '~/Downloads' --view list --display folder --sort dateadded --section others --position end --allhomes

exit 0