// Example GLSL vertex shader for character rendering
// Supports basic lighting and normal mapping

#version 330 core

// Input vertex attributes
layout(location = 0) in vec3 position;
layout(location = 1) in vec3 normal;
layout(location = 2) in vec2 texCoord;
layout(location = 3) in vec3 tangent;

// Uniform matrices
uniform mat4 worldViewProjMatrix;
uniform mat4 worldMatrix;
uniform mat4 viewMatrix;
uniform mat3 normalMatrix;

// Light parameters
uniform vec3 lightPosition;
uniform vec3 lightColor;

// Output to fragment shader
out vec2 uv;
out vec3 worldPosition;
out vec3 worldNormal;
out vec3 worldTangent;
out vec3 lightDirection;
out vec3 viewDirection;

void main()
{
    // Transform position to clip space
    gl_Position = worldViewProjMatrix * vec4(position, 1.0);
    
    // Pass through texture coordinates
    uv = texCoord;
    
    // Transform to world space
    worldPosition = (worldMatrix * vec4(position, 1.0)).xyz;
    worldNormal = normalize(normalMatrix * normal);
    worldTangent = normalize(normalMatrix * tangent);
    
    // Calculate light direction
    lightDirection = normalize(lightPosition - worldPosition);
    
    // Calculate view direction
    vec3 viewPosition = (inverse(viewMatrix) * vec4(0.0, 0.0, 0.0, 1.0)).xyz;
    viewDirection = normalize(viewPosition - worldPosition);
}