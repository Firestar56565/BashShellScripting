#!/bin/bash
function main_Menu()
{
  echo "Menu"
  echo -e "\n "
  echo "choose from the following using only the number: "
  echo -e "\n"
  select menu in "Disk Management" "File Management" "Network Management" "Process Management" "User Account Management" "Utilities" "Exit"
  do
    case $menu in
	"Disk Management")
	    disk_Management;;
	"File Management")
	    fileManagement;;
	"Network Management")
	    network_Management;;
	"Process Management")
	    processManagement;;
	"User Account Management")
	    UserManagement;;
	"Utilities")
	    utilities;;
	"Exit")
	    echo "You are now exiting the program"
 	    exit;;
	*)
	    echo "You have chosen an invalid option. Try again."
	    main_Menu;;
    esac
  done
}
function disk_Management()
{
  clear
  echo "------Disk Management Menu-------"
  select option in "Display device information" "Display disk partition information" "Display block device information" "Display mounted disk information" "Main Menu"
  do
    case $option in
	"Display device information")
	    cd /dev
	    ls -l | grep disk
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    disk_Management;;
	"Display disk partition information")
	    sudo fdisk -l
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    disk_Management;;
	"Display block device information")
	    lsblk
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    disk_Management;;
	"Display mounted disk information")
	    df -h | grep ^/dev
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    disk_Management;;
	"Main Menu")
	    main_Menu;;
	*)
	    echo "Invalid Option"
	    disk_Management;;
    esac
  done
}
function filePerms () {
	echo "Input the filepath."
	read filepth
	echo "$filepth selected."
	echo "Do you wish to add or remove permissions from a file?"
	select sel1 in "Add" "Remove" "Cancel"
		do
		echo "$sel1 selected."
			case $sel1 in
			"Add" )
			v1="+"
			break
			;;
			"Remove" )
			v1="-"
			break
			;;
			"Cancel" )
			#main menu function
			;;
			* )
			echo "Input error, please try again."
			;;
			esac
		done
	echo "Select one of the following options."
	select sel2 in "Read" "Write" "Execute" "Read/Write" "Read/Execute" "Write/Execute" "Read/Write/Execute" "Cancel"
		do
		echo "$sel2 selected"
			case $sel2 in
			"Read" )
			v2="r"
			break
			;;
			"Write" )
			v2="w"
			break
			;;
			"Execute" )
			v2="x"
			break
			;;
			"Read/Write" )
			v2="rw"
			break
			;;
			"Read/Execute" )
			v2="rx"
			break
			;;
			"Write/Execute" )
			v2="wx"
			break
			;;
			"Read/Write/Execute" )
			v2="rwx"
			break
			;;
			"Cancel" )
			fileManagement
			;;
			* )
			echo "Input error, please try again."
			;;
			esac
		done
	sudo chmod $v1$v2 $filepth
	
	echo "Command successful."
	fileManagement
}
function fileManagement () {
echo "---------- File Management ----------"
#Select Loop
select selection in "Present Working Directory" "List Directory Contents" "Create File" "Change File Permissions" "Remove a File" "Read a File" "Return to Main Menu"
do
	echo "$selection selected."
	case $selection in
	"Present Working Directory" )
		pwd
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		 ;;
	"List Directory Contents" )
		ls
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		 ;;
	"Create File" )
		echo "Input name of blank text file to create: "
		read input
		touch $input
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    	;;
	"Change File Permissions" )
		filePerms
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Remove a File" )
		echo "Input the filepath: "
		read filepath
		rm $filepath 
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    ;;
	"Read a File" )
		echo "Input the filepath: "
		read filepath
		cat $filepath 
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    ;;
	"Return to Main Menu" )
		main_Menu
		;;
	* )
	#Use a * for the default case at the end
		echo "Input Error, please try again." ;;

	esac
