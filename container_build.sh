#!/bin/bash

# Set the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Generate a unique container name based on timestamp
CONTAINER_NAME="website_$(date +%Y%m%d%H%M)"

# Build and run Docker containers using docker-compose
echo "Building and running Docker containers..."
docker-compose -f "$SCRIPT_DIR/docker-compose.yml" up -d

echo "Docker containers are up and running."

