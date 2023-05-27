#!/bin/bash

input_file="directories.txt"

while IFS= read -r dir; do
    if [ -d "$dir" ]; then
        echo "Directory '$dir' already exists, dir '$dir' was not created."
    else
	for ((i=0; i<=10; i++)); do
	    echo -ne "Progress: ["
    	for ((j=0; j<=i; j++)); do
        	echo -ne "#"
    	done
    	for ((j=i+1; j<=10; j++)); do
        	echo -ne " "
    	done
    	echo -ne "] $((i*10))%"
    	sleep 0.05  # Adjust the sleep duration as desired (e.g., 0.1 for 0.1 second)
    	echo -ne "\r"
   	done
        mkdir "$dir" && echo "Directory '$dir' created."
    fi
done < "$input_file"

echo "Directory creation completed."