done
}
function network_Management()
{
  clear
  echo "-----Network Management Menu-----"
  select option in "ifconfig" "ping" "traceroute" "nslookup" "view network interfaces" "view network routing table" "view current system users" "Main Menu"
  do
    case $option in
	"ifconfig")
	    ifconfig
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    network_Management;;
	"ping")
	    pingFunction;;
	"traceroute")
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo "Enter an IP address, or website URL that you want to traceroute to: "
	    read totrace
	    traceroute $totrace
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    network_Management;;
	"nslookup")
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo "Enter the URL or IP address that you would like to look up: "
	    read lookaddress
	    nslookup $lookaddress
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    network_Management;;
	"view network interfaces")
	    netstat -i
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    network_Management;;
	"view network routing table")
	    netstat -r
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    network_Management;;
	"view current system users")
	    echo "checking for logged in users"
	    uptime
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    network_Management;;
	"Main Menu")
	    main_Menu;;
	*)
	    echo "Invalid option."
	    network_Management;;
    esac
  done
}
function processManagement () {
echo "---------- Process Management ----------"
#Select Loop
select selection in "Display Processes" "Display Processes by Usage" "Terminate a Process" "Display Disk Usage" "Display Free Disk Space" "Display System Uptime" "Return to Main Menu"
do
	echo "$selection selected."
	case $selection in
	"Display Processes" )
		ps
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Display Processes by Usage" )
		echo "Press Q to exit this menu."
		top
		processManagement
		;;
	"Terminate a Process" )
		echo "Please input the Process ID [PID] of the process you wish to terminate."
		echo "You can obtain this with the Display Processes option from the Process Management menu."
		read pid
		kill $pid
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Display Disk Usage" )
		df -h --total | grep "total"
		echo "                 Size  Used  Avail Use%"
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Display Free Disk Space" )
		df -h --total | grep "total"
		echo "                 Size  Used  Avail Use%"
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Display System Uptime" )
		echo "Current system uptime: "
		uptime
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		processManagement
		;;
	"Return to Main Menu" )
		main_Menu
		;;
	* )
	#Use a * for the default case at the end
		echo "Input Error, please try again." ;;

	esac
done
}
function UserManagement () {
echo "---------- User Account Management ----------"
#Select Loop
select selection in "Add User" "Delete User" "Lock User Password" "Get Information on User" "Add Group" "Delete Group" "Find User (Determine if user exists in the system)" "Find group (Determine if group exists in the system)" "Return to Main Menu"
do
	echo "$selection selected."
	case $selection in
	"Add User" )
		echo "Input the username to be added: "
		read input
		sudo adduser $input
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Delete User" )
		echo "Input the username to be deleted: "
		read input
		sudo deluser $input
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Lock User Password" )
		echo "Input the username of the user account to lock: "
		read input
		sudo passwd -l $input
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Get Information on User" )
		echo "Input the username of the user to look up: "
		read input
		sudo finger $input
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Add Group" )
		echo "Input the group name to be added: "
		read input
		sudo addgroup $input
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Delete Group" )
		echo "Input the group name to be added: "
		read input
		sudo delgroup $input
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Find User (Determine if user exists in the system)" )
		echo "Input the username to be checked: "
		read input
		getent passwd $input
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Find group (Determine if group exists in the system)" )
		echo "Input the group name to be checked: "
		read input
		getent group $input
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
		;;
	"Return to Main Menu" )
		main_Menu 
		;;
	* )
	#Use a * for the default case at the end
		echo "Input Error, please try again." ;;

	esac
done
}
function utilities()
{
  clear
  echo "---------Utilities Menu----------"
  select option in "Date/Time" "Calendar" "View Manual Pages" "Determine File Type" "Determine Command Type" "Sort File" "Search File" "Main Menu"
  do
    case $option in
        "Date/Time")
	    date
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    utilities;;
	"Calendar")
	    cal
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    utilities;;
	"View Manual Pages")
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo "Enter the manual that you would like to open: "
	    read page
	    man $page
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    utilities;;
	"Determine File Type")
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo "Enter a file name: "
	    read $filename
	    type $filename
	    echo -e "Press enter to continue \c"
	    read input
	    utilities;;
	"Determine Command Type")
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo "Enter a command name: "
	    read $commandname
	    type $commandname
	    echo -e "Press enter to continue \c"
	    read input
	    utilities;;
	"Sort File")
	    sortFunction
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    utilities;;
	"Search File")
	    searchFunction
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    echo -e "Press enter to continue \c"
	    read input
	    utilities;;
	"Main Menu")
	    main_Menu;;
	*)
	    echo "Invalid option."
	    utilities;;
    esac
  done
}

