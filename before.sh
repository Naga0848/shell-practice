#!/bin/bash

USERID=$(id -u)

if [ USERDID -ne 0 ]
then 
    echo "ERROR:: You are not runnignas a root user"
else
    echo "You are running as a root user"
    exit 1
fi