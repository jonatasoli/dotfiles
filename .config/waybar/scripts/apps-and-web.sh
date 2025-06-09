#!/bin/bash
choice=$(echo -e "1. Apps\n2. Web Search" | wofi --dmenu --prompt "Choose:" --width 300 --height 150)

case $choice in
    "1. Apps") wofi --show drun ;;
    "2. Web Search") 
        query=$(wofi --dmenu --prompt "Search Web:")
        [ -n "$query" ] && xdg-open "https://www.google.com/search?q=${query}"
    ;;
esac
