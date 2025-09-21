# Nexus OGRE 3D Assets

A comprehensive OGRE 3D asset library containing materials, shaders, scripts, textures, models, and Bullet physics integration for game development.

## Directory Structure

```
nexus-ogre3d-assets/
├── materials/                  # Material definitions and resources
│   ├── programs/              # Shader programs (Cg, GLSL, HLSL)
│   │   ├── basic.cg          # Cg shader example
│   │   ├── basic.vert        # GLSL vertex shader
│   │   ├── basic.frag        # GLSL fragment shader
│   │   ├── basic_vs.hlsl     # HLSL vertex shader
│   │   └── basic_ps.hlsl     # HLSL pixel shader
│   ├── scripts/              # Material script definitions
│   │   └── basic_materials.material  # Basic material examples
│   └── textures/             # Texture assets (PNG, JPG, DDS, etc.)
│       └── README.md         # Texture guidelines and conventions
├── models/                   # 3D models in .mesh format
│   └── README.md            # Model guidelines and tools
├── bullet/                  # Bullet physics integration headers
│   ├── BulletPhysicsWrapper.h    # Physics world wrapper
│   └── RigidBodyComponent.h      # Rigid body component
├── pkgconfig/              # Package configuration
│   └── nexus-ogre3d-assets.pc   # pkg-config file
├── terrain.cfg             # Terrain configuration
├── .gitignore             # Git ignore patterns
└── README.md              # This file
```

## Usage

### Material System

The materials directory contains everything needed for OGRE's material system:

- **Programs**: Shader source code in multiple languages (Cg, GLSL, HLSL)
- **Scripts**: Material definitions that reference shaders and textures
- **Textures**: Image assets used by materials

Example material usage:
```cpp
// Load materials
Ogre::MaterialManager::getSingleton().parseScript("basic_materials.material");

// Apply to entity
entity->setMaterialName("BasicDiffuseMaterial");
```

### Models

Place your .mesh files in the models directory along with associated .skeleton files for animated models.

```cpp
// Load a mesh
Ogre::Entity* entity = sceneManager->createEntity("MyEntity", "orc_warrior.mesh");
Ogre::SceneNode* node = sceneManager->getRootSceneNode()->createChildSceneNode();
node->attachObject(entity);
```

### Bullet Physics Integration

Use the provided headers to integrate Bullet physics with OGRE:

```cpp
#include "bullet/BulletPhysicsWrapper.h"
#include "bullet/RigidBodyComponent.h"

// Initialize physics world
NexusPhysics::PhysicsWorld physicsWorld;
physicsWorld.initialize();

// Add physics to an OGRE entity
NexusPhysics::RigidBodyComponent rigidBody(sceneNode);
rigidBody.createBoxShape(Ogre::Vector3(1, 1, 1), 1.0f);
```

### Terrain Configuration

The `terrain.cfg` file contains settings for terrain rendering:

```cpp
// Load terrain configuration
Ogre::ConfigFile cfg;
cfg.load("terrain.cfg");
```

## Dependencies

- OGRE 3D (>= 1.10.0)
- Bullet Physics (>= 2.80) - for physics integration
- OpenGL/DirectX - for shader support

## Building and Integration

### Using pkg-config

```bash
pkg-config --cflags --libs nexus-ogre3d-assets
```

### CMake Integration

```cmake
find_package(PkgConfig REQUIRED)
pkg_check_modules(NEXUS_ASSETS REQUIRED nexus-ogre3d-assets)

target_include_directories(your_target PRIVATE ${NEXUS_ASSETS_INCLUDE_DIRS})
target_link_libraries(your_target ${NEXUS_ASSETS_LIBRARIES})
```

## Shader Support

This asset pack includes shaders in multiple formats:

- **Cg**: Cross-platform shaders (basic.cg)
- **GLSL**: OpenGL shaders (.vert, .frag)
- **HLSL**: DirectX shaders (.hlsl)

Choose the appropriate shader format based on your target platform and rendering system.

## Contributing

When adding new assets:

1. Follow the established directory structure
2. Use descriptive naming conventions
3. Update relevant README files
4. Test materials with OGRE before committing
5. Ensure shaders compile on target platforms

## License

This asset library is designed for game development use. Please check individual asset licenses for specific usage rights.

## Getting Started

1. Clone this repository into your OGRE resources directory
2. Add the paths to your OGRE resources.cfg:
   ```
   [General]
   FileSystem=path/to/nexus-ogre3d-assets/materials/textures
   FileSystem=path/to/nexus-ogre3d-assets/models
   
   [Essential]
   FileSystem=path/to/nexus-ogre3d-assets/materials/scripts
   FileSystem=path/to/nexus-ogre3d-assets/materials/programs
   ```
3. Include the Bullet physics headers in your project
4. Start using the provided materials, models, and physics components

## Examples

See the example materials in `materials/scripts/basic_materials.material` for common use cases including:
- Basic diffuse materials with textures
- Terrain materials with detail textures
- Water materials with animation and transparency
