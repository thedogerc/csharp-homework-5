cd D:\oop\csharp-homework-5\task4
notepad solution.sh#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Использование: $0 <директория>"
    exit 1
fi
directory="$1"
if [ ! -d "$directory" ]; then
    echo "Ошибка: Директория '$directory' не существует"
    exit 1
fi
find "$directory" -type f -exec chmod 640 {} \;
find "$directory" -type d -exec chmod 755 {} \;
echo "Права изменены"