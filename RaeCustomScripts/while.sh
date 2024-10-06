#!/bin/bash
## This script will demonstrate while loop ##

echo "Let's create a never-ending hello world file"
echo "Would you like to add a line that says "Hello World"?"
echo "Type yes to add another line. Type anything else to stop."
echo
read choice

while [[ $choice == "yes" ]]; do
    echo "Adding another line .. "
    echo Hello World >> helloworld.txt
    echo "Would you like to add another line?"
    read choice
done

echo "Here are the contents of your helloworld.txt"
cat helloworld.txt