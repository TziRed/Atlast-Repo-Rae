#!/bin/bash
## The purpose of this script to send a greeting to any user ##
## We will use variables, inline commands, and exisitng env variables ##
echo "Hello, this is the Greetings 2.0 script"

year=$(date | awk '{print $6}')
month=$(date | awk '{print $2}')

echo
echo "Hello $(whoami), we wish you a successful $year!"
echo "Enjoy the month of $month"
echo "You will be staying in $HOME"