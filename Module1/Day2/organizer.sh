#!/bin/bash
#Usage: ./organizer.sh <directory>

if [$# -ne 1] then:
   echo "Usage: ./$0 <directory>"
   exit 1
fi

DIR="$1"

if [! -d "$DIR"]; then
   echo "Directory does not exist."
   exit 1
fi

for file in *.sv; do
   mkdir -p "$DIR/verilog"
   mv "$file" "$DIR/verilog"
done

for file in *.c; do
   mkdir -p "$DIR/c_codes"
   mv "$file" "$DIR/c_codes"
done

for file in *.txt; do
   mkdir -p "$DIR/docs"
   mv "$file" "$DIR/docs"
done

echo "Files have been organized."