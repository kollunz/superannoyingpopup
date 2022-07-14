#!/bin/bash

version=$(/usr/bin/sw_vers  | grep ProductVersion | cut -d':' -f2 | awk '{gsub(/^[ \t]+|[ \t]+$/,"");print}')
  major=$(echo "${version}" | cut -d'.' -f1)
  minor=$(echo "${version}" | cut -d'.' -f2)
  patch=$(echo "${version}" | cut -d'.' -f3)

  if [[ -n ${version} ]] ; then
    echo -n "Detected macOS version: ${major}.${minor}.${patch}..."

    if [[ ${major} -lt 12 ]] ||
    { [[ ${major} -eq 12 ]] && [[ ${minor} -lt 4 ]] ; } ; then
      echo "Machine is NOT 12.4 or newer"
      else
      echo "Machine is 12.4 or newer"
      exit 0
    fi
  fi

currentUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ { print $3 }' )

/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType fs -title "VIZ IT" -heading "Hi $currentUser! " -description "VIZ IT is requiring you to update your Mac.

Please visit Self Service and run *Install macOS Monterey (macOS 12)*
This message will stop appearing shortly after upgrading.
If you have any questions or concerns, please email help@viz.com. 

This message will disappear shortly." -icon "/System/Library/PreferencePanes/SoftwareUpdate.prefPane/Contents/Resources/SoftwareUpdate.icns" & sleep 20

killall jamfHelper

exit 0
