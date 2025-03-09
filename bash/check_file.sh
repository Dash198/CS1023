#Check if file (first arg) exists
if [ -e $1 ]; then
	echo "File exists"
else
	# If not, then give a choice to the user to create a new file
	input=""
	read -p "File doesn't exist, do you want to create one? " input
	if [ $input = "yes" ]; then
		echo $(touch $1)
	fi
fi
