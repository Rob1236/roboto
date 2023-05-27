#!/bin/bash

echo "this are your current directories:"
ls -l
sleep 1
echo "Enter the directoies you want to remove (separated by spaces):"
read -a directories

for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "Directory not found: $dir"
else
    echo "These are the contents of $dir:"
    ls $dir
    read -p "Are you sure you want to continue? <y/n> " prompt
    if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
        echo -n "Removing directory $dir..."
	for ((i=0; i<=10; i++)); do
            echo -ne "Progress: ["
            for ((j=0; j<=i; j++)); do
                echo -ne "#"
            done
            for ((j=i+1; j<=10; j++)); do
                echo -ne " "
            done
            echo -ne "] $((i*10))%"
            sleep 0.05
            echo -ne "\r"
        done
	
	rm -r "$dir"
        echo "Directory $dir removed."
    fi
fi
done
