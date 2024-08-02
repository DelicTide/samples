#!/bin/bash

# Warning message
echo "Renaming all .wav files in the samples directory by replacing spaces with underscores."
echo "Press Ctrl+C to cancel or Enter to continue."
read -r

# Path to the samples directory
samples_dir="samples"

# Rename all .wav files in the samples directory recursively
find "$samples_dir" -type f -name "*.wav" | while read file; do
  # Extract the base name and extension
  directory="$(dirname "$file")"
  filename="$(basename "$file")"

  # Replace spaces with underscores
  new_filename="${filename// /_}"

  # Rename the file
  mv "$file" "$directory/$new_filename"

  # Print the rename action
  echo "Renamed '$file' to '$directory/$new_filename'"
done
