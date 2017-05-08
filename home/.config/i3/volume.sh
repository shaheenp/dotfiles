#!/bin/bash

if [ "$1" == "decrease" ]
then
    amixer -q set Master 6.3%- unmute
    TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f6 | sed 's/\(\[\|\]\)//g')
elif [ "$1" == "increase" ]
then
    amixer -q set Master 6.3%+ unmute
    TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f6 | sed 's/\(\[\|\]\)//g')
elif [ "$1" == "toggle-mute" ]
then
    amixer -q set Master toggle
    TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g')
else
    echo "Usage volume [decrease | increase | toggle-mute]\n"
fi

ID=$(cat ~/.config/i3/.dunst_volume)
if [ $ID > 0 ]
then
    dunstify -t 1 -p -r $ID "Volume: $TEXT" > ~/.config/i3/.dunst_volume
else
    dunstify -t 1 -p "Volume: $TEXT" > ~/.config/i3/.dunst_volume
fi

