#!/bin/bash
# linux_file_hasher.sh - Generates MD5 hashes and file sizes for all files in a directory

echo "Starting file hashing on Linux..."
find . -type f -exec sh -c 'echo "$(md5sum "{}" | awk "{print \$1}") $(stat -c%s "{}") {}"' \; > file_hashes_with_sizes.txt
echo "File listing with hashes and file sizes saved to file_hashes_with_sizes.txt"
