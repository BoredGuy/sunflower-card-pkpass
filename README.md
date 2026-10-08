# Hidden Disabilities Sunflower Card PKPass

This repository contains a complete unsigned Apple Wallet (PKPass) package for the Hidden Disabilities Sunflower Card, adhering to official design guidelines and brand specifications.

## Official Design Guidelines

### Colors
- **Primary Background:** Dark Green (Pantone 356 C, RGB: 0, 99, 65, Hex: #006341)
- **Sunflower Yellow:** (Pantone 123 C, RGB: 255, 199, 44, Hex: #FFC72C)
- **Sunflower Brown:** (Pantone 7568 C, RGB: 111, 85, 56, Hex: #6F5538)
- **Leaf Green:** (Pantone 355 C, RGB: 0, 166, 81, Hex: #00A651)

### Card Specifications
- Standard credit card size: 85.6mm × 54mm
- Message: "Some disabilities are hidden. Please offer me help if I need it."
- Symbol: Official Hidden Disabilities Sunflower logo
- Accessibility: High contrast, readable sans-serif typography

## Package Structure

```
.
├── pass.json              # Pass metadata and configuration
├── logo.png               # Main logo (160×50)
├── logo@2x.png            # Retina logo (320×100)
├── icon.png               # Pass icon (29×29)
├── icon@2x.png            # Retina icon (58×58)
├── strip.png              # Horizontal strip (375×98)
├── strip@2x.png           # Retina strip (750×196)
├── manifest.json          # SHA-256 hashes of all pass files
├── build.sh               # Script to generate unsigned .pkpass
├── generate_manifest.py   # Script to generate manifest.json
└── README.md              # This file
```

## Before You Build

### Requirements
- Python 3.6+
- Bash shell
- `zip` command-line utility
- Official artwork files (see Assets section)

### Assets
Official Hidden Disabilities Sunflower artwork is available from:
- Brandfetch: https://brandfetch.com/hdsunflower.com
- Official Site: https://hdsunflower.com/visual-identity

Place the official PNG artwork files in this directory with the following names:
- `logo.png` (160×50 pixels)
- `logo@2x.png` (320×100 pixels)
- `icon.png` (29×29 pixels)
- `icon@2x.png` (58×58 pixels)
- `strip.png` (375×98 pixels)
- `strip@2x.png` (750×196 pixels)

## Building the Unsigned PKPass

### Step 1: Generate manifest.json

```bash
python3 generate_manifest.py
```

This creates a `manifest.json` file with SHA-256 hashes of all pass files.

### Step 2: Build the .pkpass file

```bash
bash build.sh
```

This creates an unsigned `Hidden Disabilities Sunflower Card.pkpass` file.

## Signing and Distribution

The unsigned .pkpass file created above **cannot be installed on iOS devices** without signing.

To sign and distribute:

1. **Obtain Apple Wallet signing credentials:**
   - Register with Apple Developer Program
   - Create a Pass Type ID
   - Generate a Pass Type ID Certificate
   - Obtain your Team ID

2. **Sign the pass using:**
   - Apple's official pass signing tool
   - A third-party pass provider (PassKit, Wallet Pass, etc.)
   - Custom signing implementation using OpenSSL

3. **Example signing with OpenSSL (macOS/Linux):**
   ```bash
   # After obtaining certificate.p12 and WWDR certificate
   openssl pkcs12 -in certificate.p12 -out certificate.pem -nodes
   openssl smime -sign -in manifest.json -out signature -signer certificate.pem -inform PEM -outform DER -binary
   # Replace signature in the .pkpass zip
   ```

## Configuration

Edit `pass.json` to customize:
- `passTypeIdentifier` — Your Apple Pass Type ID
- `teamIdentifier` — Your Apple Team ID
- `serialNumber` — Unique identifier for each pass
- `barcode.message` — QR code content (URL or custom data)
- Custom fields in `generic` section

## Brand Compliance

This package adheres to official Hidden Disabilities Sunflower design guidelines:
- ✓ Official color palette
- ✓ Approved sunflower symbol
- ✓ High-contrast accessible design
- ✓ Appropriate messaging
- ✓ Compliant typography

**Important:** Authorized use only. Do not modify the official brand design without permission from Hidden Disabilities Sunflower Scheme Ltd.

## References

- [Hidden Disabilities Sunflower Official Site](https://hdsunflower.com)
- [Apple Wallet Developer Documentation](https://developer.apple.com/wallet/)
- [PKPass File Format Specification](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/PassKit_PG/)
