#!bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
    echo "You are not running as a root user"
    exit 1

else 
    echo "Yo are running as a root user"

fi



    