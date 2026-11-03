#!/bin/bash

SOURCE="application.log"
DESTINATION="backup/safe-copy.log"

echo "Starting safe copy operation..."

if [ ! -f "$SOURCE" ]; then
    echo "ERROR: Source file does not exist."
    exit 1
fi
if cp "$SOURCE" "$DESTINATION"; then
    echo "SUCCESS: File copied successfully."
else
    echo "ERROR: Copy operation failed."
    exit 1
fi