function pingFunction()
{
  select option in "ping one IP address" "Ping multiple IP addresses" "Return to the Network Management Menu" "Return to the Main Menu"
  do
    case $option in
	"ping one IP address")
	    echo "Enter the first 3 digits of the IP address: "
	    read ip1
	    echo "Enter the second 3 digits of the IP address: "
	    read ip2
	    echo "Enter the third 3 digits of the IP address: "
	    read ip3
	    echo "Enter the last 3 digits of the IP address: "
	    read ip4
	    echo "Now sending ping to IP address $ip1.$ip2.$ip3.$ip4"
	    (ping -i 1 -c 1 -W 1 $ip1.$ip2.$ip3.$ip4) &>/dev/null
	    if [ $? == 0 ]
	    then
		echo "$ip1.$ip2.$ip3.$ip4 is open"
	    else
		echo "$ip1.$ip2.$ip3.$ip4 is closed"
	    fi
	    echo -e "Press enter to continue \c"
	    read input
	    pingFunction;;
	"Ping multiple IP addresses")
	    echo "Enter the first 3 digits of the IP addresses that you want to scan: "
	    read ip1
	    echo "Enter the second 3 digits of the IP addresses that you want to scan: "
	    read ip2
	    echo "Enter the third 3 digits of the IP addresses that you want to scan: "
	    read ip3
	    echo "enter the last 3 digits of the lowest IP that you want to scan: "
	    read ip4min
	    echo "Enter the last 3 digits of the highest IP that you want to scan: "
	    read ip4max
	    echo "Scanning...please wait..."
	    for ip in $(seq $ip4min $ip4max)
	    do
		echo "pinging $ip1.$ip2.$ip3.$ip"
		(ping -i 1 -c 1 -W 1 $ip1.$ip2.$ip3.$ip) &>/dev/null
		if [ $? == 0 ]
		then
		    echo "$ip1.$ip2.$ip3.$ip is open"
		else
		    echo "$ip1.$ip2.$ip3.$ip is closed"
		fi
	    done
	    echo -e "Press enter to continue \c"
	    read input
	    pingFunction;;
	"Return to Network Management Menu")
	    network_Management;;
	"Return to the Main Menu")
	    main_Menu;;
	*)
	    echo "Invalid choice"
	    pingFunction;;
    esac
  done
}

function sortFunction()
{
	    echo "*********************"
	    echo -e '\n'
	    echo -e '\n'
	    select option in "sort by number" "sort by letter" "return to the utilities menu"
	    do
		case $option in
			"sort by number")
	    			echo "Enter a file name that you would like sorted. "
	    			echo "Include the entire directory path to ensure success:"
	    			read filesort
				sort -n $filesort
		       	        echo "*********************"
	    			echo -e '\n'
	    			echo -e '\n'
	    			echo -e "Press enter to continue \c"
	    			read input
				sortFunction;;
			"sort by letter")
	    			echo "Enter a file name that you would like sorted. "
	    			echo "Include the entire directory path to ensure success:"
	    			read filesort
				sort $filesort
	    			echo "*********************"
	    			echo -e '\n'
	    			echo -e '\n'
	    			echo -e "Press enter to continue \c"
	    			read input
				sortFunction;;
			"return to the utilities menu")
				utilities;;
			*)
				echo "Invalid choice"
				sortFunction;;
		esac
	    done
}

function searchFunction()
{
  echo "Search a file"
  select option in "search a file" "return to the utilities menu" "return to the main menu"
	do
	  case $option in
		"search a file")
	    	    echo "*********************"
	    	    echo -e '\n'
	    	    echo -e '\n'
	    	    echo "Enter a file name that you want to search. "
	    	    echo "Include the entire directory path to ensure success: "
	    	    read filesearch
	    	    echo "enter a term that you would like to search for: "
	    	    read searchterm
	    	    cat $filesearch | grep $searchterm
	    	    echo "*********************"
	    	    echo -e '\n'
	    	    echo -e '\n'
	    	    echo -e "Press enter to continue \c"
	    	    read input;;
		"return to the utilities menu" )
		     utilities;;
		"return to the main menu" )
		     main_Menu;;
		*)
		    echo "Invalid choice"
		    searchFunction;;
	  esac
	done
}
clear

main_Menu
