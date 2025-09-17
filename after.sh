#!bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
    echo "You are not running as a root user"
    exit 1

else 
    echo "You are running as a root user"

fi

dnf list installed mysql

if [ $? -eq 0 ]

then 
    echo "Mysql is already installed"
    
else

    echo "Install mysql"

    dnf install mysql -y

if [ $? -eq 0 ]

then 
    echo "Mysql is installed"
else
    echo  "mysql is not installed"
    exit 1

fi

fi




    