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

if [ $? -eq 0 ]
then
    echo "Mysql is already istalled"
    