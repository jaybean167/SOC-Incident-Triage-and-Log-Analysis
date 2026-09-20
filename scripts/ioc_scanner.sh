#!/bin/bash
# IOC Scanner - SHA-256 Hash Extractor
# Objective: Calculate file hashes in target directory to compare against IOC threat feeds

TARGET_DIR="${1:-/tmp}"
LOG_FILE="/var/log/ioc_scan_$(date +%Y%m%d_%H%M%S).log"

echo "=== IOC Hash Scanning Started: $(date) ===" | tee -a "$LOG_FILE"
echo "Target Directory: $TARGET_DIR" | tee -a "$LOG_FILE"
echo "--------------------------------------------------" | tee -a "$LOG_FILE"

if [ ! -d "$TARGET_DIR" ]; then
    echo "[ERROR] Directory $TARGET_DIR does not exist." | tee -a "$LOG_FILE"
    exit 1
fi

echo "[+] Generating SHA-256 hashes..." | tee -a "$LOG_FILE"
find "$TARGET_DIR" -type f -exec sha256sum {} + 2>/dev/null | tee -a "$LOG_FILE"

echo "--------------------------------------------------" | tee -a "$LOG_FILE"
echo "=== Scan Complete. Results saved to $LOG_FILE ===" | tee -a "$LOG_FILE"
