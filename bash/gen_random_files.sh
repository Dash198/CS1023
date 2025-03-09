create_files() {
	local dir="$1"
	local no_files="$2"

	mkdir -p $dir
	
	for (( i=1; i<=no_files; i++ ));
	do
		touch "$dir/file_$i.txt"
	done	
}

insert_text() {
	local num_files="$1"
	local total_files="$2"
	local dir="$3"
	local random_numbers=()

	for (( i=1; i<=num_files; i++)); do
		random_numbers+=($((RANDOM % total_files)))
	done

	files_list=($(ls "$dir/"*.txt))
	for i in ${random_numbers[@]}; do
		echo "Inserting random text in ${files_list[$i]}"
		echo "Random text" > "${files_list[$i]}"
	done
}
