// GLSL Vertex Shader for basic diffuse lighting
// Example shader for OGRE 3D assets
#version 330 core

layout(location = 0) in vec3 position;
layout(location = 1) in vec3 normal;
layout(location = 2) in vec2 texCoord;

uniform mat4 worldViewProj;
uniform mat4 world;
uniform vec3 lightDirection;

out vec3 fragNormal;
out vec2 fragTexCoord;
out vec3 fragWorldPos;

void main()
{
    gl_Position = worldViewProj * vec4(position, 1.0);
    fragNormal = normalize(mat3(world) * normal);
    fragTexCoord = texCoord;
    fragWorldPos = (world * vec4(position, 1.0)).xyz;
}