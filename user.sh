#!/bin/bash
GREEN='\033[0;32m'
RESET='\033[0m' # Reset color back to default

# 1. Check if the user already exists.
# 2. If not, create the user with home dir and bash shell.
# 3. Generate a random password and assign it to the user. Eg: India@23456!
# 4. Force the user to reset the password.
# 5. Provide User sudo access.

USER=$1
if [ $# -gt 0 ]; then
    echo -e "Checking if ${GREEN}$USER${RESET} is already Exists"
    EXISTING_USER=$(cat /etc/passwd | grep -i $USER | awk -F ':' '{print $1}')
    if [ "${USER}" = "${EXISTING_USER}" ]; then
        echo "Sorry, Username ${GREEN}$USER${RESET} is already taken. Please pick a New Username"
    else
        echo -e "${GREEN}$USER${RESET} Username is available, Let's Create the user with ${USER}"
        #Adding the user with home directory and shell
        sudo useradd -m $USER --shell /bin/bash
        #Generating the password for the user
        PASSWORD_GEN=$(echo $RANDOM '!@#$%^&*()_' | fold -1 | shuf | head -1)
        PASSWORD="India@${RANDOM}${PASSWORD_GEN}"
        #Forcing the user to change the password
        echo "$USER:$PASSWORD" | sudo chpasswd
        #Forcing the user to reset the password at first login
        passwd -e $USER
        sudo usermod -aG sudo $USER
        echo "${GREEN}Successfully added the $USER with password${RESET}"
    fi
else
    echo "Please give atleast one argument"
fi
