#!/bin/bash
clear
#--------------------------------
i=0
while [ $i == 0 ]
do
echo "Enter two numbers: "
read num1 num2
#--
echo "Enter an operation (Addition, Subtraction, Multiplication, Division): "
read operation

if [ $operation == Addition ]
	then
	num3=$(( $num1 + $num2 ))
	echo "$num1 + $num2 = $num3"
	echo "$num1 + $num2 = $num3" >> mathresults.txt
elif [ $operation == Subtraction ]
	then
	num3=$(( $num1 - $num2 ))
	echo "$num1 - $num2 = $num3"
	echo "$num1 - $num2 = $num3" >> mathresults.txt
elif [ $operation == Multiplication ]
	then
	num3=$(( $num1 * $num2 ))
	echo "$num1 * $num2 = $num3"
	echo "$num1 * $num2 = $num3" >> mathresults.txt
elif [ $operation == Division ]
	then
	num3=$(( $num1 / $num2 ))
	echo "$num1 / $num2 = $num3"
	echo "$num1 / $num2 = $num3" >> mathresults.txt
else
	echo "Operation error"
fi
#--
echo "Do you wish to perform another operation? (Y/N)"
read reply
if [ $reply == "N" ]
	then
	((i++))
fi
done
#--------------------------------
