#!bin/bash

USERID=(id -u)

if [ $USERID -ne 0 ]
then 
    echo "please run the script as a root user"
    exit 1
    else
    echo "you are running as a root user"
    
fi  