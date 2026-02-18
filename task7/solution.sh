#!/bin/bash
ls -la | grep "^\." | grep -v "^\.$" | grep -v "^\.\.$" | awk '{print $9}' | sort