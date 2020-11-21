#! /bin/bash

noughtyRoot="$(dirname "$0")/noughty" # This is relative to the origin script, which is outside the folder
. "$noughtyRoot/functions.sh"

popup display "noughty autorandr" "Profile '$AUTORANDR_CURRENT_PROFILE' selected." 11

# Restore dconf snapshot for the new profile
snapshot="$AUTORANDR_PROFILE_FOLDER/snapshot.dconf"
if [ -f "$snapshot" ] ; then
    if [ -r "$snapshot" ] ; then
        if dconf load / < "$snapshot" ; then
            popup save "noughty autorandr" "Restored dconf snapshot for '$AUTORANDR_CURRENT_PROFILE'."
        else
            popup warning "noughty autorandr" "Failed to restore dconf snapshot for the profile."
        fi
    else
        popup warning "noughty autorandr" "Failed to restore dconf snapshot for the profile:\nA snapshot exists, but is not readable."
    fi
fi
