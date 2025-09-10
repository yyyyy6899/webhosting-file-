#!/bin/bash

# Set timezone
export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Start tmate session
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

# Display connection info
echo "✅ SSH access:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
echo "🌐 Web access (read-write):"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'

# Start Node.js app in background
node app.js &

# Wait for 3000 seconds (50 minutes)
sleep 3000

