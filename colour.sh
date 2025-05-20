#!/bin/bash

echo "Hello world - No colour"

echo -e " \e[31m Hello World - Red Colour"
echo -e " \e[32m Hello World - Green Colour \e[0m"
echo "Hello World - No colour"

RED='\e[31m'

echo -e "${RED} Hello World "

