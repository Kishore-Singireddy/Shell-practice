#!/bin/bash
# Program to install software

echo "You are attempting to install MYSQL, NGINX, PYTHON3 "

# Checking if the user has root access

user=$(id -u)

if [$user -ne 0]
then
    echo "You don't have root access, Hence unable to install the software, exiting......"
    exit 1

else 
    echo "Proceeding to check and install the software"

fi

dnf list installed mysql

if [$? -ne 0]
then
    echo "installing mysql"
    if [$? -ne 0]
    then
        echo "Software installation failed, check the error logs at /var/logs. Exiting the installation.."
        exit 1
    else
        echo "Software MYSQL is successfully installed"
    fi
else
    echo "MYSQL is already installed, no action required"
    exit 0
fi