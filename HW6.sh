#!/bin/bash

function discManagement() {
clear
echo "------Disc Management Menu------"
Main_Menu
}
function fileManagement() {
clear
echo "------File Management Menu------"
Main_Menu
}
function netManagement() {
clear
echo "------Network Management Menu------"
Main_Menu
}
function processManagement() {
clear
echo "------Process Management Menu------"
Main_Menu
}
function usrManagement() {
clear
echo "------User Account Management Menu------"
Main_Menu
}
function utilManagement() {
clear
echo "------Utilities Menu------"
Main_Menu
}
function Main_Menu () {
#Main Menu Display
echo "---------- Main Menu ----------"
echo "Make a selection by inputting 1, 2, 3, or 4."
select s in "Disc Management" "File Management" "Network Management" "Process Management" "User Account Management" "Utilities" Exit
do
	echo "$s selected."
	
	#Execute based on selection
	case $s in
	"Disc Management" )
		echo "Disc Management selected"
		discManagement
		;;

	"File Management" )
		echo "File Management selected"
		fileManagement
		;;
	"Network Management" )
		echo "Network Management selected"
		netManagement
		;;
	"Process Management" )
		echo "Process Management selected"
		processManagement
		;;
	"User Account Management" )
		echo "User Account Management selected"
		usrManagement
		;;
	"Utilities" )
		echo "Utility Menu selected"
		utilManagement
		;;
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
Main_Menu
