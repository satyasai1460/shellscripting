#!/bin/bash
# 1. Check if the user already exists.
# 2. If not, create the user with home dir and bash shell.
# 3. Generate a random password and assign it to the user. Eg: India@23456!
# 4. Force the user to reset the password.
# 5. Provide User sudo access.

USER=$1
if [ $# -gt 0 ]; then
    echo "Checking if $USER is already Exists"
else
    echo "Please give atleast one argument"
fi
