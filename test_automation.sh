#!/bin/bash

# Set the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Step 1: Validate docker-compose configuration
echo "Validating docker-compose configuration..."
docker-compose -f "$SCRIPT_DIR/docker-compose.yml" config

# Step 2: Start required containers
echo "Starting required Docker containers..."
docker-compose -f "$SCRIPT_DIR/docker-compose.yml" up -d website selenium

# Step 3: Open screensharing app and connect
echo "Opening screensharing app and connecting..."
osascript <<EOF
tell application "Screen Sharing"
    activate
    open location "vnc://localhost:5901"
    delay 1
    tell application "System Events" to keystroke "secret"
    delay 1
    tell application "System Events" to keystroke return
end tell
EOF

# Wait for the connection to process (you might need to adjust the sleep duration)
sleep 10

# Step 4: Run unit tests
echo "Running unit tests..."
docker-compose -f "$SCRIPT_DIR/docker-compose.yml" run --rm unit-tests

echo "All tasks completed."
