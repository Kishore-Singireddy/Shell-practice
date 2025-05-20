#!/bin/bash
read -p  'Enter the number: 
0 U
1 SL
2 SV
3 SR
4 MD
5 @ for all
: ' want

if [ $want -le 6 ]; then

	kishore=("U" "SL" "SV" "SR" "MD")
	echo "You have selected:  ${kishore[$want]}"
else exit

fi

type=("GB" "DG" "RPLY" "MS" "IF" "HP")

rnm=$(( $RANDOM % 10 ))

if [ $rnm -gt 5 ] ; then
	newrnm=$(( $rnm - 5 ))
else newrnm=$rnm

fi
echo " Styl picked is : ${type[$newrnm]} "
