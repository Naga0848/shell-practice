#!bin/bash


USERID=$(id -u)
# I general we use id -u command in Linux to know the id of the user. But here in schell script we give this command to a variable called USERID.

# if it is a root user, then id is equal to 0

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 #give other than 0 upto 127. If we give exit status, the shell will stop executing the other lines of commands if the previous line is having any error
else
    echo "You are running with root access"
fi

dnf list installed mysql  # to check whether mysql is installed or not. 
                          # Here we can run dnf list installed mysql and echo $? in our linux machine. If mysql is already installed, $? returns 0. If not it will be a number between 1-127.
if [ $? -ne 0 ]
then
    echo "Mysql is not installed... going to install"
    dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "Installing Mysql is ... SUCCESSFUL"
else
    echo "Installing Mysql is FAILURE"
    exit 1
fi
else
    echo "Mysql is already installed...nothing to do"
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
