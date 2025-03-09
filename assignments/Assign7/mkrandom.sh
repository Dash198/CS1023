no_files=$1	# Store number of files to make
size=$2		# Store the size of each file
dir="${3:-.}"	# Store the target directory, current one if not given

mkdir -p "$dir"	# Make the directory if it does not exist

i=0		# Counter variable
while [[ $i -lt $no_files ]];	
do
	head -c $size /dev/urandom > "$dir"/"f$i.txt"		# Create a new text file with random characters form /dev/urandom till we reach our target size
	echo "f$i.txt created."					# Print the confirmation statement
	((i++))							# Increment step
done
