# Materials

This directory contains OGRE 3D material definitions and related assets for the Nexus Orc Pack.

## 📁 Structure

```
materials/
├── programs/           # Shader programs
│   ├── GLSL/          # OpenGL shaders
│   ├── HLSL/          # DirectX shaders
│   └── CG/            # Cg shaders
├── scripts/           # Material script files (.material)
└── textures/          # Material-specific textures
```

## 🎨 Material Categories

### Character Materials
- **Orc Skin**: Realistic skin shader with subsurface scattering approximation
- **Armor Materials**: Metal, leather, and cloth materials
- **Weapon Materials**: Steel, iron, and magical weapon effects

### Environment Materials
- **Terrain**: Grass, dirt, rock, and sand materials
- **Architecture**: Stone, wood, and metal building materials
- **Props**: Various object materials for interactive elements

## 📝 Naming Conventions

### Material Scripts
```
category_type_variant.material
```
Examples:
- `character_orc_warrior.material`
- `weapon_sword_steel.material`
- `environment_stone_rough.material`

### Shader Programs
```
category_type_shadingmodel
```
Examples:
- `character_skin_pbr.glsl`
- `environment_terrain_blended.hlsl`
- `weapon_metal_reflective.cg`

## 🔧 Usage Example

```cpp
// Load material resources
Ogre::ResourceGroupManager::getSingleton().addResourceLocation(
    "materials/scripts", "FileSystem", "OrcPack");
    
// Apply material to entity
Ogre::Entity* orc = sceneManager->createEntity("Orc", "orc_warrior.mesh");
orc->setMaterial(Ogre::MaterialManager::getSingleton().getByName("character_orc_warrior"));
```

## 📋 Material Requirements

All materials should include:
- Diffuse/Albedo texture
- Normal map for surface detail
- Specular/Roughness map for PBR workflow
- Optional: Height map, ambient occlusion

## 🎯 Performance Guidelines

- Use mipmaps for all textures
- Provide multiple LOD levels for complex materials
- Use compressed texture formats (DXT/BC) for runtime
- Keep shader instruction count reasonable for target hardware

## 🔍 Quality Standards

- All materials tested in various lighting conditions
- Consistent scale and brightness across asset pack
- Proper normal map format (DirectX or OpenGL)
- sRGB/Linear color space correctly specified