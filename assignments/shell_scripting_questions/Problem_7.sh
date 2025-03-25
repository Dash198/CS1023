file="$1"		# Store the working file
cp "$file" f1.csv	# Make a copy and work on that
col="$2"		# Take the column number

v1=$(awk -v col="$col" -F',' 'NR==1 {print $col}' f1.csv)	# Store the first three values of the column	
v2=$(awk -v col="$col" -F',' 'NR==2 {print $col}' f1.csv)
v3=$(awk -v col="$col" -F',' 'NR==3 {print $col}' f1.csv)

if [ $((v1 - v2)) -eq $((v2 - v3)) ]; then			# Check for AP, if yes..
	diff=$((v2-v1))		# Store the common difference
	nr=$3			# Store the number of rows upto which we want to extend the AP
	total_rows=$(awk -F',' 'END {print NR}' f1.csv)		# Store the total number of rows in the file

	# Extend until we reach EOF or if we reach target rows
	awk -v diff="$diff" -v a="$v3" -v nr="$nr" -v col="$col" -F',' 'BEGIN {OFS=","} (NR>3 && NR<=nr) {$col=a+diff; a=$col} {print}' f1.csv > temp.csv

	# Make this the new working file
	mv temp.csv f1.csv

	# Find no. of remaining rows to fill
	rem_rows=$((nr-total_rows))	
	if [ $rem_rows -gt 0 ]; then	# If it is positive then
		i=0			# Init a counter variable
		a=$(awk -v col="$col" -F',' 'END {print $col}' f1.csv)		# Store the previous value
		no_cols=$(awk -F',' '{print NF;exit}' f1.csv)			# Find total no. of columns
		a=$((a+diff))		# Update 'a'
		while [ $i -lt $rem_rows ];		# Start looping
		do
			f=""				# String to echo to the file
			j=1
			while [ "$j" -le "$((no_cols - 1))" ];	
			do
				if [ "$j" -eq "$col" ]; then		# If we reach the desired column, add 'a', else add empty string
					f="${f}$a,"
				else
					f="${f},"
				fi
				((j++))
			done
			if [ "$j" -eq "$col" ]; then
				f="${f},$a"				# Last column case
			fi
			echo "$f" >> f1.csv				# Append the row to the file
			a=$((a+diff))					# Update 'a'
			((i++))
		done
	fi
	mv f1.csv out.csv						# Store results into final output file
	echo "Saved to out.csv"
else
	exit -1								# Exit if it is not an AP
fi


