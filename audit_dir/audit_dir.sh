#!/bin/bash

set -euo pipefail

readonly DIRECTORY_AUDIT_FILE="directory_audit.txt"
readonly LOG_ERRORS_FILE="audit.log"
readonly TARGET_DIRECTORY=$1

if [ ! -d "$TARGET_DIRECTORY" ]; then
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] Error: Directory '$TARGET_DIRECTORY' does not exist" >> "$LOG_ERRORS_FILE"
  exit 1
fi

ls "$TARGET_DIRECTORY" > "$DIRECTORY_AUDIT_FILE" 2>> "$LOG_ERRORS_FILE"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Success: Audited '$TARGET_DIRECTORY'" >> "$LOG_ERRORS_FILE"
