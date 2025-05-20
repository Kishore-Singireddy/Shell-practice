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

dnf list installed mysql -y

if [ $? -ne 0 ]
then
    echo "installing mysql"
    VALIDATE $? "MYSQL"
else
    echo "MYSQL is already installed, no action required"
    exit 0
fi

dnf list installed nginx -y

if [ $? -ne 0 ]
then
    echo "installing nginx"
    VALIDATE $? "nginx"
else
    echo "nginx is already installed, no action required"
    exit 0
fi

#Installing Python3

dnf list installed python3 -y

if [ $? -ne 0 ]
then
    echo "installing python3"
    VALIDATE $? "python3"
else
    echo "python3 is already installed, no action required"
    exit 0
fi