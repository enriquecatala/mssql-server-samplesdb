#!/bin/bash

# Define the base directory and backups directory
BASE_DIR="./local_mountpoint"
BACKUPS_DIR="./Backups"

# Create directories
mkdir -p "$BASE_DIR/data/"
mkdir -p "$BASE_DIR/shared_folder/"
mkdir -p "$BACKUPS_DIR"

# Set ownership for mssql user (requires sudo)
sudo chown 10001:0 "$BASE_DIR/data/"
sudo chown 10001:0 "$BASE_DIR/shared_folder/"
sudo chown 10001:0 "$BACKUPS_DIR"

# Set permissions (requires sudo)
sudo chmod +rwx "$BASE_DIR/data/"
sudo chmod +rwx "$BASE_DIR/shared_folder/"
sudo chmod +rwx "$BACKUPS_DIR"

echo "Directories created and permissions set."
