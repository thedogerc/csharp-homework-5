#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi
if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist"
    exit 1
fi
find "$1" -type f -exec chmod 640 {} \;