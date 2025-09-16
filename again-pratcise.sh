#Again I am practising shell scripting

dnf list installed mqsql

if [$? -eq 0 ]
then
    echo "MySQL is installed"
    else
    echo "MySQL is not installed"
fi    