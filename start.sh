#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Start tmate session
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

# Output connection details
echo "SSH access:"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'
echo "Web access (read-write):"
tmate -S /tmp/tmate.sock display -p '#{tmate_web}'

# Keep alive
while true; do
    tmate -S /tmp/tmate.sock send-keys "echo alive && date" C-m
    sleep 300
done
