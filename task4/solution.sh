#!/bin/bash
for file in $(find "$1" -type f); do
    chmod 640 "$file"
done