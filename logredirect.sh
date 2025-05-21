#!/bin/bash

echo "This script is for practising functions, logs and colour"
echo "Welcome for software installation"

#Colour Variables"
R='\e[31m'
G='\e[32m'
Y='\e[33m'
C='\e[0m'

# echo -e "${R} Hello This is red ${C}"
# echo -e "${G} Hello This is Green ${C} "
# echo -e "${Y} Hello This is Yellow ${C} "
# echo -e "${C} Hello This is clear ${C}"

# echo "Hello how are you ?"

# VERIABLES

USERID=$(id -u)
LOG_FOLDER="/var/log/shell_scripts/"
LOG_SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$LOG_SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER

#FUNCTION
VALIDATE() 
{
    if [ $1 -ne 0 ]
    then 
        echo -e " ${R} $2 installing failed.. checking the logs.. exiting ${C}"
    else
        echo -e "${G} $2 is successfully installed ${C}"
    fi
}

#Checking if the user is root or not

if [ $USERID -ne 0 ]
then
    echo -e "${R} You need ROOT USER permissions to run this script ${C} " 
    exit 1
else 
    echo -e "${G} Proceeding to intstall the softwares MYSQL, PYTHON & NGINX ${C} "
fi

#Check and install mysql
dnf list instslled mysql 

if [ $? -ne 0 ]
then
    echo -e " ${G} MYSQL doesn't exist, Hence installing it ${C} "
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? mysql

else
    echo -e " ${Y} MYSQL is alredy installed, no action required ${C}"

fi

#Check and install nginx
dnf list instslled nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo -e " ${G} NGINX doesn't exist, Hence installing it ${C} "
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? nginx

else
    echo -e " ${Y} NGINX is alredy installed, no action required ${C}"

fi

#Check and install Python
dnf list instslled python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo -e " ${G} PYTHON doesn't exist, Hence installing it ${C} "
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? python3

else
    echo -e " ${Y} python3 is alredy installed, no action required ${C}"

fi