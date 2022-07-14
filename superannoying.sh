#!/bin/bash

currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )

/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType fs -title "VIZ IT" -heading "Hi $currentUser! " -description "VIZ IT is requiring you to update your Mac.

Please visit Self Service and run *Install macOS Monterey (macOS 12)*
This message will stop appearing shortly after upgrading. If you have any questions or concerns, please email help@viz.com. 

This message will disappear shortly." -icon "/System/Library/PreferencePanes/SoftwareUpdate.prefPane/Contents/Resources/SoftwareUpdate.icns" & sleep 10

killall jamfHelper

exit 0