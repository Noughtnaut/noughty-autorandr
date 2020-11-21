#! /bin/bash

#############################################
exit # Only save dconf snapshot on postsave #
#############################################
# (This avoids accidental destruction if a profile switch failed)

originDir="$(dirname "$0")"
noughtyRoot="$originDir/noughty"
. "$noughtyRoot/functions.sh"

# Read last profile (if any)
recall lastprofile
profile=$result

# Only do work if actually switching to a new profile (not just reloading the existing)
if [ "$profile" != "$AUTORANDR_CURRENT_PROFILE" ] ; then
    # Save dconf snapshot for the old profile
    snapshot="$profile/snapshot.dconf"
    if touch "$snapshot" ; then
        if [ -w "$snapshot" ] ; then
            if dconf dump / > "$snapshot" ; then
                popup save "noughty autorandr" "Saved dconf snapshot for '$profile'."
            else
                popup warning "noughty autorandr" "Failed to save dconf snapshot for the previous profile:\nCould not write to the snapshot file."
            fi
        else
            popup warning "noughty autorandr" "Failed to save dconf snapshot for the previous profile:\nCould not create the snapshot file."
        fi
    fi

    # Store new profile for next time
    store lastprofile "$AUTORANDR_CURRENT_PROFILE"
fi