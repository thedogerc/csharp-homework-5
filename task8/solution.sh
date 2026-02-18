#!/bin/bash
mkdir -p archive
find . -maxdepth 1 -name "*.log" -type f -mtime +7 | while read file; do
    cp "$file" archive/
    gzip -f "archive/$(basename "$file")"
    rm "$file"
done
echo "Ротация логов завершена"