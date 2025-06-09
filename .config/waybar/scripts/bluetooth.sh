#!/bin/bash
if bluetoothctl show | grep -q "Powered: yes"; then
    echo ""
else
    echo ""
fi
