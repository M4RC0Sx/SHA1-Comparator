#!/bin/bash

# Simple script to compare SHA1 Hash of to given files.
# Code by: M4RC0Sx
# GitHub: https://github.com/M4RC0Sx/SHA1-Comparator

HASH1=""
HASH2=""

if [ $# -ne 2 ]
  then
    echo -ne "\e[1mSHA1-Comparator / Usage:\e[0m ./SHA1-Comparator.sh <file#1> <file#2>\n"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo -ne "\e[1mSHA1-Comparator / Error:\e[0m First file was not found!\n"
    exit 1
fi

if [ ! -f "$2" ]; then
    echo -ne "\e[1mSHA1-Comparator / Error:\e[0m Second file was not found!\n"
    exit 1
fi

HASH1="$(cut -d' ' -f1 <<<"$(sha1sum "$1")")"
HASH2="$(cut -d' ' -f1 <<<"$(sha1sum "$2")")"

echo -ne "\e[1mSHA1-Comparator / File#1 Hash:\e[0m \"$HASH1\"\n"
echo -ne "\e[1mSHA1-Comparator / File#2 Hash:\e[0m \"$HASH2\"\n"

if [ "$HASH1" == "$HASH2" ]; then
    echo -ne "\e[1mSHA1-Comparator / Result: \033[38;5;10mBoth files SHA1 Hash is the same.\n\e[0m"
else
    echo -ne "\e[1mSHA1-Comparator / Result: \033[38;5;9mBoth files SHA1 Hash is NOT the same.\n\e[0m"
fi