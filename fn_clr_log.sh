#!/bin/bash
USERID=$(id -u)

#Colours
RED='\e[31m'
GREEN='\e[32m'
RESET='\e[0m'
YELLOW='\e[33m'
BLUE='\e[34m'

#for Log capture
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=$($LOG_FOLDER/$LOG_SCRIPT_NAME.log)

mkdir -p $LOG_FOLDER &>> $LOG_FILE

echo "Script stated executing at $(date)" &>>$LOG_FILE

#Functions

VALIDATE() { 
    if [ $1 -ne 0 ]
    then 
        echo -e "${RED} $2 installation failed aborting the installation"
        exit 1
    else 
        echo -e "${GREEN} $2 Installation is successful"
    fi
}

echo -e "${YELLOW} Hi You are about to install ${BLUE} MYSQL, NGINX, PYTHON3 ${RESET}"
echo "lets start the process"

#checking if the user has root priviliages or not

if [ $USERID -ne 0 ]
then 
    echo -e "${RED} You are not logged in as root user, you can not install, exiting.....${RESET}" &>> $LOG_FILE
    exit 1
else 
    echo -e "${GREEN} You have root access, proceedig to the next steps.... " &>> $LOG_FILE

fi

#Checking and installing the software


dnf list installed mysql -y &>> $LOG_FILE

if [ $? -ne 0 ]
then
    echo  -e " ${GREEN} Installing MYSQL..."
    dnf install mysql  &>> $LOG_FILE
    VALIDATE $? "MYSQL"

else 
    echo -e "${GREEN} MYSQL is already installed, no action required. ${RESET}" &>> $LOG_FILE

fi

dnf list installed python3 -y &>> $LOG_FILE &>> $LOG_FILE

if [ $? -ne 0 ]
then
    echo  -e " ${GREEN} Installing PYTHON...." &>> $LOG_FILE
    dnf install python3 -y &>> $LOG_FILE
    VALIDATE $? "PYTHON"

else 
    echo -e "${GREEN} PYTHON is already installed, no action required.${RESET}" &>> $LOG_FILE

fi

dnf list installed nginx -y &>> $LOG_FILE

if [ $? -ne 0 ]
then
    echo  -e " ${GREEN} Installing nginx...." 
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "nginx"

else 
    echo -e "${GREEN} nginx is already installed, no action required. ${RESET}" &>> $LOG_FILE

fi