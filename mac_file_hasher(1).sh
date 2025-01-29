#!/bin/bash
# mac_file_hasher.sh - Generates SHA-1 hashes, file sizes, and modification timestamps for all files in a directory

echo "Starting file hashing on macOS..."
find . -type f -exec sh -c 'echo "$(shasum "{}" | awk "{print \$1}") $(stat -f "%z %Sm" -t "%Y-%m-%d %H:%M:%S" "{}") {}"' \; > file_details.txt
echo "File listing with hashes and metadata saved to file_details.txt"
