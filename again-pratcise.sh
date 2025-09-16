
#!bin/bash



#Again I am practising shell scripting



USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "please run the script as a root user"
    exit 1
    else
    echo "you are running as a root user"
    
fi


dnf list installed mysql

if [ $? -eq 0 ]
then
    echo "MySQL is already installed"
  
    else
    echo "There is nothing to install"
    
fi    


dnf list installed python3
if [ $? -eq 0 ]
then
    echo "Python is not installed"
  
    else
    echo "we are going to install python3"
    
fi    

dnf install python3 -y

if [ $? -ne 0 ]
then
    echo "Python3 is not installed"
    exit 1
    else
    echo "Installing python3 is successful"
    exit 1
fi   



