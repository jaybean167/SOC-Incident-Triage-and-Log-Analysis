#!/bin/bash
# Scenario 1: Parse authentication logs for SSH brute-force attempts

LOG_FILE="/var/log/auth.log"

echo "=========================================="
echo " Top 10 Offending IPs (Failed SSH) "
echo "=========================================="

if [ -f "$LOG_FILE" ]; then
    grep "Failed password" "$LOG_FILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head -n 10
else
    echo "Log file $LOG_FILE not found. Ensure root/sudo privileges."
fi
