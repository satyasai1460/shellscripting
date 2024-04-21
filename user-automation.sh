#!/bin/bash

# Check if the user is already exists
# If not, Create a user with home directory and bash shell
# Generate a random password and assign it to the user
# Force the user to reset the password

USER1=$1

if [ $# -gt 0 ]; then
    echo "Check if the user Exists"
else
    echo "Please give atleast 1 Argument"
fi
