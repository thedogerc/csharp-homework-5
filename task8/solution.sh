#!/bin/bash
mkdir -p archive
for file in $(find . -name "*.log" -type f -mtime +7); do
    cp "$file" archive/
    gzip "archive/$(basename "$file")"
    rm "$file"
done