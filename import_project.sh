#!/bin/bash
# ThutoHub Project Import Script for Linux/Mac
# This script helps import your local ThutoHub Flutter project into this repository

echo "========================================"
echo "ThutoHub Project Import Script"
echo "========================================"
echo ""

# Define source path (update this to match your local path)
SOURCE_PATH="/path/to/your/thutohub/project"

# Get the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DEST_PATH="$SCRIPT_DIR"

echo "Source Path: $SOURCE_PATH"
echo "Destination Path: $DEST_PATH"
echo ""

# Check if source path exists
if [ ! -d "$SOURCE_PATH" ]; then
    echo "ERROR: Source path does not exist!"
    echo "Please update the SOURCE_PATH variable in this script to point to your ThutoHub project."
    echo ""
    echo "Edit this script and change:"
    echo "  SOURCE_PATH=\"/path/to/your/thutohub/project\""
    echo ""
    exit 1
fi

echo "Source path verified."
echo ""

# Confirm with user
read -p "Do you want to proceed with the import? (Y/N): " CONFIRM
if [ "$CONFIRM" != "Y" ] && [ "$CONFIRM" != "y" ]; then
    echo "Import cancelled."
    exit 0
fi

echo ""
echo "Starting import..."
echo ""

# Use rsync to copy files, excluding certain directories and files
rsync -av \
    --exclude='.git/' \
    --exclude='.dart_tool/' \
    --exclude='build/' \
    --exclude='.idea/' \
    --exclude='.vscode/' \
    --exclude='supabase/.temp' \
    --exclude='.env' \
    --exclude='.env.local' \
    --exclude='.env.production' \
    --exclude='*.key' \
    "$SOURCE_PATH/" "$DEST_PATH/"

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "Import completed successfully!"
    echo "========================================"
    echo ""
    echo "Next steps:"
    echo "1. Review the imported files: git status"
    echo "2. Test your Flutter app: flutter pub get"
    echo "3. Commit the changes: git add . && git commit -m 'Import ThutoHub Flutter project'"
    echo "4. Push to GitHub: git push origin main"
    echo ""
else
    echo ""
    echo "ERROR: Import failed!"
    echo "Please check the error messages above."
    echo ""
    exit 1
fi
