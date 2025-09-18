#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access"
fi

#validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is ... SUCCESS"
    else
        echo "Installing $2 is ... FAILURE"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install mysql -y
    # if [ $1 -eq 0 ]
# then
    # echo "Installing Mysql is ... SUCCESS"
# else
    # echo "Installing mysql is ... FAILURE"
    # exit 1
# fi
    VALIDATE $1 "mysql"
else
    echo "MySQL is already installed...Nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    # if [ $1 -eq 0 ]
# then
    # echo "Installing nginx is ... SUCCESS"
# else
    # echo "Installing nginx is ... FAILURE"
    # exit 1
# fi
    VALIDATE $2 "nginx"
else
    echo "nginx is already installed...Nothing to do"
fi



dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    # if [ $1 -eq 0 ]
# then
    # echo "Installing python3 is ... SUCCESS"
# else
    # echo "Installing python3 is ... FAILURE"
    # exit 1
# fi
    VALIDATE $1 "python3"
else
    echo "python3 is already installed...Nothing to do"
fi

