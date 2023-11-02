#!/bin/bash

for i in {0..75}; do
	# Create folder with leading zeros if needed
	day_number=$(printf "%02d" "$i")
	mkdir -p "day_$day_number"
	touch "day_$day_number/SUMMARY.md"
done

touch "README.md"
