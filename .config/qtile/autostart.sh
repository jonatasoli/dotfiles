#! /bin/bash 
# lxsession &
picom --config ~/.config/picom/picom.conf -b &
# nitrogen --restore &
feh --randomize --bg-fill /home/feanor/wallpappers/*
volumeicon &
nm-applet &
blueman-applet &
xautolock -time 60 -locker slock &
# internxt-drive &

