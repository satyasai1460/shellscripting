#!/bin/bash
for file in $@; do
    if [ -f /tmp/$file ]; then
        echo "${file} Exists"
    else
        echo "${file} not exist,...Let's Create"
        echo $(date) >/tmp/$file
    fi
done
