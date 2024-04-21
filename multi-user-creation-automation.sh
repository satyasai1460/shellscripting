#!/bin/bash
# 1. Check if the user already exists.
# 2. If not, create the user with home dir and bash shell.
# 3. Generate a random password and assign it to the user. Eg: India@23456!
# 4. Force the user to reset the password.
# 5. Provide User sudo access.
if [ $# -gt 0 ]; then
    for USERNAME in $@; do
        USER=$(echo $USERNAME | tr '[:upper:]' '[:lower:]')
        #if [[ $USER =~ ^[a-zA-Z]+$ ]]; then
        if [[ "${USER}" =~ ^[a-zA-Z][a-zA-Z][a-zA-Z][0-9][0-9][0-9]$ ]]; then
            echo "Check If The User Already Exists."
            EXISTING_USER=$(cat /etc/passwd | grep -w $USER | cut -d ':' -f1)
            if [ "${EXISTING_USER}" = "${USER}" ]; then
                echo "$USER already exist in the machine. Try a diffrent username."
            else
                echo "Lets Create User $USER"
                sudo useradd -m $USER --shell /bin/bash
                #Generating Random Password
                SPEC=$(echo '!@#$%^&*()_' | fold -1 | shuf | head -1)
                PASSWORD="India@${RANDOM}${SPEC}"
                echo "$USER:$PASSWORD" | sudo chpasswd
                #Forcing user to reset the password on first login.
                passwd -e $USER
                echo "Successfully Create $USER with password $PASSWORD"
                read -p "Does This User Needs To be SUDO(type yes/no):" RESPONSE
                if [ "${RESPONSE}" = "yes" -o "${RESPONSE}" = "Yes" -o "${RESPONSE}" = "Y" -o "${RESPONSE}" = "y" ]; then
                    sudo usermod -aG sudo $USER
                fi

            fi
        else
            echo "The Username must container ALPHABETS Only"
        fi
    done
else
    echo "It seems no Args are given. Please provide username."
fi
