#!bin/bash

USERID=$(id -u)
# In general we use id -u command in Linux to know the id of the user. But here in shell script we give this command to a variable called USERID.

# if it is a root user, then id is equal to 0

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# In generally logs were stored at /var/log
# But we are creating a directory here to store our shell-script logs
LOGS_FOLDER="/var/log/shellscript-logs"
# According to the special variables of schell-scripting, we can get the script name by using $0

SCRIPT_NAME=$(echo $0 | cut -d "." -f1)

# From the above command - $0 indicates 13-logs.sh and post that we use a cut command and we get the output as 13-logs and it is stored in SCRIPT_NAME.

LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"   # finallt the log name is 13-logs.log

PACKAGES=("mysql" "python" "nginx" "httpd")

# We are creating the LOGS_FOLDER from the script itself. If we run the script multiple times, it througs an error that already file is created. So, we use an option called "-p" which creates a folder if not created and leaves as it is if it is already created. So there is no probability of getting error while running the script.

mkdir -p $LOGS_FOLDER

echo "script started executing at : $(date)" &>>$LOG_FILE

# For example, if we try to print the date in linux machine,  it gives different timestamp at different times when we type date. So, we can store the output of the date command when it is printed. And here we are storing the script starting time at LOG_FILE
# From the above command we are storing the script starting tome at LOG_FILE

# And finally, we are storing th outuput of every command in $LOG_FILE

# Here all the logs are stored at LOG_FILE and nothing is displayed on the screen. To avoid this we are using a tee command where ever we want the output on the screen and replace &>>$LOG_FILE with | tee -a $LOG_FILE
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
    exit 1 #give other than 0 upto 127. If we give exit status, the shell will stop executing the other lines of commands if the previous line is having any error
else
    echo "You are running with root access" &>>$LOG_FILE
fi


# This is a VALIDATE function and takes input as exit status. If exit status is 0 means, the command they wanted to execute is successful. So, we are mentioning as echo "Installing $2 is ... SUCCESSFUL" and if exit status is not equal to 0, then we say echo "Installing $2 is FAILURE" because there might be a wrong in the command. Here $2 means the software name which we want to install(nginx, python and mysql)

VALIDATE(){
if [ $? -eq 0 ]
then
    echo -e " Installing $2 is ...$G SUCCESSFUL $N" | tee -a $LOG_FILE
else
    echo "Installing $2 is $R FAILURE $N" &>>$LOG_FILE
    exit 1
fi 
}

for package in ${PACKAGES [@]}
do 
dnf list installed $package &>>$LOG_FILE  # to check whether mysql is installed or not. 
                          # Here we can run dnf list installed mysql and echo $? in our linux machine. If mysql is already installed, $? returns 0. If not it will be a number between 1-127.
if [ $? -ne 0 ]
then
    echo "$package is not installed... going to install" | tee -a $LOG_FILE
    dnf install $package -y
    VALIDATE $? "$package"
else
    echo -e "$package is already installed...$R nothing to do $N" | tee -a $LOG_FILE # As mysql is already is installed, it is displayed in Red color
fi

done
