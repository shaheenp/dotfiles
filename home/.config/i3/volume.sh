#!/bin/bash

getText() {
    local FIELD=$1
    amixer sget Master | tail -1 | cut -d' ' -f${FIELD} | sed 's/\(\[\|\]\)//g'
}

main() {

    # range is 0-127; 127/16 ~= 8
    local INT=8
    local ACTION=$1
    local DEC="decrease"
    local INC="increase"
    local MUTE="toggle-mute"

    if [ $ACTION == $DEC ]
    then
        amixer -q set Master ${INT}- unmute
        local TEXT=$(getText 6)
    elif [ $ACTION == $INC ]
    then
        amixer -q set Master ${INT}+ unmute
        local TEXT=$(getText 6)
    elif [ $ACTION == $MUTE ]
    then
        amixer -q set Master toggle
        if [ $(getText 8) == "on" ]
        then
            local TEXT=$(getText 6)
        else
            local TEXT="muted"
        fi
    else
        echo "Usage volume [$DEC | $INC | $MUTE]\n"
    fi

    local ID=$(cat ~/.config/i3/.dunst_volume)
    if [ $ID > 0 ]
    then
        dunstify -t 1 -p -r $ID "Volume: $TEXT" > ~/.config/i3/.dunst_volume
    else
        dunstify -t 1 -p "Volume: $TEXT" > ~/.config/i3/.dunst_volume
    fi

}

main $@

