#!/bin/bash
#Thu Jun 13 13:29:59 IST 2024
#Revision=1
#version=0.1
#script to install software on different flavours of OS 

echo "Script to install git"
echo "Installation started"

if [ "$(uname)" == "Linux" ]; then
    echo "This is a Linux based OS. Installing git"
    yum install git -y 

elif [ "$(uname)" == "Darwin" ]; then
    echo "This is a mac OS. Installing git"
    brew install git 

else
    echo "Not Installing"

fi








    
