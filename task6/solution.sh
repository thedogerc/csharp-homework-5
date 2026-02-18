#!/bin/bash

if [ $# -gt 1 ]; then
    echo "Usage: $0 [number_of_processes]"
    echo "Example: $0 10  (shows top 10 processes)"
    exit 1
fi

COUNT=${1:-10}

USER=$(whoami)

PROCESS_COUNT=$(ps -u $USER -o pid= | wc -l)

if [ $PROCESS_COUNT -eq 0 ]; then
    echo "No processes found for user $USER"
    exit 0
fi

echo "Top $COUNT processes for user $USER (sorted by memory usage):"
echo "------------------------------------------------"

ps -u $USER -o pid,%mem,%cpu,comm --sort=-%mem | head -n $(($COUNT + 1))

