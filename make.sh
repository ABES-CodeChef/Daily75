#!/bin/bash

# Script Name: make.sh
# Description: A script to create and clean day's folders for 75 days DSA challenge .
# Author: Tanveer Raza
# Copyright (c) 2023 CodeChef Chapter ABES EC Licensed under the MIT License

# Function to create a day folder
create_day() {
	local day_number="$1"
	local folder_name="day_$(printf "%02d" "$day_number")"

	if [ -d "$folder_name" ]; then
		echo "Folder for day $day_number already exists, skipping."
	else
		mkdir -p "$folder_name"
		cp -i "SUMMARY.md" "$folder_name/SUMMARY.md"
		echo "Created folder for day $day_number"
	fi
}

# Function to form day folders
form_day_folders() {
	local target_day="$1"

	if [ "$target_day" == "all" ]; then
		for i in {1..75}; do
			create_day "$i"
		done
		echo "Form operation completed."
	elif [[ "$target_day" =~ ^[0-9]+$ ]]; then
		create_day "$target_day"
	else
		echo "Invalid day number: $target_day"
	fi
}

# Function to clean day folders with an optional --force flag
clean_day_folders() {
	local target_day="$1"
	local force_flag="$2"

	if [ "$target_day" == "all" ]; then
		for i in {1..75}; do
			if [ "$force_flag" == "--force" ]; then
				remove_day "$i"
			else
				remove_day_with_conditions "$i"
			fi
		done
		echo "Clean operation completed."
	elif [[ "$target_day" =~ ^[0-9+$ ]]; then
		if [ "$force_flag" == "--force" ]; then
			remove_day "$target_day"
		else
			remove_day_with_conditions "$target_day"
		fi
	else
		echo "Invalid day number: $target_day"
	fi
}

# Function to remove a day folder with conditions
remove_day_with_conditions() {
	local day_number="$1"
	local folder_name="day_$(printf "%02d" "$day_number")"

	if [ -d "$folder_name" ]; then
		# Check if SUMMARY.md exists in the root folder
		if [ -f "SUMMARY.md" ]; then
			# Check if SUMMARY.md in the day folder is the same as the one in the root folder
			if cmp -s "SUMMARY.md" "$folder_name/SUMMARY.md"; then
				# Check if there are files other than SUMMARY.md in the day folder
				if [ $(find "$folder_name" -maxdepth 1 -type f | wc -l) -eq 1 ]; then
					rm -rf "$folder_name"
					echo "Removed folder for day $day_number"
				else
					echo "Folder for day $day_number contains files other than SUMMARY.md, skipping removal."
				fi
			else
				echo "SUMMARY.md in folder $folder_name is different from the one in the root folder, skipping removal."
			fi
		else
			echo "SUMMARY.md is missing in the root folder, skipping removal."
		fi
	else
		echo "Folder for day $day_number does not exist, skipping."
	fi
}

# Function to remove a day folder
remove_day() {
	local day_number="$1"
	local folder_name="day_$(printf "%02d" "$day_number")"

	if [ -d "$folder_name" ]; then
		rm -rf "$folder_name"
		echo "Removed folder for day $day_number"
	else
		echo "Folder for day $day_number does not exist, skipping."
	fi
}
# Main script
if [ "$1" == "form" ] || [ "$1" == "create" ]; then
	form_day_folders "$2"
elif [ "$1" == "clean" ] || [ "$1" == "remove" ]; then
	clean_day_folders "$2" "$3"
else
	echo "Usage: ./make.sh {{form|create}|{clean|remove}} {<day>|all} [--force]"
fi
