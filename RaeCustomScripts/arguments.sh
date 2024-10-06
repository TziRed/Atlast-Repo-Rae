#!/bin/bash
## The purpose of this script to create a folder and file ##
## Run this script with a name for your folder and file ##
## USAGE: ./createfile.sh [foldername] [filename]

echo "Your script's name is $0"
echo "We will create a folder called $1"
echo "In this folder, we will create a file called $2"

mkdir $1
touch $1/$2

echo
echo "Let's run some tests to verify our script was successful"
echo
ls -l
echo
ls -l $1