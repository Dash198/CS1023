dir="$(realpath $1)"	# Store the directory where we have to look for files
ext="$2"		# Store the file extension to search for
prefix="${3:-$(date +"%Y-%m-%d")}"	# Store the prefix, if nothing provided by the user then use YYYY-MM-DD
files=($(ls "$dir"/*"$ext"))	# Search for all the files with the given extension in the given directory and store them into a list

for file in "${files[@]}"; do	# Iterate through the list
	fname=${file##*/}	# Trim out the path for renaming
	echo "Original File name: $fname"	
	nname="$prefix$fname"
	echo "New File name: $nname"
	mv "$dir"/"$fname" "$dir"/"$nname"	# Rename the file
done
