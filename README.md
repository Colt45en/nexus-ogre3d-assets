# Nexus OGRE 3D Assets

A comprehensive collection of game assets optimized for OGRE 3D engine, featuring the Orc Pack and organized for game world development.

## 📁 Repository Structure

```
nexus-ogre3d-assets/
├── materials/           # OGRE material definitions and shaders
│   ├── programs/        # Shader programs
│   │   ├── GLSL/       # OpenGL Shading Language shaders
│   │   ├── HLSL/       # High Level Shading Language shaders
│   │   └── CG/         # Cg shading language programs
│   ├── scripts/        # Material script files (.material)
│   └── textures/       # Material-specific textures
├── models/             # 3D models and animations
│   ├── meshes/         # Static mesh files (.mesh)
│   ├── skeletons/      # Skeletal animation data (.skeleton)
│   └── animations/     # Animation definitions
├── textures/           # Texture assets organized by type
│   ├── diffuse/        # Base color textures
│   ├── normal/         # Normal maps for surface detail
│   ├── specular/       # Specular reflection maps
│   ├── height/         # Height/displacement maps
│   └── ambient_occlusion/ # Ambient occlusion maps
├── sounds/             # Audio assets
│   ├── effects/        # Sound effects
│   ├── music/          # Background music
│   └── ambient/        # Ambient environment sounds
├── scripts/            # Game logic and scripting
│   ├── gameplay/       # Core gameplay scripts
│   ├── ai/             # AI behavior scripts
│   └── ui/             # User interface scripts
├── scenes/             # Scene and level definitions
│   ├── levels/         # Game levels
│   └── environments/   # Environment presets
└── config/             # Configuration files
    ├── ogre/           # OGRE engine configuration
    └── resources/      # Resource group definitions
```

## 🎮 Game World Orc Pack

This repository contains a complete orc-themed asset pack designed for fantasy game worlds, including:

- **Character Models**: Orc warriors, shamans, and civilians
- **Equipment**: Weapons, armor, and accessories
- **Environment**: Orc settlements, camps, and structures
- **Materials**: Realistic shaders for skin, metal, leather, and fabric
- **Animations**: Combat, idle, and movement animations

## 🚀 Quick Start

### Prerequisites
- OGRE 3D Engine (version 1.12+ recommended)
- CMake 3.15+
- A compatible graphics API (OpenGL, DirectX, or Vulkan)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Colt45en/nexus-ogre3d-assets.git
cd nexus-ogre3d-assets
```

2. Copy the assets to your OGRE project:
```bash
# Copy materials
cp -r materials/ /path/to/your/ogre/project/media/materials/
# Copy models
cp -r models/ /path/to/your/ogre/project/media/models/
# Copy textures
cp -r textures/ /path/to/your/ogre/project/media/textures/
```

3. Update your OGRE resources.cfg to include the new asset paths.

## 📖 Usage Guide

### Loading Materials
```cpp
// In your OGRE application
Ogre::ResourceGroupManager::getSingleton().addResourceLocation(
    "media/materials/scripts", "FileSystem", "General");
Ogre::MaterialManager::getSingleton().load("OrcWarrior", "General");
```

### Loading Models
```cpp
// Load an orc warrior mesh
Ogre::Entity* orcEntity = sceneManager->createEntity("OrcWarrior", "orc_warrior.mesh");
Ogre::SceneNode* orcNode = sceneManager->getRootSceneNode()->createChildSceneNode();
orcNode->attachObject(orcEntity);
```

### Using Animations
```cpp
// Access animation state
Ogre::AnimationState* walkAnim = orcEntity->getAnimationState("Walk");
walkAnim->setEnabled(true);
walkAnim->setLoop(true);
```

## 🛠️ Asset Creation Guidelines

### Texture Requirements
- **Format**: PNG or DDS preferred
- **Size**: Power of 2 dimensions (256x256, 512x512, 1024x1024)
- **Diffuse**: sRGB color space
- **Normal Maps**: Linear color space, DirectX format
- **Compression**: Use DXT1/BC1 for diffuse, DXT5/BC3 for normal maps

### Model Requirements
- **Format**: .mesh files (OGRE native format)
- **Poly Count**: 
  - Characters: 2000-8000 triangles
  - Props: 100-2000 triangles
  - Environment: Optimized for target platform
- **UV Mapping**: Non-overlapping UVs, 0-1 range
- **Normals**: Smooth normals for organic surfaces

### Material Standards
- Use physically-based rendering (PBR) workflow
- Follow OGRE's material script syntax
- Include LOD definitions for performance optimization
- Document shader parameters and expected textures

## 📝 Asset Manifest

See [ASSETS.md](docs/ASSETS.md) for a complete inventory of all included assets.

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Asset submission requirements
- Quality standards
- Attribution requirements
- Testing procedures

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Credits

- Original concept and base assets: Nexus Game Development Team
- Additional contributions: See [CONTRIBUTORS.md](docs/CONTRIBUTORS.md)
- OGRE 3D Engine: [https://www.ogre3d.org/](https://www.ogre3d.org/)

## 📞 Support

- **Issues**: Report bugs and feature requests via GitHub Issues
- **Documentation**: Check the [docs/](docs/) folder for detailed guides
- **Community**: Join the OGRE 3D community forums for discussion

---

**Happy Game Development! 🎮**
