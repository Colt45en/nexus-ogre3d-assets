// GLSL Fragment Shader for basic diffuse lighting
// Example shader for OGRE 3D assets
#version 330 core

in vec3 fragNormal;
in vec2 fragTexCoord;
in vec3 fragWorldPos;

uniform sampler2D diffuseTexture;
uniform vec3 lightDirection;
uniform vec4 lightColor;

out vec4 fragColor;

void main()
{
    vec4 diffuse = texture(diffuseTexture, fragTexCoord);
    
    vec3 normal = normalize(fragNormal);
    vec3 lightDir = normalize(-lightDirection);
    
    float ndotl = max(0.0, dot(normal, lightDir));
    
    fragColor = diffuse * lightColor * ndotl;
    fragColor.a = diffuse.a;
}