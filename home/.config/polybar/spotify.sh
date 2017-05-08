#!/bin/bash

playerctl status &> /dev/null

if [ $? == 1 ]; then
  echo ""
elif [ "$(playerctl status)" == "Playing" ]; then
  artist=`exec playerctl metadata artist`
  title=`exec playerctl metadata title`
  echo "   $artist - $title"
elif [ "$(playerctl status)" == "Paused" ]; then
  artist=`exec playerctl metadata artist`
  title=`exec playerctl metadata title`
  echo "   $artist - $title"
else
  echo ""
fi

