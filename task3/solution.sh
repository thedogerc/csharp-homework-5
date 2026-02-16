#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <файл_лога>"
    exit 1
fi

logfile="$1"

if [ ! -f "$logfile" ]; then
    echo "Ошибка: Файл '$logfile' не найден"
    exit 1
fi

info_count=$(grep -c "| INFO |" "$logfile")
error_count=$(grep -c "| ERROR |" "$logfile")
warn_count=$(grep -c "| WARN |" "$logfile")

echo "INFO: $info_count"
echo "ERROR: $error_count"
echo "WARN: $warn_count"