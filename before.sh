#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: You are not running as a root user, please run with root access in order to install anything"
    exit 1
else
    echo "You are running as a root user"
fi



dnf list installed mysql

if [ $? -ne 0 ]

then
    echo "MySQL is not installed, we are going to install it soon"

    dnf install mysql -y
    
if [ $? -eq 0 ]

then 
    echo "MySQL is successfully installed"
else 
    echo "MySQL is not properly installed"
    exit 1
fi
else 
    echo "MySQL is already installed"
fi