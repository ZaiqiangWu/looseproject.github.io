#!/bin/sh

# Check if input file provided
if [ $# -lt 1 ]; then
  echo "Usage: $0 <video_file>"
  exit 1
fi

input="$1"

# Strip extension and get basename
filename=$(basename -- "$input")
extension="${filename##*.}"
basename="${filename%.*}"

# Construct output filename
output="${basename}_compressed.${extension}"

# Run ffmpeg compression
ffmpeg -i "$input" -c:v libx264 -preset veryslow -crf 21 -c:a copy "$output"

echo "Compressed video saved as: $output"

