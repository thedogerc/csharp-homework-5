#!/bin/bash
ps -u $(whoami) -o pid,%mem,%cpu,comm --sort=-%mem