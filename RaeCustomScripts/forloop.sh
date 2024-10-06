#!/bin/bash
## This script will demonstrate for loop ##

echo "What are your 5 favorite colors?"
read -p "Color 1: " Color1
read -p "Color 2: " Color2
read -p "Color 3: " Color3
read -p "Color 4: " Color4
read -p "Color 5: " Color5
Colors="$Color1 $Color2 $Color3 $Color4 $Color5"

for x in $Colors; do
    echo "$x is a cool Color also!"
    if [[ $x == "red" ]]; then
        echo "red is my favorite color also."
    else
        echo "But I have a different favorite color."
    fi
done