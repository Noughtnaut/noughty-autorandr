#! /bin/bash

noughtyRoot="$(dirname "$0")/noughty" # This is relative to the origin script, which is outside the folder

function popup() {
    local icon=$1
    local summary=$2
    local body=$3
    local timeout=$4

    # Validate and format icon    
    case "$icon" in
      "info" | "warning" | "error")
        icon=" -i dialog-$icon"
        ;;
      "save" | "load")
        icon=" -i media-floppy"
        ;;
      "display")
        icon=" -i display"
        ;;
      "audio-in")
        icon=" -i audio-input-microphone"
        ;;
      "audio-out")
        icon=" -i audio-speakers"
        ;;
      "")
        icon=""
        ;;
      *)
        icon=" -i $icon"
        ;;
    esac

    # Validate and format time-out
    if [ -n "$timeout" ] && [ "$timeout" -eq "$timeout" ] 2>/dev/null; then
      timeout=" --expire-time=${timeout}000"
    else
      timeout=""
    fi

    # Notify in GUI
    notify-send $icon $timeout "$summary" "$body"
    # Notify in CLI
    echo "* $summary: $body"
}

function store() {
    local key=$1
    if [ -z "$2" ]; then
        local value=""
    else
        local value=$2
    fi
    local datafile="$noughtyRoot/$key.dat"
    if touch "$datafile" ; then
        if [ "$value" = "" ]; then
            rm "$datafile"
        else
            echo "$value" > "$datafile" # Store given value
        fi
    else
        echo "Could not store key '$key': not writeable" 1>&2
        exit 1
    fi
}

function recall() {
    local datafile="$noughtyRoot/$1.dat"

    # Read last profile (if any)
    if [ -e "$datafile" ]; then
        if [ -r "$datafile" ]; then
            read -r value < "$datafile"
            result=$value
        else
            # Return error
            "Could not recall key '$key': not readable" 1>&2
            exit 1
        fi
    fi
}
