# Read input from the user
read -p "Enter a number: " num

# Check if number is integer
if [[ $num =~ ^-?[0-9]+$ ]]; then
	# Check for its sign
	if [ $num -gt 0 ]; then
		echo "Number is positive."
	elif [ $num -lt 0 ]; then
		echo "Number is negative."
	else
		echo "Number is zero."
	fi
else
	# If number is not an integer, terminate
	echo "Invalid input!"
	exit 1
fi
