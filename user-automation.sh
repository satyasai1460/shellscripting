#!/bin/bash

# Check if the user is already exists
# If not, Create a user with home directory and bash shell
# Generate a random password and assign it to the user
# Force the user to reset the password
# Adding the user to the sudoers file

USER1=$1

if [ $# -gt 0 ]; then
    echo "Checking if the user Exists or Not"
    echo " "
    EXISTING_USER=$(cat /etc/passwd | grep -i $USER1 | cut -d ':' -f1)
    if [ "${EXISTING_USER}" = "${USER1}" ]; then
        echo "$USER1 already exists, Please try with different username."
    else
        echo "Username $USER1 is available...Lets create the user with username $USER1"
        sudo useradd $USER1 -m --shell /bin/bash
        #Generating a Random Password for the user
        SPEC=$(echo '!@#$%^&*()_' | fold -1 | shuf | head -1)
        PASSWORD="India@${RANDOM}${SPEC}"
        echo "$USER1:$PASSWORD" | sudo chpasswd
        #Forcing the user to change the password on Next Login
        passwd -e $USER1
        #Adding the user to sudoers file
        
        echo "Successfully created the user with the username $USER1 and password $PASSWORD"
        read -p "Does this need SUDO acess??(Yes/No):" RESPONSE
        if [ "${RESPONSE}" = 'yes' -o "${RESPONSE}" = 'YES' -o "${RESPONSE}" = 'y' -o "${RESPONSE}" = 'Y' ]
        then
        sudo usermod -aG sudo $USER1
        echo "Successfully given Sudo access to $USER1"
    fi
else
    echo "Please give atleast 1 Argument"
fi
