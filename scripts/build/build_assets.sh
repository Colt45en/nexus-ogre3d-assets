#!/bin/bash

# Build Script for Nexus OGRE 3D Assets
# Generates asset manifests, optimizes textures, and prepares distribution packages

set -e

echo "🔨 Building Nexus OGRE 3D Assets..."

# Configuration
BUILD_DIR="build"
DIST_DIR="dist"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

print_step() {
    echo -e "${BLUE}🔄 $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

# Create build directories
print_step "Creating build directories..."
mkdir -p "$BUILD_DIR" "$DIST_DIR"
print_success "Build directories created"

# Generate asset manifest
print_step "Generating asset manifest..."
cat > "$BUILD_DIR/manifest.json" << EOF
{
  "name": "Nexus OGRE 3D Assets",
  "version": "0.1.0",
  "build_date": "$(date -Iseconds)",
  "build_id": "$TIMESTAMP",
  "assets": {
    "materials": {
      "count": $(find materials/ -name "*.material" | wc -l),
      "scripts": [$(find materials/scripts/ -name "*.material" -printf '"%f",' | sed 's/,$//')],
      "shaders": {
        "glsl": [$(find materials/programs/GLSL/ -name "*.vert" -o -name "*.frag" -printf '"%f",' | sed 's/,$//')],
        "hlsl": [$(find materials/programs/HLSL/ -name "*.hlsl" -printf '"%f",' | sed 's/,$//')],
        "cg": [$(find materials/programs/CG/ -name "*.cg" -printf '"%f",' | sed 's/,$//')] 
      }
    },
    "models": {
      "meshes": [$(find models/meshes/ -name "*.mesh" -printf '"%f",' 2>/dev/null | sed 's/,$//' || echo '')],
      "skeletons": [$(find models/skeletons/ -name "*.skeleton" -printf '"%f",' 2>/dev/null | sed 's/,$//' || echo '')],
      "animations": [$(find models/animations/ -name "*.anim" -printf '"%f",' 2>/dev/null | sed 's/,$//' || echo '')]
    },
    "textures": {
      "diffuse": [$(find textures/diffuse/ -name "*.png" -o -name "*.dds" -printf '"%f",' 2>/dev/null | sed 's/,$//' || echo '')],
      "normal": [$(find textures/normal/ -name "*.png" -o -name "*.dds" -printf '"%f",' 2>/dev/null | sed 's/,$//' || echo '')],
      "specular": [$(find textures/specular/ -name "*.png" -o -name "*.dds" -printf '"%f",' 2>/dev/null | sed 's/,$//' || echo '')]
    }
  },
  "statistics": {
    "total_files": $(find . -type f \( -name "*.mesh" -o -name "*.material" -o -name "*.png" -o -name "*.dds" -o -name "*.vert" -o -name "*.frag" -o -name "*.hlsl" -o -name "*.cg" \) | wc -l),
    "total_size_mb": "$(du -sm . | cut -f1)"
  }
}
EOF
print_success "Asset manifest generated"

# Generate resource configuration
print_step "Generating optimized resource configuration..."
cat > "$BUILD_DIR/resources_optimized.cfg" << 'EOF'
# Optimized OGRE Resources Configuration
# Generated automatically - do not edit manually

[Bootstrap]
FileSystem=config/essential

[General]
# Materials
FileSystem=materials/scripts
FileSystem=materials/textures

# High-performance shader paths
FileSystem=materials/programs/GLSL
FileSystem=materials/programs/HLSL
FileSystem=materials/programs/CG

# Models and animations
FileSystem=models/meshes
FileSystem=models/skeletons
FileSystem=models/animations

# Optimized texture paths
FileSystem=textures/diffuse
FileSystem=textures/normal
FileSystem=textures/specular
FileSystem=textures/height
FileSystem=textures/ambient_occlusion

# Audio resources
FileSystem=sounds/effects
FileSystem=sounds/music
FileSystem=sounds/ambient

# Scene data
FileSystem=scenes/levels
FileSystem=scenes/environments

# Scripts
FileSystem=scripts/gameplay
FileSystem=scripts/ai
FileSystem=scripts/ui
EOF
print_success "Resource configuration generated"

# Create distribution package structure
print_step "Creating distribution package..."
PACKAGE_DIR="$DIST_DIR/nexus-ogre3d-assets-v0.1.0"
mkdir -p "$PACKAGE_DIR"

# Copy essential files to package
cp -r materials/ "$PACKAGE_DIR/" 2>/dev/null || mkdir -p "$PACKAGE_DIR/materials"
cp -r models/ "$PACKAGE_DIR/" 2>/dev/null || mkdir -p "$PACKAGE_DIR/models"
cp -r textures/ "$PACKAGE_DIR/" 2>/dev/null || mkdir -p "$PACKAGE_DIR/textures"
cp -r sounds/ "$PACKAGE_DIR/" 2>/dev/null || mkdir -p "$PACKAGE_DIR/sounds"
cp -r scripts/ "$PACKAGE_DIR/" 2>/dev/null || mkdir -p "$PACKAGE_DIR/scripts"
cp -r scenes/ "$PACKAGE_DIR/" 2>/dev/null || mkdir -p "$PACKAGE_DIR/scenes"
cp -r config/ "$PACKAGE_DIR/"
cp -r docs/ "$PACKAGE_DIR/"
cp README.md "$PACKAGE_DIR/"
cp LICENSE "$PACKAGE_DIR/"
cp CONTRIBUTING.md "$PACKAGE_DIR/"
cp "$BUILD_DIR/manifest.json" "$PACKAGE_DIR/"
cp "$BUILD_DIR/resources_optimized.cfg" "$PACKAGE_DIR/config/"

print_success "Distribution package created"

# Generate installation script
print_step "Generating installation script..."
cat > "$PACKAGE_DIR/install.sh" << 'EOF'
#!/bin/bash

# Nexus OGRE 3D Assets Installation Script

echo "🎮 Installing Nexus OGRE 3D Assets..."

if [ $# -eq 0 ]; then
    echo "Usage: $0 <ogre_project_path>"
    echo "Example: $0 /path/to/my/ogre/project"
    exit 1
fi

OGRE_PROJECT="$1"
MEDIA_DIR="$OGRE_PROJECT/media"

if [ ! -d "$OGRE_PROJECT" ]; then
    echo "❌ Error: OGRE project directory not found: $OGRE_PROJECT"
    exit 1
fi

echo "📂 Installing to: $MEDIA_DIR"

# Create media directories if they don't exist
mkdir -p "$MEDIA_DIR"/{materials,models,textures,sounds,scripts,scenes}

# Copy assets
echo "📦 Copying materials..."
cp -r materials/* "$MEDIA_DIR/materials/" 2>/dev/null || true

echo "📦 Copying models..."  
cp -r models/* "$MEDIA_DIR/models/" 2>/dev/null || true

echo "📦 Copying textures..."
cp -r textures/* "$MEDIA_DIR/textures/" 2>/dev/null || true

echo "📦 Copying configuration..."
cp config/resources_optimized.cfg "$OGRE_PROJECT/" 2>/dev/null || true

echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Update your OGRE application to use: resources_optimized.cfg"
echo "2. Load materials using: MaterialManager::getSingleton().load()"
echo "3. Check the README.md for usage examples"
EOF

chmod +x "$PACKAGE_DIR/install.sh"
print_success "Installation script generated"

# Create archive
print_step "Creating distribution archive..."
cd "$DIST_DIR"
tar -czf "nexus-ogre3d-assets-v0.1.0-$TIMESTAMP.tar.gz" "nexus-ogre3d-assets-v0.1.0/"
cd - > /dev/null
print_success "Distribution archive created"

# Generate build report
print_step "Generating build report..."
cat > "$BUILD_DIR/build_report.txt" << EOF
Nexus OGRE 3D Assets Build Report
=================================

Build Date: $(date)
Build ID: $TIMESTAMP
Version: 0.1.0

Asset Counts:
- Material Scripts: $(find materials/scripts/ -name "*.material" | wc -l)
- Shader Programs: $(find materials/programs/ -name "*.vert" -o -name "*.frag" -o -name "*.hlsl" -o -name "*.cg" | wc -l)
- Model Files: $(find models/ -name "*.mesh" -o -name "*.skeleton" -o -name "*.anim" | wc -l)
- Texture Files: $(find textures/ -name "*.png" -o -name "*.dds" | wc -l)

Package Size: $(du -sh "$DIST_DIR/nexus-ogre3d-assets-v0.1.0-$TIMESTAMP.tar.gz" | cut -f1)

Files Generated:
- $BUILD_DIR/manifest.json
- $BUILD_DIR/resources_optimized.cfg
- $DIST_DIR/nexus-ogre3d-assets-v0.1.0/
- $DIST_DIR/nexus-ogre3d-assets-v0.1.0-$TIMESTAMP.tar.gz

Build Status: SUCCESS
EOF

print_success "Build report generated"

echo ""
echo "🎉 Build completed successfully!"
echo "📦 Distribution package: $DIST_DIR/nexus-ogre3d-assets-v0.1.0-$TIMESTAMP.tar.gz"
echo "📊 Build report: $BUILD_DIR/build_report.txt"
echo "📋 Asset manifest: $BUILD_DIR/manifest.json"