#!/bin/bash

# Create a directory for a specific day
create_day_folder() {
	if [ "$1" ]; then
		if [ "$1" != "all" ]; then
			day_number=$(printf "%02d" "$1")
			mkdir -p "day_$day_number"
			cp "SUMMARY.md" "day_$day_number/SUMMARY.md"
			echo "Created folder for day $1"

		elif [ "$1" == "all" ]; then
			for i in {0..75}; do
				day_number=$(printf "%02d" "$i")
				folder_name="day_$day_number"
				mkdir -p "$folder_name"
				cp "SUMMARY.md" "day_$day_number/SUMMARY.md"
			done
			echo "Form operation completed."

		fi
	else
		echo "Usage: ./make.sh form [<day>, all]"
	fi
}

# Clean up the day folder
clean_day_folder() {
	if [ "$1" ]; then
		if [ "$1" != "all" ]; then
			day_number=$(printf "%02d" "$1")
			folder_name="day_$day_number"
			if [ -d "$folder_name" ]; then
				rm -rf "$folder_name"
				echo "Removed folder for day $1"
			else
				echo "Folder for day $1 does not exist"
			fi

		elif [ "$1" == "all" ]; then
			for i in {0..75}; do
				day_number=$(printf "%02d" "$i")
				folder_name="day_$day_number"
				echo "Deleting $folder_name"
				rm -rf "$folder_name"
			done
			echo "Clean operation completed."
		fi

	else
		echo "Usage: ./make.sh clean [<day>, all]"
	fi
}

# Main script
if [ "$1" == "form" ]; then
	create_day_folder "$2"
elif [ "$1" == "clean" ]; then
	clean_day_folder "$2"
else
	echo "Usage: ./make.sh {form|clean} <day>"
fi
