#! /bin/bash

noughtyRoot="$(dirname "$0")/noughty" # This is relative to the origin script, which is outside the folder
. "$noughtyRoot/functions.sh"

# Save dconf snapshot for the new profile
snapshot="$AUTORANDR_PROFILE_FOLDER/dconf.snapshot"
if touch "$snapshot" ; then
    if [ -w "$snapshot" ] ; then
        if dconf dump / > "$snapshot" ; then
            popup save "noughty autorandr" "Saved dconf snapshot for '$AUTORANDR_CURRENT_PROFILE'."
        else
            popup warning "noughty autorandr" "Failed to save dconf snapshot for the new profile:\nCould not write to the snapshot file."
        fi
    else
        popup warning "noughty autorandr" "Failed to save dconf snapshot for the new profile:\nCould not create the snapshot file."
    fi
fi

# Save default printer for the new profile
snapshot="$AUTORANDR_PROFILE_FOLDER/default-printer.snapshot"
if touch "$snapshot" ; then
    if [ -w "$snapshot" ] ; then
        if lpstat -d | awk '{ print $NF }' > "$snapshot" ; then
            popup printer "noughty autorandr" "Saved default printer for '$AUTORANDR_CURRENT_PROFILE'."
        else
            popup warning "noughty autorandr" "Failed to save default printer for the new profile:\nCould not write to the snapshot file."
        fi
    else
        popup warning "noughty autorandr" "Failed to save default printer for the new profile:\nCould not create the snapshot file."
    fi
fi
