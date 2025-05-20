#!/bin/bash
# Program to install software

echo "You are attempting to install MYSQL, NGINX, PYTHON3 "

# Checking if the user has root access

user=$(id -u)
VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo "$2 Software installation failed, check the error logs at /var/logs. Exiting the installation.."
        exit 1
    else
        echo "Software $2 is successfully installed"
    fi
}

if [ $user -ne 0 ]
then
    echo "You don't have root access, Hence unable to install the software, exiting......"
    exit 1

else 
    echo "Proceeding to check and install the software"

fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Installing mysql"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "MYSQL is already installed, no action required"
    
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Insallting nginx"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed, no action required"
    
fi

#Installing Python3

dnf list installed python3

if [ $? -ne 0 ]
then
    echo "Installing Python3"
    dnf install python3
    VALIDATE $? "python3"
else
    echo "python3 is already installed, no action required"
    
fi