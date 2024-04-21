#!/bin/bash

# Check if the user is already exists
# If not, Create a user with home directory and bash shell
# Generate a random password and assign it to the user
# Force the user to reset the password

USER1=$1

if [ $# -gt 0 ]; then
    echo "Check if the user Exists"
    EXISTING_USER=$(cat /etc/passwd | grep -i ubuntu | cut -d ':' -f1)
    if [ EXISTING_USER = $USER1 ]; then
        echo "$USER1 already exists, Please try with different username."
    else
        echo "Username $USER1 is available...Lets create the user with username $USER1"
        # useradd $USER1 -m --shell /bin/bash
    fi
else
    echo "Please give atleast 1 Argument"
fi
