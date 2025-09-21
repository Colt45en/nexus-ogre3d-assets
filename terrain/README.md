# Terrain Assets Directory

This directory contains terrain-related assets and configurations.

## Contents:
- Terrain heightmaps (.raw, .png, .tga)
- Terrain texture splatting maps
- Terrain LOD configurations
- Custom terrain materials
- Terrain page definitions

## Terrain Configuration:
The main terrain configuration is in `terrain.cfg` at the project root.

## File Types:
- **Heightmaps**: Define terrain elevation data
- **Splat Maps**: Control texture blending across terrain
- **Detail Maps**: Add fine surface detail
- **Normal Maps**: Enhance terrain lighting
- **Color Maps**: Global terrain coloring

## Usage:
1. Place heightmap files (512x512, 1024x1024, etc.)
2. Add corresponding texture splat maps
3. Configure terrain.cfg for your specific needs
4. Reference terrain files in your OGRE scene files

Place your terrain assets here for batch upload.