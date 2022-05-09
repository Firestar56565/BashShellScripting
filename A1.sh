#!/bin/bash


#FUNCTION “Main Menu”
#Echo the following to the screen  (echo "---------- Main Menu ----------")
#Use case/select loops to create selection options to call other functions
#”Exit 0”

#FUNCTION Ping Sweep
#Echo the following to the screen  (echo "---------- Ping Sweep ----------")
#Append date to file “pingresults.txt”
#Input first 3 number sequences, not the 4th. Be specific on how to enter them.
#For loop through each possible combination of numbers for the 4th sequence.
#	- Inside loop, echo each ip address and use “ping” to identify and log active ips.
#Call main menu function


function Main_Menu () {

#Main Menu Display
clear
echo "---------- Main Menu ----------"
echo "Make a selection by inputting 1, 2, 3, or 4."
select s in "Ping Sweep" "Port Scan" "Print Scan Results" Exit
do
	echo "$s selected."
	
	#Execute based on selection
	case $s in
	"Ping Sweep" )
		echo "Ping Sweep selected"
		pingSweep ;;

	"Port Scan" )
		echo "Port Scan selected"
		portScan ;;

	"Print Scan Results" )
		echo "Print Scan Results selected"
		printScanResults ;;

	"Exit" )
		echo "Exit program." 
		exit 0 ;;

	* )
	#Use a * for the default case at the end
		echo "Unknown Command" ;;

	esac
done


echo "Program Closed"
}

function pingSweep () {
echo "---------- Ping Sweep ----------"
#Assigning defaults to avoid user input errors from hitting enter too soon.
p1=000
p2=000
p3=000
date >> pingresults.txt
echo "Input the three 3-digit clusters of numbers in your IPv4 address, seperated by spaces."
echo "Example: 123 456 789"
read p1 p2 p3
for p4 in $(seq 000 255); do
    echo "$p1.$p2.$p3.$p4"
    (ping -i 0 -W 1 -c 1 $p1.$p2.$p3.$p4) > /dev/null
    if [ $? == 0 ]
    then
    	   echo "$p1.$p2.$p3.$p4 is open." | tee -a pingresults.txt
    fi
done
Main_Menu
}

Main_Menu
