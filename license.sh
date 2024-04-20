#!/bin/bash
Current_Year=2024
DOB=$1
CurrentAge=$(expr $Current_Year - $DOB)
echo "Your Current Age is $CurrentAge"
if [ $CurrentAge -gt 18 ]; then
    echo "You are elecgible foe Driving License"
else
    echo "You are not Eligible for Driving License"
fi
