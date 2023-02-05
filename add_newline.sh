#!/bin/bash

# Function to add a newline character to the end of a file
add_newline() {
  local file=$1
  if [ -f "$file" ] && ! tail -c 1 "$file" | read -r _ ; then
    echo >> "$file"
  fi
}

# Find all YAML files in the current directory and its subdirectories
find . -name '*.yml' -type f -print0 | while IFS= read -r -d '' file; do
  add_newline "$file"
done