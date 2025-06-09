#!/bin/bash
if bluetoothctl show | grep -q "Powered: yes"; then
    echo "ON"
else
    echo "OFF"
fi
