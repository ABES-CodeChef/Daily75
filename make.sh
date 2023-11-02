#!/bin/bash

# Script Name: make.sh
# Description: A script to create and clean day's folders for 75 days DSA challenge .
# Author: Tanveer Raza
# Copyright (c) 2023 CodeChef Chapter ABES EC
# Licensed under the MIT License

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
		for i in {0..75}; do
			create_day "$i"
		done
		echo "Form operation completed."
	elif [[ "$target_day" =~ ^[0-9]+$ ]]; then
		create_day "$target_day"
	else
		echo "Invalid day number: $target_day"
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

# Function to clean day folders
clean_day_folders() {
	local target_day="$1"

	if [ "$target_day" == "all" ]; then
		for i in {0..75}; do
			remove_day "$i"
		done
		echo "Clean operation completed."
	elif [[ "$target_day" =~ ^[0-9]+$ ]]; then
		remove_day "$target_day"
	else
		echo "Invalid day number: $target_day"
	fi
}

# Main script
if [ "$1" == "form" ]; then
	form_day_folders "$2"
elif [ "$1" == "clean" ]; then
	clean_day_folders "$2"
else
	echo "Usage: ./make.sh {form|clean} <day>"
fi
