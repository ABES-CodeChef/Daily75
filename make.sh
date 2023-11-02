#!/bin/bash

if [ "$1" == "form" ]; then
	for i in {0..75}; do
		day_number=$(printf "%02d" "$i")
		mkdir -p "day_$day_number"
		cp "SUMMARY.md" "day_$day_number/SUMMARY.md"
	done
	echo "Form operation completed."
elif [ "$1" == "clean" ]; then
	for i in {0..75}; do
		day_number=$(printf "%02d" "$i")
		rm -rf "day_$day_number"
	done
	echo "Clean operation completed."
else
	echo "Usage: $0 [form|clean]"
	exit 1
fi
