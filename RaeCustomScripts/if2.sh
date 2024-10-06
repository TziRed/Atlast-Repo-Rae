#!/bin/bash
## This script will demonstrate an if-then conditional ##

echo -e "Choose between on of the following options [1 - 3]\n"
echo -e "1) CPU\n"
echo -e "2) RAM\n"
echo -e "3) RAM\n"
read choice
echo

if [[ $choice = 1 ]]; then
    echo "Here is your CPU Utilization:"
    uptime
elif [[ $choice = 2 ]]; then
    echo "Here is your RAM Utilization:"
    free -h
elif [[ $choice = 3 ]]; then
    echo "Here is your storage Utilization:"
    df -h
else
    echo "Please try again!"
    $0
fi