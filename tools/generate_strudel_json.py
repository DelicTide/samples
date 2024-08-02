import os
import json

# Path to the samples directory
samples_dir = os.path.join(os.path.dirname(__file__), '../samples')

# Walk through the directory and list all .wav files
wav_files = []
for root, dirs, files in os.walk(samples_dir):
    for file in files:
        if file.endswith('.wav'):
            # Relative path from samples directory
            relative_path = os.path.relpath(os.path.join(root, file), start=samples_dir)
            wav_files.append(relative_path)

# Create a dictionary for strudel.json
strudel_config = {
    "name": "Vocal_Samples",
    "version": "1.0.0",
    "description": "A collection of audio samples for music projects.",
    "resources": wav_files,
    "repository": {
        "type": "git",
        "url": "https://github.com/DelicTide/Live_music.git"
    },
    "keywords": ["audio", "samples", "wav", "music"],
    "author": "tashi-delic_tide",
    "license": "MIT"
}

# Write to strudel.json in the root directory
with open(os.path.join(os.path.dirname(__file__), '../strudel.json'), 'w') as json_file:
    json.dump(strudel_config, json_file, indent=4)

print("strudel.json has been created/updated with all available .wav files.")
