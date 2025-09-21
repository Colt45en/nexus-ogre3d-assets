#!/bin/bash
# OGRE 3D Asset Repository Setup Script
# Usage: ./setup.sh [install_path]

set -e

# Default installation path
INSTALL_PATH=${1:-"/usr/local/share/ogre3d/nexus-assets"}
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

echo "===================================="
echo "Nexus OGRE 3D Assets Setup"
echo "===================================="
echo "Installation path: $INSTALL_PATH"
echo "Package config path: $PKG_CONFIG_PATH"
echo ""

# Check if OGRE is installed
if ! pkg-config --exists OGRE; then
    echo "Warning: OGRE 3D not found via pkg-config"
    echo "Please ensure OGRE 3D SDK is properly installed"
    echo ""
fi

# Create installation directories
echo "Creating installation directories..."
mkdir -p "$INSTALL_PATH"/{materials/{programs,scripts,textures},models,terrain,bullet}
mkdir -p "$PKG_CONFIG_PATH"

# Copy assets
echo "Copying asset files..."
cp -r materials/* "$INSTALL_PATH/materials/"
cp -r models/* "$INSTALL_PATH/models/"
cp -r terrain/* "$INSTALL_PATH/terrain/"
cp -r bullet/* "$INSTALL_PATH/bullet/"
cp terrain.cfg "$INSTALL_PATH/"

# Install pkg-config file
echo "Installing package configuration..."
sed "s|/usr/local|$(dirname $(dirname $INSTALL_PATH))|g" \
    pkgconfig/nexus-ogre3d-assets.pc > "$PKG_CONFIG_PATH/nexus-ogre3d-assets.pc"

echo ""
echo "Installation complete!"
echo ""
echo "To use in your OGRE application:"
echo "  pkg-config --variable=assetsdir nexus-ogre3d-assets"
echo ""
echo "Asset locations:"
echo "  Materials: $INSTALL_PATH/materials/"
echo "  Models: $INSTALL_PATH/models/"
echo "  Terrain: $INSTALL_PATH/terrain/"
echo "  Physics: $INSTALL_PATH/bullet/"
echo ""
echo "Add these paths to your OGRE resource locations:"
echo "  ResourceGroupManager::getSingleton().addResourceLocation("
echo "    \"$INSTALL_PATH/materials/scripts\", \"FileSystem\", \"General\");"
echo "  ResourceGroupManager::getSingleton().addResourceLocation("
echo "    \"$INSTALL_PATH/materials/textures\", \"FileSystem\", \"General\");"
echo ""