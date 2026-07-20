#!/bin/bash
#Usage: ./file_stats.sh <directory>

if [$# -ne 1]; then
    echo "Usage: ./$0 <directory>"
    exit 1
fi

DIR="$1"

if [! -d "$DIR"]; then
   echo "Directory not found."
   exit 1
fi

FILES=0
DIRECTORIES=0
LARGEST_NAME=0
LARGEST_SIZE=0
FILE_SIZE=0
RECENT=0
RECENT_TIME=0
TIME_MODIFIED=0

for item in "$DIR"/*; do
    if [-d "$item/"]; then
        ((DIRECTORIES++))
    elif [-f "$item"]; then
        ((FILES++))
        FILE_SIZE=$(stat -c %s "$item")
        if [$FILE_SIZE -gt $LARGEST_SIZE]; then
            LARGEST_SIZE=FILE_SIZE
            LARGEST_NAME="$item"
        fi
        TIME_MODIFIED=$(stat -c %y "$item")
        if [$TIME_MODIFIED -gt $RECENT_TIME]; then
            RECENT_TIME=TIME_MODIFIED
            RECENT="$item"
        fi
    fi
done

if [$FILES -eq 0]; then
    echo "Total number of directories: $DIRECTORIES"
    echo "No file in this directory."
    exit 0
fi

echo "Total number of files: $FILES"
echo "Total number of directories: $DIRECTORIES"
echo "Largest file is $LARGEST_NAME and its size is $LARGEST_SIZE bytes"
echo "Most recently modified file is $RECENT"