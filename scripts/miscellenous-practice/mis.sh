#!/bin/bash
#Fri Jun 14 12:00:39 IST 2024
#version=0.1
#revision=1

read username

echo "Hello $username Welcome, to the system!!"

DATES=$(date)

echo "The script is being run on:\n$(date)\n"

#show the time when the user is up and last login of the user 

UPTIMES=$(uptime)
LAST_LOGIN=$(last)


echo "Uptime of the servers: $UPTIMES"

echo "Last login of users: $LAST_LOGIN"

DISK_SPACE=$(df -h)

echo "Disk space of the system : $DISK_SPACE"


CPU_PROCESS=$(top)

echo "Top CPU processes of the system : $CPU_PROCESS









