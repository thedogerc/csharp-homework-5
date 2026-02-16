#!/bin/bash

if [ ! -d "archive" ]; then
    mkdir archive
fi

find . -maxdepth 1 -name "*.log" -type f -mtime +7 | while read file; do
    cp "$file" archive/
    gzip "archive/$(basename "$file")"
    rm "$file"
    echo "Архивирован: $file"
done

echo "Ротация логов завершена"