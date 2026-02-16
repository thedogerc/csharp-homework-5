#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Использование: $0 <директория> <искомая_строка> <замена>"
    exit 1
fi

directory="$1"
search="$2"
replace="$3"

if [ ! -d "$directory" ]; then
    echo "Ошибка: Директория '$directory' не существует"
    exit 1
fi

find "$directory" -type f -name "*.txt" | while read file; do
    sed -i "s/${search}/${replace}/g" "$file"
    echo "Обработан: $file"
done

echo "Готово!"