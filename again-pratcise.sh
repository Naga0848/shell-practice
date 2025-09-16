#Again I am practising shell scripting



USERID=$(id -u)

if [USERDID -ne 0]
then 
    echo "please run the scripta as a root user"
    else
    echo "you are running as a root user"

fi
dnf list installed mqsql

if [$? -eq 0 ]
then
    echo "MySQL is installed"
    else
    echo "MySQL is not installed"
fi    