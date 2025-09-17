#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR :: Please execute script as a root user"
else
    echo "You are running as a root user"
fi


