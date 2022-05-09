#!binbash
#Caden McBride


echo Enter two numbers, separated by spaces
read -a nums
echo Entered numbers ${nums[@]}

if [ ${nums[0]} -gt ${nums[1]} ]
then
	echo ${nums[0]} is larger.  output.txt
else
	echo ${nums[1]} is larger.  output.txt
fi

cat output.txt