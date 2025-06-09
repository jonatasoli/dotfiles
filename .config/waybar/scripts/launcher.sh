#!/bin/bash
RESULT=$(echo -e "Applications\nWeb Search" | wofi --dmenu --prompt "Search:" --width 300 --height 150)

case $RESULT in
    "Applications") wofi --show drun ;;
    "Web Search") 
        QUERY=$(wofi --dmenu --prompt "Search Web:")
        [ -n "$QUERY" ] && xdg-open "https://www.google.com/search?q=${QUERY}"
    ;;
esac
