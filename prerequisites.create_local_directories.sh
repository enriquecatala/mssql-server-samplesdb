#!/bin/bash

#  Enrique Catalá:
#    Web:      https://www.clouddataninjas.com
#    Linkedin: https://www.linkedin.com/in/enriquecatala/
#    Support:  https://github.com/sponsors/enriquecatala


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

# Set permissions (requires sudo)
sudo chmod +rwx "$BASE_DIR/data/"
sudo chmod +rwx "$BASE_DIR/shared_folder/"

echo "Directories created and permissions set."
