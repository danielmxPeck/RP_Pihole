#!/bin/bash
echo "🕰️ Date & Time"
echo "$(date)"
echo ""

echo "👤 User"
echo "HostName: $(hostname)"
echo "IPV4: $(hostname -I | awk '{print $1}')"
echo ""

echo "🖥️  Pi Health Check"
echo "CPU Load: $(uptime | awk -F'load average:' '{ print $2 }')"
echo "Memory Usage: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 "/" $2}')"
echo "CPU Temp: $(vcgencmd measure_temp)"

echo ""

# Get Pi-hole status
echo "🔍 Pi-hole Health Check"
pihole_status=$(/usr/local/bin/pihole status | grep -io 'enabled\|disabled')
pihole_PID=$(pgrep pihole-FTL)
test_block=$(dig +short doubleclick.com @127.0.0.1)

echo "PI_PID: $pihole_PID"
echo "Pi-hole Status: $pihole_status"

if [ "$pihole_status" == "enabled" ]; then
    echo "Enabled ✅"
else
    echo "Disabled ❌"
fi

if [[ "$test_block" == "0.0.0.0" || -z "$test_block" ]]; then
    echo "Ad Blocking ✅ Working"
else
    echo "Ad Blocking ❌ Not Working"
    echo "Returned IP: $test_block"
fi
