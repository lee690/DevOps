#!/bin/bash

# Set the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Generate a unique container name based on timestamp
CONTAINER_NAME="website_$(date +%Y%m%d%H%M%S)"

# Build Docker image
echo "Building Docker image..."
docker build -t website_server "$SCRIPT_DIR"

# Run Docker container
echo "Running Docker container..."
docker run --publish 80:80 --name "$CONTAINER_NAME" website_server

echo "Docker container is up and running."

