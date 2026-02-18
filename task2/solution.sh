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
biggest_file=$(find "$directory" -type f -exec ls -l {} \; 2>/dev/null | sort -k5 -rn | head -1 | awk '{print $9}')
echo "Files: $files_count"
echo "Dirs: $dirs_count"
echo "$biggest_file"