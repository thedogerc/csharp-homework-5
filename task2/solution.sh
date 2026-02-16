#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <директория>"
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Ошибка: Директория '$directory' не существует"
    exit 1
fi

files_count=$(find "$directory" -type f | wc -l)
dirs_count=$(find "$directory" -type d | wc -l)

biggest_file=$(find "$directory" -type f -exec ls -l {} \; 2>/dev/null | sort -k5 -rn | head -n1 | awk '{print $9, $5}')

if [ -n "$biggest_file" ]; then
    echo "Количество файлов: $files_count"
    echo "Количество директорий: $dirs_count"
    echo "Самый большой файл: $biggest_file"
else
    echo "Количество файлов: $files_count"
    echo "Количество директорий: $dirs_count"
    echo "В директории нет файлов"
fi