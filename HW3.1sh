#!/bin/bash
#Caden McBride

#1. Prompt the user to enter a number between 1 and 100 and store the number #into a 
#variable.
#2. Echo entered number to the screen


read -p 'Enter a number between 1 and 100: ' num1
echo "Number selected: $num1."
#3. Using  if statements determine if the entered number is:
#a. If less than 18 print “You are two young to vote or drink”
#b. If 18 or greater and less than 21 print “You can vote but not drink”
#c. If 21 or greater and less than 65 print “You can vote and drink but do #not qualify 
#for a senior discount”
#d. Greater than 65 print “you qualify for the senior discount”
if [ "$num1" -lt 18 ]
then
	echo "You are too young to vote or drink."
	
	elif [ "$num1" -gt 17 -a "$num1" -lt 21 ]
	then
		echo "You can vote but not drink."
		
	elif [ "$num1" -gt 20 -a "$num1" -lt 65 ]
	then
		echo "You can vote but and drink but do not qualify for a senior discount."
		
	elif [ "$num1" -gt 64 ]
	then
		echo "You qualify for the senior discount."
else
	echo "Invalid number"
fi
