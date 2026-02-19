#!/bin/bash
ls -a | grep '^\.' | grep -v '^\.$' | grep -v '^\.\.$' | sort