# 3D Models Directory

This directory contains 3D models and meshes for the OGRE 3D engine.

## Supported Formats:
- .mesh - OGRE native mesh format (binary)
- .mesh.xml - OGRE mesh format (XML)
- .skeleton - OGRE skeleton format for animations
- .skeleton.xml - OGRE skeleton format (XML)

## Model Types:
- **Static Meshes**: Non-animated 3D models
- **Animated Meshes**: Models with skeletal animation
- **Instanced Geometry**: Reusable mesh components
- **LOD Models**: Level-of-detail variations

## Conversion Tools:
Use OGRE mesh tools to convert from other formats:
- OgreXMLConverter - Convert between binary and XML mesh formats
- Blender OGRE Exporter - Export directly from Blender
- 3ds Max/Maya exporters - Export from professional tools

## Structure:
```
models/
├── characters/     - Character models
├── environments/   - Environment props  
├── weapons/        - Weapon models
├── vehicles/       - Vehicle meshes
└── ui/            - UI geometry
```

Place your .mesh and .skeleton files here for batch upload.