#!/bin/bash

SOURCE="application.log"
DESTINATION="backup/final-copy.log"

echo "================================"
echo "AUTOMATED BACKUP SYSTEM"
echo "================================"

if [ ! -f "$SOURCE" ]; then
    echo "ERROR: Source file does not exist."
    exit 1
fi

mkdir -p backup || {
    echo "ERROR: Could not create backup directory."
    exit 1
}

if cp "$SOURCE" "$DESTINATION"; then
    echo "SUCCESS: Backup created."
else
    echo "ERROR: Backup failed."
    exit 1
fi

if cmp -s "$SOURCE" "$DESTINATION"; then
    echo "SUCCESS: Backup contents verified."
else
    echo "ERROR: Backup verification failed."
    exit 1
fi

echo "SHA-256 checksums:"
sha256sum "$SOURCE" "$DESTINATION"

echo "BACKUP PROCESS COMPLETED."
