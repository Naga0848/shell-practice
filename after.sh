#!bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
    echo "You are not running as a root user"
    exit 1

else 
    echo "Yo are running as a root user"

fi

dnf list installed mysql

if [ $? -eq 0 ]

then 
    echo "Mysql is already installed"
    exit
else

    echo "Install mysql"
    exit 1

fi




    