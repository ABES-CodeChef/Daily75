#!/bin/bash

for ((i = 1; i <= 75; i++)); do
	folder_name="day_$i"
	mkdir -p "$folder_name"
	touch "$folder_name/summary.md"
done

touch "README.md"
