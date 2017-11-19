#!/usr/bin/env bash

# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u $USER -USR1 dunst

i3lock -n -e -i /home/shaheen/.config/i3/half_dome.png \
    --insidecolor=282828ff --ringcolor=ebdbb2ff --line-uses-inside \
    --keyhlcolor=8ec07cff --bshlcolor=d3869bff --separatorcolor=00000000 \
    --insidevercolor=282828ff --insidewrongcolor=282828ff \
    --ringvercolor=fabd2fff --ringwrongcolor=fb4934ff --indpos="80:h-80" \
    --indicator --radius=10 --veriftext="" --wrongtext="" \
    -k --timepos="2220:h-190" --timesize=36 \
    --timecolor=ebdbb2ff --timefont="SFMono" --timestr="%l:%M %p" \
    --datecolor=ebdbb2ff --datefont="SFMono" --datestr="%a %b %d" \
    --datesize=24

pkill -u $USER -USR2 dunst

