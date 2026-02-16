#!/bin/bash

ps aux | grep "^$USER" | sort -k4 -rn