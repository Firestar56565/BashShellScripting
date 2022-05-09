#!/bin/bash

#Caden McBride



#1. Prompt the user to enter in two names

#2. Save or read those names into two separate variables

#3. Print to the screen the two variables that were entered



read -p 'Enter two names: ' Name1 Name2

echo "$Name1 and $Name2 were the two names entered."



#1. Within the script Prompt the user to enter in multiple names and store #these names into an 

#array.

#2. Print (echo) to the screen the number of names that were entered

#3. Print out separately the first two names entered into an array (Print #each index value)

#4. Print  (echo) all of the names entered into the array together (Print #the entire contents of 

#the array)

echo -e "\n"

echo "Enter multiple names: "

read -a NameArray

echo "Number of names entered: ${#NameArray[@]}."

echo "First two names entered: ${NameArray[0]} and ${NameArray[1]}."

echo "All names entered: ${NameArray[@]}."