#!/usr/bin/env bash

updates=$(checkupdates+aur 2> /dev/null | wc -l)

if [ $updates -gt 0 ]; then
    echo " $updates"
else
    echo ""
fi
