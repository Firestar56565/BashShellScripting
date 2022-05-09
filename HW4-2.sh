#!/bin/bash
read -a < hw4spr22grades.txt value
i=0
while [ "$i" -lt 93 ]
do
	if [ "${value[i]}" -lt 60 ]
	then
		echo "${value[i]} = F" >> hw4spr22output.txt
	elif [ "${value[i]}" -gt 59 -a "${value[i]}" -lt 70 ]
	then
		echo "${value[i]} = D" >> hw4spr22output.txt
	elif [ "${value[i]}" -gt 69 -a "${value[i]}" -lt 80 ]
	then
		echo "${value[i]} = C" >> hw4spr22output.txt
	elif [ "${value[i]}" -gt 79 -a "${value[i]}" -lt 90 ]
	then
		echo "${value[i]} = B" >> hw4spr22output.txt
	elif [ "${value[i]}" -gt 89 ]
	then
		echo "${value[i]} = A" >> hw4spr22output.txt
	else
	echo "Error"
	fi
((i++))
done
cat hw4spr22output.txt
echo "Values checked: ${#value[@]}" ## array length, 94