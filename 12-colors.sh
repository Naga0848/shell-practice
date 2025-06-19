#!bin/bash


USERID=$(id -u)
# In general we use id -u command in Linux to know the id of the user. But here in shell script we give this command to a variable called USERID.

# if it is a root user, then id is equal to 0

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1 #give other than 0 upto 127. If we give exit status, the shell will stop executing the other lines of commands if the previous line is having any error
else
    echo "You are running with root access"
fi


# This is a VALIDATE function and takes input as exit status. If exit status is 0 means, the command they wanted to execute is successful. So, we are mentioning as echo "Installing $2 is ... SUCCESSFUL" and if exit status is not equal to 0, then we say echo "Installing $2 is FAILURE" because there might be a wrong in the command. Here $2 means the software name which we want to install(nginx, python and mysql)

VALIDATE(){
if [ $? -eq 0 ]
then
    echo -e "$G Installing $2 is ... SUCCESSFUL $N"
else
    echo "Installing $2 is FAILURE"
    exit 1
fi 
}

dnf list installed mysql  # to check whether mysql is installed or not. 
                          # Here we can run dnf list installed mysql and echo $? in our linux machine. If mysql is already installed, $? returns 0. If not it will be a number between 1-127.
if [ $? -ne 0 ]
then
    echo "Mysql is not installed... going to install"
    dnf install mysql -y
    VALIDATE $? "Mysql"
else
    echo "Mysql is already installed...nothing to do"
fi

# Installing nginx
dnf list installed nginx  # to check whether nginx is installed or not. 
                          # Here we can run dnf list installed nginx and echo $? in our linux machine. If nginx is already installed, $? returns 0. If not it will be a number between 1-127.
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed...nothing to do"
fi


# Installing python3
dnf list installed python3  # to check whether python3 is installed or not. 
                          # Here we can run dnf list installed python3 and echo $? in our linux machine. If python3 is already installed, $? returns 0. If not it will be a number between 1-127.
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 is already installed...nothing to do"
fi
# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "Installing Mysql is ... SUCCESSFUL"
# else
#     echo "Installing Mysql is FAILURE"
#     exit 1
# fi

#Basic steps to install mysql via schell scripting
#1) check if u are executing as a root user or not
#2) check if mysql is installed or not, if not installed then proceed to install, otherwise show error.
