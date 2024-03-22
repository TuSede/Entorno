#!/bin/sh

IFACEeth=$(/usr/sbin/ifconfig | grep eth0 | awk '{print $1}' | tr -d ':')
STATUSeth=$(/usr/sbin/ifconfig eth0 |grep -Eo '([0-9]{1,3}[\.]){3}[0-9]{1,3}')

#IFACEwlan=$(/usr/sbin/ifconfig | grep wlan0 | awk '{print $1}' | tr -d ':')
#STATUSwlan=$(/usr/sbin/ifconfig wlan0 |grep -Eo '([0-9]{1,3}[\.]){3}[0-9]{1,3}')


if [ "$STATUSeth" != -z ] && [ "$IFACEeth" = "eth0" ]; then
        echo "%{F#FF0040}   %{F#2495e7} %{F#e2ee6a}$(/usr/sbin/ifconfig eth0 |grep "inet " | awk '{ print $2}')%{u-}"
#elif [ "$STATUSwlan" != -z ] && [ "$IFACEwlan" = "wlan0" ]; then
#        echo "%{F#FF0040}   %{F#2495e7} %{F#e2ee6a}$(/usr/sbin/ifconfig wlan0 |grep "inet " | awk '{ print $2}')%{u-}"
else
        echo "%{F#FF0040}  睊%{u-}%{F-}  Disconnected"
fi
