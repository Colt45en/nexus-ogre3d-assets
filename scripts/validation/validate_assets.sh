#!/bin/bash

# Asset Validation Script for Nexus OGRE 3D Assets
# Validates texture formats, naming conventions, and file structures

set -e

echo "🔍 Starting asset validation for Nexus OGRE 3D Assets..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
ERRORS=0
WARNINGS=0
PASSED=0

# Function to print colored output
print_error() {
    echo -e "${RED}❌ ERROR: $1${NC}"
    ((ERRORS++))
}

print_warning() {
    echo -e "${YELLOW}⚠️  WARNING: $1${NC}"
    ((WARNINGS++))
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
    ((PASSED++))
}

# Validate directory structure
echo -e "\n📁 Validating directory structure..."

required_dirs=(
    "materials/programs/GLSL"
    "materials/programs/HLSL" 
    "materials/programs/CG"
    "materials/scripts"
    "materials/textures"
    "models/meshes"
    "models/skeletons"
    "models/animations"
    "textures/diffuse"
    "textures/normal"
    "textures/specular"
    "textures/height"
    "textures/ambient_occlusion"
    "sounds/effects"
    "sounds/music"
    "sounds/ambient"
    "scripts/gameplay"
    "scripts/ai"
    "scripts/ui"
    "scenes/levels"
    "scenes/environments"
    "config/ogre"
    "config/resources"
)

for dir in "${required_dirs[@]}"; do
    if [ -d "$dir" ]; then
        print_success "Directory exists: $dir"
    else
        print_error "Missing required directory: $dir"
    fi
done

# Validate texture files
echo -e "\n🖼️  Validating texture files..."

find textures/ -name "*.png" -o -name "*.jpg" -o -name "*.dds" | while read -r texture; do
    filename=$(basename "$texture")
    
    # Check naming convention
    if [[ ! "$filename" =~ ^[a-z0-9_]+_(diffuse|normal|specular|height|ao|roughness|metallic)(_[a-z0-9_]+)?\.(png|jpg|dds)$ ]]; then
        print_warning "Texture naming convention issue: $filename"
    fi
    
    # Check if file exists and is readable
    if [ -r "$texture" ]; then
        print_success "Texture validated: $filename"
    else
        print_error "Cannot read texture file: $texture"
    fi
done

# Validate material scripts
echo -e "\n🎨 Validating material scripts..."

find materials/scripts/ -name "*.material" | while read -r material; do
    filename=$(basename "$material")
    
    # Basic syntax check (look for material keyword)
    if grep -q "^material\s" "$material"; then
        print_success "Material script validated: $filename"
    else
        print_error "Invalid material script format: $filename"
    fi
done

# Validate shader programs
echo -e "\n🔮 Validating shader programs..."

find materials/programs/ -name "*.vert" -o -name "*.frag" -o -name "*.glsl" -o -name "*.hlsl" -o -name "*.cg" | while read -r shader; do
    filename=$(basename "$shader")
    
    if [ -r "$shader" ] && [ -s "$shader" ]; then
        print_success "Shader program validated: $filename"
    else
        print_error "Shader program issue: $filename"
    fi
done

# Validate configuration files
echo -e "\n⚙️  Validating configuration files..."

config_files=(
    "config/resources/resources.cfg"
    "config/ogre/plugins.cfg"
    ".gitignore"
    "LICENSE"
    "README.md"
    "CONTRIBUTING.md"
)

for config in "${config_files[@]}"; do
    if [ -f "$config" ]; then
        print_success "Configuration file exists: $config"
    else
        print_error "Missing configuration file: $config"
    fi
done

# Validate documentation
echo -e "\n📚 Validating documentation..."

doc_files=(
    "docs/ASSETS.md"
    "docs/CONTRIBUTORS.md"
    "materials/README.md"
    "models/README.md"
    "textures/README.md"
)

for doc in "${doc_files[@]}"; do
    if [ -f "$doc" ]; then
        print_success "Documentation exists: $doc"
    else
        print_warning "Missing documentation: $doc"
    fi
done

# Summary
echo -e "\n📊 Validation Summary"
echo "===================="
echo -e "✅ Passed: ${GREEN}$PASSED${NC}"
echo -e "⚠️  Warnings: ${YELLOW}$WARNINGS${NC}"
echo -e "❌ Errors: ${RED}$ERRORS${NC}"

if [ $ERRORS -eq 0 ]; then
    echo -e "\n${GREEN}🎉 Asset validation completed successfully!${NC}"
    exit 0
else
    echo -e "\n${RED}💥 Asset validation failed with $ERRORS errors.${NC}"
    exit 1
fi