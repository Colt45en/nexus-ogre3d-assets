# Material Scripts Directory

This directory contains OGRE material definition scripts.

## File Types:
- .material - OGRE material scripts
- .compositor - OGRE compositor scripts  
- .particle - OGRE particle system scripts
- .overlay - OGRE overlay scripts

## Usage:
Material scripts define how 3D objects should be rendered, including:
- Textures and texture coordinates
- Lighting parameters
- Transparency and blending modes
- Shader programs to use
- Rendering states

Example material script structure:
```
material MyMaterial
{
    technique
    {
        pass
        {
            texture_unit
            {
                texture myTexture.jpg
            }
        }
    }
}
```

Place your .material files here for batch upload.