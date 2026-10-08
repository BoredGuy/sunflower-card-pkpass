#!/bin/bash

# Build unsigned PKPass file
#
# This script creates an unsigned .pkpass (zip) file from the pass package.
# The resulting file cannot be installed on iOS devices without signing.
#
# Usage:
#     bash build.sh
#
# Output:
#     Hidden Disabilities Sunflower Card.pkpass

set -e

PASS_NAME="Hidden Disabilities Sunflower Card"
OUTPUT_FILE="${PASS_NAME}.pkpass"

echo "Building unsigned PKPass..."
echo ""

# Check required files
required_files=(
    "pass.json"
    "manifest.json"
    "logo.png"
    "logo@2x.png"
    "icon.png"
    "icon@2x.png"
    "strip.png"
    "strip@2x.png"
)

for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "✗ Error: Required file not found: $file"
        exit 1
    fi
done

echo "✓ All required files found"
echo ""

# Create the .pkpass file (which is a zip archive)
echo "Creating .pkpass archive..."
zip -q -r "${OUTPUT_FILE}" \
    pass.json \
    manifest.json \
    logo.png \
    logo@2x.png \
    icon.png \
    icon@2x.png \
    strip.png \
    strip@2x.png \
    -x "*.DS_Store" "*.git*"

echo "✓ .pkpass file created: ${OUTPUT_FILE}"
echo ""
echo "Next steps:"
echo "1. Sign the .pkpass file using Apple's pass signing certificate"
echo "2. Distribute the signed .pkpass to end users"
echo "3. Users can add it to Apple Wallet by opening the file on iOS"
echo ""
echo "This unsigned .pkpass file cannot be installed on iOS devices."
echo "It requires digital signing with a valid Apple pass certificate."
