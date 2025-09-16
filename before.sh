#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: You are not runnignas a root user"
    exit 1
else
    echo "You are running as a root user"
fi