!/bin/bash

read -p "Enter the Number:" NUM1

echo $NUM1

if [ $(expr $NUM1 % 2) -eq 0 ]; then
    echo "The given number $NUM1 is an EVEN Number"
else
    echo "The given number $NUM1 is an ODD Number"
fi
