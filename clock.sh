#!/bin/bash

timezone=""

if [ -z "$1" ]
  then
    timezone="Asia/Tokyo"
else
    timezone="$1"
fi

display_time () {
  tput clear
  TZ=$timezone date +"%H : %M" | figlet
  TZ=$timezone cal
}

display_timezone () {
  cols=`tput cols`
  printf "%*s\n" $(((${#timezone}+$cols)/2)) "TZ = $timezone"
}

while true
  do
    tput civis        # Hide the cursor
    display_time      # Display clock and calendar
    display_timezone  # display timezone aligned in center
    sleep 1
done
