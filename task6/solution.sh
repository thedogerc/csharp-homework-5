#!/bin/bash
if [ -f ".hidden_file" ]; then
    echo "Found .hidden_file"
else
    echo ".hidden_file not found"
fi
ps aux --sort=-%mem | grep "^$(whoami)" | head -10