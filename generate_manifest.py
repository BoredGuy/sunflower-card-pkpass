#!/usr/bin/env python3
"""
Generate manifest.json for PKPass file.

This script reads all asset files in the pass package and creates a manifest.json
with SHA-256 hashes for each file. The manifest is used to verify the integrity
of the pass when it is signed and installed on an iOS device.

Usage:
    python3 generate_manifest.py

Output:
    manifest.json
"""

import hashlib
import json
from pathlib import Path


def generate_manifest():
    """Generate manifest.json with SHA-256 hashes of all pass files."""
    
    # Files that should be included in the manifest
    files_to_hash = [
        "pass.json",
        "logo.png",
        "logo@2x.png",
        "icon.png",
        "icon@2x.png",
        "strip.png",
        "strip@2x.png",
    ]
    
    manifest = {}
    
    for filename in files_to_hash:
        filepath = Path(filename)
        
        if not filepath.exists():
            print(f"Warning: {filename} not found. Skipping.")
            continue
        
        # Read file and compute SHA-256 hash
        file_content = filepath.read_bytes()
        file_hash = hashlib.sha256(file_content).hexdigest()
        manifest[filename] = file_hash
        print(f"✓ {filename}: {file_hash}")
    
    # Write manifest.json
    manifest_path = Path("manifest.json")
    manifest_path.write_text(json.dumps(manifest, indent=2))
    print(f"\n✓ manifest.json created with {len(manifest)} files")
    return manifest


if __name__ == "__main__":
    try:
        generate_manifest()
    except Exception as e:
        print(f"Error: {e}")
        exit(1)
