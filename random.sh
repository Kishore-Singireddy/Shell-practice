#!/bin/bash

echo " This is random number generator "

rnm=$((RANDOM % 10))

echo $rnm

if [ $rnm -gt 5 ]; then
	new_rnm=$(( $rnm - 5 ))
	echo "$new_rnm"
else new_rnm=$(($rnm))
fi

echo "This is newrnm $new_rnm "
