#!/bin/bash

timezone=""

if [ -z "$1" ]
  then
    timezone="Asia/Tokyo"
else
    timezone="$1"
fi

echo "$timezone"
while true; do tput clear;TZ=$timezone date +"%H : %M" | figlet ;TZ=$timezone cal; sleep 1; done
