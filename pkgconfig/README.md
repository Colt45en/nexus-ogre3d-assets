# Package Configuration Directory

This directory contains pkg-config files for library integration.

## Contents:
- .pc files for OGRE 3D integration
- Dependency configuration files
- Build system integration helpers

## Usage:
Package configuration files help build systems find and link libraries:

```bash
pkg-config --cflags ogre3d-assets
pkg-config --libs ogre3d-assets
```

## Structure:
```
pkgconfig/
├── ogre3d-assets.pc    - Main package config
├── ogre-materials.pc   - Materials package
└── ogre-models.pc      - Models package
```

These files enable easy integration with CMake, autotools, and other build systems.