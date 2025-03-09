choice=""			# Variable to store the user's command. Can be a shell command or the exit command to terminate monitoring.
dir="$(realpath $1)"		# Store the directory to monitor.
backup_dir="$(realpath $2)"	# Directory to back files into.

mkdir -p $backup_dir
read choice			# Read the first command.

while [ ! "$choice" = "exit" ]	# Keep going until exit is entered.
do
	og_files=($(ls "$dir"))				# Store the name of each file in the directory.
	mkdir -p $backup_dir/temp			# Make a temporary folder and back up each file there.
	for file in ${og_files[@]};
	do
		cp $dir/$file $backup_dir/temp/$file	# Store a copy of each file before running the command (This approach may be quite inefficient).
	done
	eval "$choice"						# Execute the command (temp folder is visible here, that's one drawback of this approach).

	for file in ${og_files[@]};				# Go through each file in the original list (if a new file is created then it will be checked on the next iteration).
	do							# New files won't be backed up until they are changed.
		if [ ! -f "$dir/$file" ] || ! diff -q "$dir/$file" "$backup_dir/temp/$file" > /dev/null ; then	# If file is deleted or changed,
			mv $backup_dir/temp/$file $backup_dir/$file$(date +"%Y%m%d_%H%M%S")			# Then move the backup outside the temp folder.
			echo "$file backed up successfully."
		fi
	done
	rm -r $backup_dir/temp			# Remove the temp folder at the end of the file check (Unnecessary backups are deleted).
	read choice 				# Read the next command.

done
