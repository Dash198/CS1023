del_empty() {
	local dir="$1"
	file_list=($(ls "$dir/"*.txt))

	for file in ${file_list[@]}; do
		if [ ! -s $file ]; then
			rm $file
			if [ $? -eq 0 ]; then
				echo "$file deleted."
			fi
		fi
	done
}
