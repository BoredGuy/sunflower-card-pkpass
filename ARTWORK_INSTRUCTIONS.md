# Artwork Setup Instructions

This document explains how to obtain and prepare the official Hidden Disabilities Sunflower artwork for your PKPass package.

## Official Artwork Sources

### Primary Sources

1. **Brandfetch** (Recommended)
   - URL: https://brandfetch.com/hdsunflower.com
   - Provides SVG and PNG formats
   - Multiple sizes available
   - Licensed for authorized use

2. **Official Hidden Disabilities Website**
   - URL: https://hdsunflower.com/visual-identity
   - Brand guidelines and official assets
   - Contact for usage permissions

3. **Hidden Disabilities Store**
   - URL: https://hiddendisabilitiesstore.com
   - Physical products and digital assets

## Required Artwork Files

For Apple Wallet, you need the following image files:

### 1. Logo (Primary Branding)
- `logo.png` — 160×50 pixels (standard resolution)
- `logo@2x.png` — 320×100 pixels (Retina/2x resolution)
- Format: PNG with transparency
- Use: Displayed at top of pass

### 2. Icon (Pass Identifier)
- `icon.png` — 29×29 pixels (standard resolution)
- `icon@2x.png` — 58×58 pixels (Retina/2x resolution)
- Format: PNG with transparency
- Use: Shown in Wallet app and lock screen

### 3. Strip/Banner (Decorative Element)
- `strip.png` — 375×98 pixels (standard resolution)
- `strip@2x.png` — 750×196 pixels (Retina/2x resolution)
- Format: PNG
- Use: Background or accent strip on pass

## Setup Steps

### Step 1: Download Official Assets

1. Visit one of the official sources listed above
2. Download the official Hidden Disabilities Sunflower sunflower logo in PNG format
3. Save with appropriate dimensions and naming

### Step 2: Prepare Images

If you download SVG or other formats, convert to PNG:

**Using ImageMagick:**
```bash
# Convert SVG to PNG at specific dimensions
convert -density 300 -resize 160x50 sunflower-logo.svg logo.png
convert -density 300 -resize 320x100 sunflower-logo.svg logo@2x.png
convert -density 300 -resize 29x29 sunflower-logo.svg icon.png
convert -density 300 -resize 58x58 sunflower-logo.svg icon@2x.png
convert -density 300 -resize 375x98 sunflower-strip.svg strip.png
convert -density 300 -resize 750x196 sunflower-strip.svg strip@2x.png
```

**Using GIMP:**
1. Open official SVG or high-res PNG
2. Image → Scale Image
3. Set dimensions as above
4. File → Export As → .png
5. Repeat for each size variant

**Using Online Tools:**
- TinyPNG (https://tinypng.com) for optimization
- Pixlr (https://pixlr.com) for resizing
- Cloudconvert (https://cloudconvert.com) for format conversion

### Step 3: Validate Images

Ensure all images meet Apple Wallet requirements:

```bash
# Check dimensions and format
file logo.png logo@2x.png icon.png icon@2x.png strip.png strip@2x.png

# Check file sizes (should be reasonable)
ls -lh logo.png logo@2x.png icon.png icon@2x.png strip.png strip@2x.png
```

**Specifications:**
- Format: PNG (RGB or RGBA)
- Color space: sRGB or Display P3
- Max file size: ~500KB per image (Apple guideline)
- Resolution: Exact dimensions as specified
- Transparency: Supported (use for logo/icon)

### Step 4: Place in Repository

1. Save all PNG files in the root directory of this repository
2. Use exact filenames:
   - `logo.png`, `logo@2x.png`
   - `icon.png`, `icon@2x.png`
   - `strip.png`, `strip@2x.png`
3. Commit to repository

## Color Specifications

If you need to create or modify artwork, use official colors:

- **Dark Green Background:** #006341 (RGB: 0, 99, 65)
- **Sunflower Yellow Petals:** #FFC72C (RGB: 255, 199, 44)
- **Sunflower Brown Center:** #6F5538 (RGB: 111, 85, 56)
- **Leaf Green:** #00A651 (RGB: 0, 166, 81)
- **Text/Accents:** White (#FFFFFF) on dark background

## Brand Compliance Checklist

- [ ] Using official artwork from authorized sources
- [ ] No modifications to the sunflower design
- [ ] Colors match official specifications
- [ ] All images are high quality and properly sized
- [ ] Permission/authorization confirmed with Hidden Disabilities Sunflower Scheme Ltd
- [ ] All PNG files present and correctly named

## Troubleshooting

### "File not found" errors during build
- Ensure all PNG files are in the repository root
- Check exact filenames (case-sensitive on Linux/Mac)
- Verify files are saved as PNG format, not other formats

### Image quality issues
- Use high-resolution source (at least 300 DPI for SVG conversion)
- Avoid excessive compression
- Test on actual iOS device if possible

### Color issues on device
- Ensure PNG color space is sRGB
- Test on different iOS versions
- Verify against official brand guidelines

## Legal Notice

**Important:** The Hidden Disabilities Sunflower is a registered trademark. Ensure you have authorization from Hidden Disabilities Sunflower Scheme Ltd before using this artwork for distribution or commercial purposes.

For licensing questions, contact:
- Website: https://hdsunflower.com
- Store: https://hiddendisabilitiesstore.com
