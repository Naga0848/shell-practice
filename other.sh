#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR :: Please execute script as a root user"
    exit 1
else
    echo "You are running as a root user"
fi
VALITADTE(){
dnf install mysql -y 
if [ $1 -eq 0 ]
then
    echo "$2 is installed properly"
else
    echo "$2 is not installed properly"
fi
}

dnf list installed mysql -y 

if [ $? -ne 0 ]
then
    echo "Mysql is not installed, going to install"
    VALIDATE $? "Mysql"

else
    echo "mysql is already installed...."
    exit 1
fi


dnf list installed nginx -y 

if [ $? -ne 0 ]
then
    echo "nginx is not installed, going to nginx"
    VALIDATE $? "nginx"

else
    echo "nginx is already installed...."
    exit 1
fi

