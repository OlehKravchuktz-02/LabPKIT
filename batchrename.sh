#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Вкажіть каталог, оригінальне розширення та нове розширення."
    exit 1
fi

directory="$1"
original_ext="$2"
new_ext="$3"

if [ ! -d "$directory" ]; then
    echo "Каталог '$directory' не існує."
    exit 1
fi

cd "$directory" || exit 1

for file in *.$original_ext; do
    new_name="${file%.$original_ext}.$new_ext"
    echo "Перейменовую $file на $new_name"
    mv "$file" "$new_name"
done