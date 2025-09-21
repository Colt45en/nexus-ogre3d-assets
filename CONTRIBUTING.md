# Contributing to Nexus OGRE 3D Assets

Thank you for your interest in contributing to the Nexus OGRE 3D Assets project! This guide will help you understand how to contribute effectively.

## 🎯 Types of Contributions

We welcome several types of contributions:

### Asset Contributions
- **3D Models**: Characters, props, environments
- **Textures**: Diffuse, normal, specular, and other material maps
- **Materials**: OGRE material scripts and shaders
- **Animations**: Character animations and object animations
- **Audio**: Sound effects, music, and ambient audio

### Documentation
- Asset usage examples
- Tutorial content
- API documentation improvements
- Translation of documentation

### Code Contributions
- Asset processing tools
- Build scripts
- Validation utilities
- Performance optimizations

## 📋 Asset Submission Requirements

### Quality Standards

#### 3D Models
- **Format**: Submit source files (.blend, .max, .maya) and OGRE .mesh files
- **Topology**: Clean quad-dominant topology with proper edge flow
- **Scale**: Use consistent unit scale (1 unit = 1 meter)
- **Naming**: Use descriptive, lowercase names with underscores (`orc_warrior_axe.mesh`)
- **LOD**: Provide multiple detail levels when appropriate

#### Textures
- **Resolution**: Minimum 512x512, maximum 4096x4096
- **Format**: Provide both high-quality PNG and optimized DDS versions
- **Naming Convention**: 
  - `assetname_diffuse.png`
  - `assetname_normal.png`
  - `assetname_specular.png`
  - `assetname_height.png`
- **Color Space**: sRGB for albedo, Linear for normal/height/specular maps

#### Materials
- **Compatibility**: Must work with OGRE 3D 1.12+
- **Performance**: Include performance notes and recommended usage
- **Documentation**: Comment all parameters and expected textures
- **Standards**: Follow PBR workflow when possible

### File Organization

```
your_contribution/
├── README.md           # Description of your contribution
├── models/            # 3D model files
├── textures/          # Texture files
├── materials/         # Material scripts
├── animations/        # Animation files
└── examples/          # Usage examples
```

## 🔄 Submission Process

### 1. Prepare Your Contribution

1. **Fork** the repository
2. **Create** a new branch for your contribution:
   ```bash
   git checkout -b contribution/your-asset-name
   ```
3. **Organize** your files according to the repository structure
4. **Test** your assets in OGRE 3D to ensure they work correctly

### 2. Documentation Requirements

Each contribution must include:

- **Asset Manifest**: List of all included files
- **Usage Instructions**: How to use the assets in OGRE 3D
- **Technical Specifications**: Polygon counts, texture resolutions, etc.
- **Attribution**: Credit original authors and sources
- **License Information**: Ensure compatibility with MIT license

### 3. Create Pull Request

1. **Commit** your changes with descriptive messages
2. **Push** to your fork
3. **Open** a pull request with:
   - Clear title describing the contribution
   - Detailed description of what's included
   - Screenshots or renders of the assets
   - Performance impact notes

## ✅ Review Process

### Automated Checks
- File format validation
- Naming convention compliance
- Directory structure verification
- Basic OGRE compatibility tests

### Manual Review
- Visual quality assessment
- Performance evaluation
- Documentation completeness
- License compliance verification

### Review Timeline
- Initial review: 3-5 business days
- Revision requests: Communicated via PR comments
- Final approval: 1-2 business days after all requirements met

## 🏷️ Asset Attribution

### Required Attribution
All assets must include proper attribution:

```markdown
## Credits
- **Original Author**: Your Name
- **Creation Date**: YYYY-MM-DD
- **License**: MIT (or compatible)
- **Source**: Link to original work (if applicable)
```

### Acceptable Licenses
- MIT License
- Creative Commons (CC0, CC BY, CC BY-SA)
- Public Domain
- Original work with explicit permission

## 🧪 Testing Your Contributions

### Basic Tests
1. **Load Test**: Ensure assets load without errors in OGRE 3D
2. **Performance Test**: Verify reasonable frame rates on target hardware
3. **Visual Test**: Check that materials render correctly
4. **Animation Test**: Verify animations play smoothly

### Testing Environment
- OGRE 3D 1.12.x
- OpenGL 3.3+ / DirectX 11+ support
- Mid-range gaming hardware benchmark

## 🚫 What Not to Submit

- **Copyrighted Material**: Assets without proper licensing
- **Low Quality**: Untextured models, placeholder content
- **Inappropriate Content**: NSFW or offensive material
- **Duplicates**: Assets that already exist in the repository
- **Broken Files**: Corrupted or non-functional assets

## 💬 Getting Help

### Before Submitting
- Check existing issues and discussions
- Review similar contributions for examples
- Test thoroughly in your own OGRE 3D project

### Community Support
- **GitHub Discussions**: General questions and ideas
- **Issues**: Bug reports and feature requests
- **Email**: For sensitive licensing questions

### Response Times
- GitHub issues: 1-3 business days
- Pull request reviews: 3-5 business days
- Community discussions: Best effort

## 🎯 Contribution Goals

Our mission is to create a high-quality, comprehensive asset library for OGRE 3D developers. Every contribution should:

- **Enhance** the available asset variety
- **Maintain** high quality standards
- **Follow** established conventions
- **Benefit** the broader OGRE 3D community

Thank you for helping make OGRE 3D development more accessible and enjoyable!

---

*For questions about this contributing guide, please open an issue or start a discussion.*