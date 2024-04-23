#!/bin/bash
# 1. Check if the user already exists.
# 2. If not, create the user with home dir and bash shell.
# 3. Generate a random password and assign it to the user. Eg: India@23456!
# 4. Force the user to reset the password.
# 5. Provide User sudo access.

USER=$1
EXISTING_USER=$(cat /etc/passwd | awk -F ':' '{print $1}' | grep -i satya)
if [ $# -gt 0 ]; then
    echo "Checking if $USER is already Exists"
    if [ ${USER} = $EXISTING_USER ]; then
        echo "Sorry, Username $USER is already taken, Please pick a New Username"
    else
        echo "$USER Username is available, Let's Create the user with ${USER}"
    fi
else
    echo "Please give atleast one argument"
fi
