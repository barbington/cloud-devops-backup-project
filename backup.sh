#!/bin/bash

echo "DevOps Backup Script"

TIMESTAMP=$(date)

mkdir -p backup

if [ -f application.log ]; then cp application.log backup/
    echo "Backup completed successfully at $TIMESTAMP."
else
    echo "ERROR: application.log not found."
fi
