#!/bin/bash
## This script will demonstrate an if-then conditional ##

echo "choose a number between 1-100"
read number
echo

if [[ $number -gt 100 ]]; then
    echo "Please follow the prompt!"
    ./if1.sh

elif [[ $number -eq 100 ]]; then
    echo " You chose the number 100!"

elif [[ $number -gt 50 ]]; then
    echo " You have a large number"

    if [[ $number -lt 75 ]]; then
    echo " Your number is between 50 and 75"
    else
    echo " Your number is between 75 and 100"
    fi

else
    echo "You have a small number!"

fi
