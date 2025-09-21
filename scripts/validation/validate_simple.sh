#!/bin/bash

# Simplified Asset Validation Script for Nexus OGRE 3D Assets
# Quick validation of repository structure and key files

echo "🔍 Validating Nexus OGRE 3D Assets Repository..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

ERRORS=0
WARNINGS=0
PASSED=0

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

# Check directory structure
echo -e "\n📁 Checking directory structure..."

required_dirs=(
    "materials/programs/GLSL"
    "materials/scripts"
    "models/meshes"
    "textures/diffuse"
    "sounds/effects"
    "scripts/validation"
    "config/ogre"
)

for dir in "${required_dirs[@]}"; do
    if [ -d "$dir" ]; then
        print_success "Directory exists: $dir"
    else
        print_error "Missing directory: $dir"
    fi
done

# Check essential files
echo -e "\n📄 Checking essential files..."

essential_files=(
    "README.md"
    "LICENSE"
    "CONTRIBUTING.md" 
    ".gitignore"
    "materials/scripts/orc_pack_materials.material"
    "scripts/validation/validate_assets.sh"
    "config/resources/resources.cfg"
)

for file in "${essential_files[@]}"; do
    if [ -f "$file" ]; then
        print_success "File exists: $file"
    else
        print_error "Missing file: $file"
    fi
done

# Summary
echo -e "\n📊 Validation Summary"
echo "===================="
echo -e "✅ Passed: ${GREEN}$PASSED${NC}"
echo -e "⚠️  Warnings: ${YELLOW}$WARNINGS${NC}"
echo -e "❌ Errors: ${RED}$ERRORS${NC}"

if [ $ERRORS -eq 0 ]; then
    echo -e "\n${GREEN}🎉 Repository validation completed successfully!${NC}"
    echo "The repository is properly structured and ready for OGRE 3D asset development."
    exit 0
else
    echo -e "\n${RED}💥 Repository validation failed with $ERRORS errors.${NC}"
    exit 1
fi