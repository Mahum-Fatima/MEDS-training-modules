#!/bin/bash
# Usage: ./batch_rename.sh <prefix> <suffix> <directory>
set -euo pipefail

if [$# -ne 3]; then
   echo "Usage: ./$0 <prefix> <suffix> <directory>"
   exit 1
fi

PREFIX="$1"
SUFFIX="$2"
DIR="$3"

required=0

if [! -d "$DIR"]; then
   echo "Directory not found."
   exit 1
fi

for file in "$DIR"/*; do
   required="${file/${PREFIX}_old_/}"
   newname="${SUFFIX}_new_${required}"
   mv "$file" "$DIR/$newname"
done

echo "Renaming complete."