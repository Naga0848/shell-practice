#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR :: Please execute script as a root user"
    exit 1
else
    echo "You are running as a root user"
fi

dnf list installed mysql -y 

if [ $? -ne 0 ]
then
    echo "Mysql is not installed, going to install"

else
    echo "mysql is already installed"
    exit 1
fi

