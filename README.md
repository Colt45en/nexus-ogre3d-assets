# Nexus OGRE 3D Assets

A comprehensive game asset repository for OGRE 3D engine featuring a complete game world orc pack with materials, models, terrain, and physics integration.

## 📁 Directory Structure

```
nexus-ogre3d-assets/
├── materials/              # OGRE Material Assets
│   ├── programs/          # GPU Programs & Shaders (.hlsl, .glsl, .cg)
│   ├── scripts/           # Material Scripts (.material, .compositor)
│   └── textures/          # Texture Files (.jpg, .png, .dds, .tga)
├── models/                # 3D Models & Meshes (.mesh, .skeleton)
├── bullet/                # Bullet Physics Headers (.h, .hpp)
├── terrain/               # Terrain Assets (heightmaps, splat maps)
├── pkgconfig/             # Package Configuration Files (.pc)
├── terrain.cfg            # Terrain Configuration
├── .gitignore            # Git Ignore Rules
└── README.md             # This File
```

## 🎮 Asset Categories

### Materials
- **Programs**: Vertex, fragment, and compute shaders for advanced rendering
- **Scripts**: OGRE material definitions with lighting, texturing, and effects
- **Textures**: Diffuse, normal, specular, and environment maps

### Models
- Character models with skeletal animations
- Environment props and structures
- Weapons and equipment meshes
- LOD (Level of Detail) variants

### Physics
- Bullet Physics integration headers
- Collision shape definitions
- Rigid body configurations

### Terrain
- Heightmap data for landscape generation
- Texture splatting for terrain materials
- LOD configuration for performance optimization

## 🚀 Usage

### Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Colt45en/nexus-ogre3d-assets.git
   cd nexus-ogre3d-assets
   ```

2. **Integrate with your OGRE project:**
   ```cpp
   // Add resource locations in your OGRE application
   Ogre::ResourceGroupManager::getSingleton().addResourceLocation(
       "path/to/nexus-ogre3d-assets/materials/scripts", 
       "FileSystem", "General");
   Ogre::ResourceGroupManager::getSingleton().addResourceLocation(
       "path/to/nexus-ogre3d-assets/materials/textures", 
       "FileSystem", "General");
   ```

3. **Using pkg-config (Linux/macOS):**
   ```bash
   pkg-config --cflags nexus-ogre3d-assets
   pkg-config --variable=assetsdir nexus-ogre3d-assets
   ```

### Asset Integration

#### Loading Materials
```cpp
// Materials are automatically loaded when resource locations are added
Ogre::MaterialPtr material = Ogre::MaterialManager::getSingleton()
    .getByName("OrcWarrior/Armor");
```

#### Loading Models
```cpp
// Load mesh and create entity
Ogre::Entity* orc = sceneManager->createEntity("OrcEntity", "orc_warrior.mesh");
sceneNode->attachObject(orc);
```

#### Terrain Setup
```cpp
// Configure terrain using provided terrain.cfg
Ogre::TerrainGlobalOptions* terrainOptions = OGRE_NEW Ogre::TerrainGlobalOptions();
// Load configuration from terrain.cfg
```

## 📦 Batch Asset Upload

### Preparing Assets

1. **Organize your assets** according to the directory structure
2. **Validate file formats** using the guidelines in each directory's README
3. **Optimize textures** for your target platform (DDS recommended for production)
4. **Test materials** in OGRE before committing

### Upload Guidelines

#### For Shaders/Programs:
- Place `.hlsl`, `.glsl`, `.cg` files in `materials/programs/`
- Include both vertex and fragment shaders
- Follow OGRE naming conventions

#### For Material Scripts:
- Place `.material` files in `materials/scripts/`
- Reference textures by relative path
- Test material compilation

#### For Textures:
- Place texture files in `materials/textures/`
- Use power-of-2 dimensions when possible
- Consider DDS format for optimal performance
- Include normal maps with "_normal" suffix

#### For Models:
- Convert to OGRE `.mesh` format using OgreXMLConverter
- Include `.skeleton` files for animated models
- Test loading in OGRE before upload

## 🛠️ Development Tools

### Required Software
- **OGRE 3D SDK** (1.9.0 or higher)
- **Bullet Physics** (for physics integration)
- **OgreXMLConverter** (for mesh conversion)

### Recommended Tools
- **Blender** with OGRE exporter plugin
- **GIMP/Photoshop** for texture editing
- **DirectX Texture Tool** for DDS conversion
- **Bullet Debug Drawer** for physics visualization

## 🎨 Asset Standards

### Texture Guidelines
- **Resolution**: Power of 2 (256x256, 512x512, 1024x1024, 2048x2048)
- **Format**: DDS (production), PNG/TGA (development)
- **Compression**: BC1/BC3 for color, BC5 for normal maps
- **Naming**: descriptive_type.extension (e.g., `orc_skin_diffuse.dds`)

### Model Guidelines
- **Polygons**: Optimize for target platform (mobile: <5K, desktop: <50K)
- **UV Mapping**: Non-overlapping UVs, efficient packing
- **Animation**: 30fps skeleton animations, optimized bone count
- **LOD**: Provide multiple detail levels when appropriate

### Material Guidelines
- **Performance**: Use appropriate shader complexity for target hardware
- **Compatibility**: Test on minimum supported hardware
- **Documentation**: Comment complex shader techniques
- **Modularity**: Design reusable material components

## 📋 Asset Checklist

Before uploading assets, ensure:

- [ ] Files follow naming conventions
- [ ] Textures are properly compressed
- [ ] Models have valid UVs and materials
- [ ] Materials compile without errors
- [ ] Physics shapes are defined (if applicable)
- [ ] Documentation is updated
- [ ] Performance is acceptable on target hardware

## 🤝 Contributing

1. **Fork** the repository
2. **Create** a feature branch for your assets
3. **Test** all assets in OGRE before submitting
4. **Document** any special requirements or usage notes
5. **Submit** a pull request with detailed descriptions

## 📄 License

This asset pack is available under [specify license]. See LICENSE file for details.

## 🐛 Support

For issues, questions, or asset requests:
- Open an issue on GitHub
- Check existing documentation in subdirectories
- Review OGRE 3D documentation for integration help

## 🏷️ Version

**Current Version**: 1.0.0
**OGRE Compatibility**: 1.9.0+
**Last Updated**: [Auto-generated date]

---

*Ready for batch upload of shaders, scripts, models, and textures!*
