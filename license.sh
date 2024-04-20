#!/bin/bash
Current_Year=2024
DOB=$1
CurrentAge=$(expr $Current_Year - $DOB)
echo "Your Current Age is $CurrentAge"

if [ $CurrentAge -lt 18 ]; then
    echo "You are not eligible for Driving License"
elif [ $CurrentAge -gt 18 -a $CurrentAge -lt 60 ]; then
    echo "You are Eligible for Driving License"
elif [ $CurrentAge -gt 60 -a $CurrentAge -lt 100 ]; then
    echo "You are Eligible for Driving License But Fitness and Eyesight Certificates are required"
else
    echo "Invalid Age"
fi
