#!/bin/bash

# Set the process name (modify as needed)
PROCESS_NAME="pihole-FTL"

# Find the PID of the process
PID=$(pgrep "$PROCESS_NAME")

# Check if the process is running
if [[ -z "$PID" ]]; then
    echo "Process $PROCESS_NAME is NOT running."
    exit 1
fi

# Get CPU, Memory, and TIME+ from 'ps'
PROCESS_INFO=$(ps -p $PID -o pid,pcpu,pmem,time --no-header)

# Extract values
CPU_USAGE=$(echo "$PROCESS_INFO" | awk '{print $2}')
MEM_USAGE=$(echo "$PROCESS_INFO" | awk '{print $3}')
TIME_USED=$(echo "$PROCESS_INFO" | awk '{print $4}')

# Display results
echo "🔍 Monitoring Process: $PROCESS_NAME (PID: $PID)"
echo "📊 CPU Usage: $CPU_USAGE%"
echo "🖥️ Memory Usage: $MEM_USAGE%"
echo "⏳ Time+: $TIME_USED"
