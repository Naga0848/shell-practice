#!bin/bash


USERID=(id -u)
# I general we use id -u command in Linux to know the id of the user. But here in schell script we give this command to a variable called USERID.

# if it is a root user, then id is equal to 0

if [ $USERID -ne 0]
then 
    echo " Error :: Please run the script with the root access"
    exit 1 
else
    echo " You are running with root access"
fi

dnf install mysql -y

