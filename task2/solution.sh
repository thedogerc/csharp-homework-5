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
dirs_count=$((dirs_count - 1))

biggest_file=$(find "$directory" -type f -exec ls -l {} \; 2>/dev/null | sort -k5 -rn | head -1)
if [ -n "$biggest_file" ]; then
    filename=$(echo "$biggest_file" | awk '{print $9}')
    size=$(echo "$biggest_file" | awk '{print $5}')
    echo "Количество файлов: $files_count"
    echo "Количество директорий: $dirs_count"
    echo "Самый большой файл: $filename ($size байт)"
else
    echo "Количество файлов: $files_count"
    echo "Количество директорий: $dirs_count"
    echo "В директории нет файлов"
fi