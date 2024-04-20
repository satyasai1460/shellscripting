#!/bin/bash
Current_Year=2024
DOB=$1

if [ $(expr $Current_Year - $DOB) -gt 18]; then
    echo "You are elecgible foe Driving License"
else
    echo "You are not Eligible for Driving License"
fi
