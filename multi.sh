#!/bin/bash

SERVICE1=$1
SERVICE2=$2

if [ $# -gt 0 ]; then
    echo "Checking the status of $SERVICE1"
    service $SERVICE1 status >/dev/null
    if [ $? -eq 0 ]; then
        echo "$SERVICE1 is running successfully"
    else
        echo "$SERVICE1 is not running...Let's start"
        service $SERVICE1 start
    fi

    echo "Checking the status of $SERVICE2"
    service $SERVICE2 status >/dev/null
    if [ $? -eq 0 ]; then
        echo "$SERVICE2 is running successfully"
    else
        echo "$SERVICE2 is not running...Let's start"
        service $SERVICE2 start
    fi
else
    echo "You have given $# arguments...Give arguments.."
fi
