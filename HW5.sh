#!/bin/bash
read -a < hw5spr22grades.txt value
i=0
while [ "$i" -lt 60 ]
do
	if [ "${value[i]}" -lt 60 ]
	then
		echo "${value[i]} = F" >> hw5spr22output.txt
	elif [ "${value[i]}" -gt 59 -a "${value[i]}" -lt 70 ]
	then
		echo "${value[i]} = D" >> hw5spr22output.txt
	elif [ "${value[i]}" -gt 69 -a "${value[i]}" -lt 80 ]
	then
		echo "${value[i]} = C" >> hw5spr22output.txt
	elif [ "${value[i]}" -gt 79 -a "${value[i]}" -lt 90 ]
	then
		echo "${value[i]} = B" >> hw5spr22output.txt
	elif [ "${value[i]}" -gt 89 ]
	then
		echo "${value[i]} = A" >> hw5spr22output.txt
	else
	echo "Error"
	fi
((i++))
done
cat hw5spr22output.txt
echo "Values checked: ${#value[@]}" ## array length
#--
c=0
for c in A B C D F
do
	echo -e "\n" >> hw5spr22output2.txt
	date >> hw5spr22output2.txt
	echo "Search is executed for the '$c' search pattern" >> hw5spr22output2.txt
	cat hw5spr22output.txt | grep $c >> hw5spr22output2.txt
done
cat hw5spr22output2.txt