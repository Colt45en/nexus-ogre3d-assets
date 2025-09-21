# Models

This directory contains 3D models, skeletons, and animations for the Nexus Orc Pack.

## 📁 Structure

```
models/
├── meshes/            # Static mesh files (.mesh)
├── skeletons/         # Skeletal animation data (.skeleton)
└── animations/        # Animation definitions and clips
```

## 🎭 Model Categories

### Characters
- **Orc Warriors**: Heavily armored combat units
- **Orc Shamans**: Spellcasting characters with robes and staffs
- **Orc Civilians**: Non-combat NPCs for populated areas

### Equipment
- **Weapons**: Swords, axes, bows, and magical implements
- **Armor**: Helmets, chest pieces, gauntlets, and boots
- **Shields**: Various defensive equipment designs

### Environment
- **Structures**: Buildings, walls, and fortifications
- **Props**: Furniture, decorations, and interactive objects
- **Vehicles**: Carts, siege engines, and boats

## 📏 Technical Specifications

### Polygon Budgets
| Category | Low Poly | Medium Poly | High Poly |
|----------|----------|-------------|-----------|
| Characters | 1,500-3,000 | 3,000-6,000 | 6,000-12,000 |
| Weapons | 200-800 | 800-2,000 | 2,000-5,000 |
| Props | 100-1,000 | 1,000-3,000 | 3,000-8,000 |
| Buildings | 500-2,000 | 2,000-8,000 | 8,000-20,000 |

### Model Requirements
- **Format**: OGRE .mesh files
- **Coordinate System**: Right-handed, Y-up
- **Scale**: 1 unit = 1 meter
- **UV Mapping**: Non-overlapping, 0-1 range
- **Normals**: Smoothing groups properly defined

## 🎬 Animation Standards

### Character Animations
- **Idle**: Breathing/stance animation (looped)
- **Walk**: Standard walking cycle (looped)
- **Run**: Running cycle for combat/urgency (looped)
- **Attack**: Primary weapon attack (one-shot)
- **Death**: Death animation with ragdoll transition (one-shot)

### Animation Technical Requirements
- **Frame Rate**: 30 FPS
- **Duration**: 
  - Idle: 3-5 seconds
  - Walk/Run: 1-2 seconds
  - Attacks: 0.5-2 seconds
  - Death: 2-4 seconds
- **Root Motion**: Specified for locomotion animations

## 📝 Naming Conventions

### Meshes
```
category_name_variant.mesh
```
Examples:
- `character_orc_warrior.mesh`
- `weapon_sword_iron.mesh`
- `building_hut_small.mesh`

### Animations
```
character_action_variant.anim
```
Examples:
- `orc_warrior_walk.anim`
- `orc_shaman_cast_spell.anim`
- `orc_civilian_idle.anim`

## 🔧 Usage Example

```cpp
// Load character mesh
Ogre::Entity* orcEntity = sceneManager->createEntity("OrcWarrior", "character_orc_warrior.mesh");
Ogre::SceneNode* orcNode = sceneManager->getRootSceneNode()->createChildSceneNode();
orcNode->attachObject(orcEntity);

// Setup animation
Ogre::AnimationState* walkAnim = orcEntity->getAnimationState("orc_warrior_walk");
walkAnim->setEnabled(true);
walkAnim->setLoop(true);

// Update in render loop
walkAnim->addTime(deltaTime);
```

## 🎯 LOD Strategy

Models include multiple levels of detail:
- **LOD 0**: Full detail for close viewing
- **LOD 1**: Reduced detail for medium distance
- **LOD 2**: Low detail for far distance/crowds

## 🔍 Quality Assurance

All models are validated for:
- ✅ OGRE mesh format compliance
- ✅ Proper UV coordinates
- ✅ Correct normal vectors
- ✅ Animation functionality
- ✅ Performance targets
- ✅ Visual quality standards