# File Hasher Scripts

These scripts generate a list of all files in a directory, along with their cryptographic hashes, file sizes, and modification timestamps.

They can be used for an internal macOS drive or any external drive hooked up to a Linux machine.

## 🚀 Usage

1. **Download the script** for your operating system:
   - `mac_file_hasher.sh` for macOS
   - `linux_file_hasher.sh` for Linux

2. **Open a terminal** and navigate to the directory where you want to list and hash all files:
   ```bash
   cd /path/to/directory
   ```

3. **Run the script:**
   - For macOS:
     ```bash
     bash mac_file_hasher.sh
     ```
   - For Linux:
     ```bash
     bash linux_file_hasher.sh
     ```

4. **Monitor the Output in Real Time**
   - For macOS:
     ```bash
     tail -f file_details.txt
     ```
   - For Linux:
     ```bash
     tail -f file_hashes_with_sizes.txt
     ```

   This will continuously update the terminal with newly processed files as they are hashed.

5. **Results are saved to:**
   - `file_details.txt` (macOS)
   - `file_hashes_with_sizes.txt` (Linux)

📌 **Standalone Commands (Without Running a Script)**

- For macOS (SHA-1 hash, file size, and last modification date):
  ```bash
  find . -type f -exec sh -c 'echo "$(shasum "{}" | awk "{print \$1}") $(stat -f "%z %Sm" -t "%Y-%m-%d %H:%M:%S" "{}") {}"' \; > file_details.txt
  ```
- For Linux (MD5 hash and file size):
  ```bash
  find . -type f -exec sh -c 'echo "$(md5sum "{}" | awk "{print \$1}") $(stat -c%s "{}") {}"' \; > file_hashes_with_sizes.txt
  ```

To actively watch the progress while running a standalone command:
```bash
tail -f file_details.txt   # For macOS
tail -f file_hashes_with_sizes.txt   # For Linux
```

📂 **Example Output**
```
b1946ac92492d2347c6235b4d2611184 12345 2025-01-24 12:00:00 ./example.txt
c157a79031e1c40f85931829bc5fc552 67890 2025-01-23 18:30:00 ./documents/report.pdf
```

🔧 **Requirements**
- macOS: Uses `shasum`, `stat`, and `awk` (all default in macOS).
- Linux: Uses `md5sum`, `stat`, and `awk` (default on most Linux distributions).

📜 **License**
These scripts are free to use and modify.
