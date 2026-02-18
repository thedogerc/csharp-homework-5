#!/bin/bash
ps aux --sort=-%mem | grep "^$(whoami)" | head -10