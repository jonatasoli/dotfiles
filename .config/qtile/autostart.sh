#! /bin/bash 
# lxsession &
picom --config ~/.config/picom/picom.conf -b &
# nitrogen --restore &
feh --randomize --bg-fill /home/feanor/wallpappers/*
volumeicon &
nm-applet &
blueman-applet &
xautolock -time 60 -locker slock &
udiskie &
xfce4-clipman &
mate-power-manger &
flameshot &
if [ -z "$SSH_AUTH_SOCK" ]; then
    # Inicie o ssh-agent se ele não estiver em execução
    eval "$(ssh-agent -s)"
fi
