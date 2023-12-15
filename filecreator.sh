#!/bin/bash

yourName="oleh"  
numFiles=25      

last_file_number=$(ls -1 | grep "^$yourName[0-9]\+$" | sed "s/$yourName//" | sort -n | tail -n 1)

if [ -n "$last_file_number" ]; then
    last_number=$((last_file_number))
else
    last_number=0
fi

for ((i = last_number + 1; i <= last_number + numFiles; i++)); do
    filename="${yourName}${i}"
    touch "$filename"
done