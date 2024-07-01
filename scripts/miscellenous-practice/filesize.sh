#!/bin/bash
#Thu Jun 27 00:14:57 IST 2024
#revision=1
#version=0.1

echo "This script will find 10 biggest files and write the output to a file."

path=$1
echo $path

du -ah $path | sort -hr | head -n 5 > /tmp/filesize.txt

echo "This is the list of big files in tbe filesystem $path"

cat /tmp/filesize.txt