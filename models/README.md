# Models Directory

This directory contains 3D model assets in OGRE's .mesh format and related files.

## File Types
- **.mesh**: OGRE binary mesh files (main model format)
- **.skeleton**: Skeletal animation data
- **.material**: Material definitions for models
- **.scene**: OGRE scene files

## Tools for Creating .mesh Files
- **OgreXMLConverter**: Convert XML mesh format to binary .mesh
- **OgreMeshTool**: Optimize and process mesh files
- **Blender with OGRE Exporter**: Export from Blender to OGRE format
- **3ds Max/Maya with OGRE exporters**: Export from professional 3D tools

## Naming Convention
- Use descriptive names: `orc_warrior.mesh`, `stone_wall.mesh`
- Group related files: `character_base.mesh`, `character_base.skeleton`
- Version with suffixes: `building_v1.mesh`, `building_v2.mesh`

## Model Categories
- **Characters**: Animated character models with skeletons
- **Environment**: Static environment objects (buildings, props)
- **Weapons**: Weapon models for characters
- **Vehicles**: Vehicle models with potential animations
- **Terrain**: Terrain mesh objects

## Example Models
Place your .mesh files here along with their associated .skeleton and .material files.

## LOD (Level of Detail)
Consider creating multiple LOD versions for performance:
- `model_lod0.mesh` (highest detail)
- `model_lod1.mesh` (medium detail)
- `model_lod2.mesh` (lowest detail)