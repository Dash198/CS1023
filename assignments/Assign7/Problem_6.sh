file="$1"	# Storing path to working file

choice=1	# Initialising the choice variable
echo "Choose an operation:"
echo "1. Concatenate"
echo "2. Sum"
echo "3. Product"
echo "4. Difference"
echo "5. Exit"
read -p "Enter your choice: " choice	# Taking the first choice

cp $file f1.csv			# Copying the working file to temp file which will be operated on
while [[ $choice -lt 5 ]];	# Loop until choice >= 5
do
	if [ $choice == 1 ]; then		# Concatenating two columns
		read -p "Enter column numbers to concat (comma-separated): " cols	# Storing the column numbers
		col1=$(echo "$cols"|awk -F',' '{print $1}')				# Storing number of first column
		col2=$(echo "$cols"|awk -F',' '{print $2}')				# Storing number of second column
		cname="concat_col$col1&col$col2"					# Name of new column
		awk -v cname="$cname" -v col1=$col1 -v col2=$col2 -F',' 'NR==1 {print $0 "," cname;next} {print $0 "," $col1$col2}' f1.csv > output.csv		# Add the new column
	elif [ $choice == 2 ]; then		# Summing two columns
		read -p "Enter column numbers to sum (comma-separated): " cols		# Same process as previous process
		col1=$(echo "$cols"|awk -F',' '{print $1}')
		col2=$(echo "$cols"|awk -F',' '{print $2}')
		cname="sum_col$col1&col$col2"						# Different name though
		awk -v cname="$cname" -v col1=$col1 -v col2=$col2 -F',' 'NR==1 {print $0 "," cname;next} {print $0 "," $col1+$col2}' f1.csv > output.csv	# Add the new column
	elif [ $choice == 3 ]; then		# Multiplying two columns
		read -p "Enter column numbers to multiply (comma-separated): " cols	
		col1=$(echo "$cols"|awk -F',' '{print $1}')
		col2=$(echo "$cols"|awk -F',' '{print $2}')
		cname="prod_col$col1&col$col2"						
		awk -v cname="$cname" -v col1=$col1 -v col2=$col2 -F',' 'NR==1 {print $0 "," cname;next} {print $0 "," $col1*$col2}' f1.csv > output.csv
	elif [ $choice == 4 ]; then		# Difference bw two columns
		read -p "Enter column numbers to subtract (comma-separated): " cols	
		col1=$(echo "$cols"|awk -F',' '{print $1}')
		col2=$(echo "$cols"|awk -F',' '{print $2}')
		cname="diff_col$col1&col$col2"						
		awk -v cname="$cname" -v col1=$col1 -v col2=$col2 -F',' 'NR==1 {print $0 "," cname;next} {print $0 "," $col1-$col2}' f1.csv > output.csv
	fi
	cp output.csv f1.csv	# Change the temp file for next iteration
	echo "Choose an operation:"
	echo "1. Concatenate"
	echo "2. Sum"
	echo "3. Product"
	echo "4. Difference"
	echo "5. Exit"
	read -p "Enter your choice: " choice	# Take input again
done
rm f1.csv	# Delete the temp file
echo "Final reult saved to output.csv"
