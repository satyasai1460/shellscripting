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
        echo -e "Sorry, Username ${GREEN}$USER${RESET} is already taken. Please pick a New Username"
    else
        echo -e "${GREEN}$USER${RESET} Username is available, Let's Create the user with ${USER}"
        #Adding the user with home directory and shell
        read -p "Do you want to create this user with username $USER (yes/no) :  " APPROVAL
        if [ "${APPROVAL}" = 'yes' -o "${APPROVAL}" = 'YES' -o "${APPROVAL}" = 'y' -o "${APPROVAL}" = 'Y' ]; then
            sudo useradd -m $USER --shell /bin/bash
        fi
        #Generating the password for the user
        PASSWORD_GEN=$(echo '!@#$%^&*()_' | fold -1 | shuf | head -1)
        PASSWORD="India@${RANDOM}${PASSWORD_GEN}"
        #Forcing the user to change the password
        echo "$USER:$PASSWORD" | sudo chpasswd
        #Forcing the user to reset the password at first login
        passwd -e $USER
        read -p "Does this user needs to be SUDO (yes/no) : " RESPONSE
        if [ "${RESPONSE}" = 'yes' -o "${RESPONSE}" = 'YES' -o "${RESPONSE}" = 'y' -o "${RESPONSE}" = 'Y' ]; then
            sudo usermod -aG sudo $USER
        fi
        echo -e "${GREEN}Successfully added the $USER with password : ${PASSWORD}${RESET}"
    fi
else
    echo "Please give atleast one argument"
fi
