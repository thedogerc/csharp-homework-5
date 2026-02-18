#!/bin/bash
ps aux | grep "^$USER" | awk '{print $2, $4, $11}' | sort -k2 -rn