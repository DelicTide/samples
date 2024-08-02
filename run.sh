#!/bin/bash

# Path to tools directory
TOOLS_DIR="tools"

# Default options (run all scripts if no flags are provided)
RUN_OVERSIZED_FILES=false
RUN_CONVERT2WAV=false
RUN_RENAME_FILES=false
RUN_STRUDEL_JSON=false

# Parse command-line arguments
while getopts "ocrg" opt; do
  case ${opt} in
    o) RUN_OVERSIZED_FILES=true ;;
    c) RUN_CONVERT2WAV=true ;;
    r) RUN_RENAME_FILES=true ;;
    g) RUN_STRUDEL_JSON=true ;;
    *) echo "Usage: $0 [-o] [-c] [-r] [-g]" ;;
  esac
done

# Run oversized files script if the option is set
if [ "$RUN_OVERSIZED_FILES" = true ]; then
  echo "Running oversized_files.py..."
  python3 "$TOOLS_DIR/oversized_files.py"
fi

# Run convert to WAV script if the option is set
if [ "$RUN_CONVERT2WAV" = true ]; then
  echo "Running convert2wav.sh..."
  bash "$TOOLS_DIR/convert2wav.sh"
fi

# Run rename files script if the option is set
if [ "$RUN_RENAME_FILES" = true ]; then
  echo "Running rename_files.sh..."
  bash "$TOOLS_DIR/rename_files.sh"
fi

# Generate strudel.json if the option is set
if [ "$RUN_STRUDEL_JSON" = true ]; then
  echo "Updating strudel.json..."
  python3 "$TOOLS_DIR/generate_strudel_json.py"
fi

# If no specific option was set, run all scripts
if ! $RUN_OVERSIZED_FILES && ! $RUN_CONVERT2WAV && ! $RUN_RENAME_FILES && ! $RUN_STRUDEL_JSON; then
  echo "No specific options set. Running all scripts by default."

  echo "Running oversized_files.py..."
  python3 "$TOOLS_DIR/oversized_files.py"

  echo "Running convert2wav.sh..."
  bash "$TOOLS_DIR/convert2wav.sh"

  echo "Running rename_files.sh..."
  bash "$TOOLS_DIR/rename_files.sh"

  echo "Updating strudel.json..."
  python3 "$TOOLS_DIR/generate_strudel_json.py"
fi

echo "Selected tasks completed."
