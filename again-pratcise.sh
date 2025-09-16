#Again I am practising shell scripting



USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "please run the script as a root user"
    exit 1
    else
    echo "you are running as a root user"
fi


dnf list installed mqsql

if [ $? -eq 0 ]
then
    echo "MySQL is installed"
    exit 1
    else
    echo "MySQL is not installed"
    echo "going to install MySQL"
fi    

dnf install mysql -y

if [$? -eq 0 ]
then
    echo "MySQL is installation is successfull"
    exit 1
    else
    echo "MySQL installation is failure"
    exit 1
fi    


