#!/bin/bash

# Warning message
echo "Converting all .m4a and .mp3 files in the samples directory to .wav format."
echo "Original files will be deleted after conversion."
echo "Press Ctrl+C to cancel or Enter to continue."
read -r

# Path to the samples directory
samples_dir="samples"

# Navigate through the samples directory
find "$samples_dir" -type f \( -name "*.m4a" -o -name "*.mp3" \) | while read file; do
  # Extract the base name without extension
  base_name="${file%.*}"
  # Convert to .wav
  if ffmpeg -i "$file" "${base_name}.wav"; then
    # Delete original file if conversion is successful
    rm "$file"
  else
    echo "Failed to convert $file"
  fi
done
