# Textures

This directory contains texture assets organized by type and usage for the Nexus Orc Pack.

## 📁 Structure

```
textures/
├── diffuse/               # Base color textures
├── normal/                # Normal maps for surface detail
├── specular/              # Specular reflection maps
├── height/                # Height/displacement maps
└── ambient_occlusion/     # Ambient occlusion maps
```

## 🎨 Texture Categories

### Character Textures
- **Skin**: Orc skin variations with different tones and markings
- **Clothing**: Fabric textures for robes, tunics, and casual wear
- **Armor**: Metal and leather armor textures with wear patterns
- **Hair**: Various hair textures and styles

### Environment Textures
- **Terrain**: Ground materials like dirt, grass, rock, and sand
- **Architecture**: Building materials including stone, wood, and metal
- **Nature**: Tree bark, leaves, and organic surface materials

### Equipment Textures
- **Weapons**: Metal surfaces with varying degrees of wear and polish
- **Shields**: Painted and decorated shield surfaces
- **Accessories**: Jewelry, buckles, and decorative elements

## 📏 Technical Specifications

### Resolution Standards
| Usage Type | Minimum | Recommended | Maximum |
|------------|---------|-------------|---------|
| Character Detail | 512x512 | 1024x1024 | 2048x2048 |
| Environment | 512x512 | 1024x1024 | 4096x4096 |
| Props/Weapons | 256x256 | 512x512 | 1024x1024 |
| UI Elements | 128x128 | 256x256 | 512x512 |

### Format Requirements
- **Source Format**: PNG (uncompressed)
- **Runtime Format**: DDS with appropriate compression
- **Bit Depth**: 8-bit standard, 16-bit for HDR
- **Dimensions**: Power-of-2 (256, 512, 1024, 2048, 4096)

### Color Space Guidelines
- **Diffuse/Albedo**: sRGB color space
- **Normal Maps**: Linear color space
- **Specular/Roughness**: Linear color space
- **Height Maps**: Linear color space
- **AO Maps**: Linear color space

## 📝 Naming Conventions

```
assetname_maptype_variant.format
```

Examples:
- `orc_warrior_diffuse_01.png`
- `orc_warrior_normal_01.png`
- `stone_wall_diffuse_weathered.png`
- `iron_sword_specular.png`

### Map Type Suffixes
- `_diffuse` or `_albedo`: Base color
- `_normal`: Normal/bump mapping
- `_specular`: Specular reflection
- `_roughness`: Surface roughness (PBR)
- `_metallic`: Metallic mask (PBR)
- `_height`: Height/displacement
- `_ao`: Ambient occlusion
- `_emissive`: Self-illumination

## 🔧 Compression Guidelines

### DXT/BC Compression
- **DXT1/BC1**: Diffuse textures without alpha
- **DXT3/BC2**: Textures with sharp alpha transitions
- **DXT5/BC3**: Normal maps and textures with gradual alpha
- **BC6H**: HDR textures
- **BC7**: High-quality compression for important textures

### Quality Settings
- **High Quality**: BC7 or uncompressed for hero assets
- **Standard Quality**: DXT5/BC3 for most textures
- **Performance**: DXT1/BC1 for distant or less important textures

## 🎯 Optimization Guidelines

### Mipmaps
- Generate mipmaps for all textures
- Use box filtering for most textures
- Use Kaiser filtering for high-quality normal maps

### Texture Streaming
- Organize textures by LOD level
- Use texture arrays for similar materials
- Implement texture pooling for memory management

## 📋 Quality Standards

All textures must meet these criteria:
- ✅ Seamless tiling where appropriate
- ✅ Consistent lighting and color temperature
- ✅ Appropriate resolution for intended use
- ✅ Proper normal map format (DirectX convention)
- ✅ Clean UV mapping without stretching
- ✅ Optimized file size for runtime use

## 🔍 Validation Checklist

Before submitting textures:
- [ ] Power-of-2 dimensions
- [ ] Correct color space assignment
- [ ] Proper compression format
- [ ] Mipmap generation
- [ ] Consistent naming convention
- [ ] Visual quality verification
- [ ] Performance impact assessment