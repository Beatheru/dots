#!/bin/bash

# Run all script files
for file in "$SCRIPTS_DIR"/*; do
  if [[ -f "$file" && "$file" == *.sh ]]; then
    echo "Running $file"
    bash "$file"
  fi
done