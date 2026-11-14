#!/bin/bash

FILE="${1:-input.txt}"

if [ ! -f "$FILE" ]; then
    echo "File $FILE not found"
    exit 1
fi

echo "---- BEFORE ----"
cat "$FILE"

# 5,$ = from line 5 to the end; /welcome/ = only lines containing welcome
sed '5,${/welcome/s/give/learning/g}' "$FILE" > output.txt

echo
echo "---- AFTER (saved to output.txt) ----"
cat output.txt
