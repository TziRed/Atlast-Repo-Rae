#!/bin/bash
## This script will demonstrate while loop ##

while true
do
    echo "Choose a number between 1-5"
    read choice
     if [[ $choice = 5 ]]; then
        echo "Correct! Thanks for playing."
        break
    fi
done