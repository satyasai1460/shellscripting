#!/bin/bash
# 1. Check if the user already exists.
# 2. If not, create the user with home dir and bash shell.
# 3. Generate a random password and assign it to the user. Eg: India@23456!
# 4. Force the user to reset the password.
# 5. Provide User sudo access.

USER=$1
EXISTING_USER=$(cat /etc/passwd | awk -F ':' '{print $1}' | grep -i $USER)
PASSWORD_GEN=$(echo $RANDOM '!@#$%^&*()_' | fold -1 | shuf | head -1)
PASSWORD="India@${RANDOM}${PASSWORD_GEN}"
if [ $# -gt 0 ]; then
    echo "Checking if $USER is already Exists"
    if [ "${USER}" = "${EXISTING_USER}" ]; then
        echo "Sorry, Username $USER is already taken. Please pick a New Username"
    else
        echo "$USER Username is available, Let's Create the user with ${USER}"
        #Adding the user with home directory and shell
        sudo useradd -m $USER --shell /bin/bash
        #Generating the password for the user
        PASSWORD="India@${RANDOM}${PASSWORD_GEN}"
        #Forcing the user to change the password
        echo "$USER:$PASSWORD" | sudo chpasswd
        #Forcing the user to reset the password at first login
        passwd -e $USER
        sudo usermod -aG sudo $USER
        echo "Successfully added the user with password"
    fi
else
    echo "Please give atleast one argument"
fi
