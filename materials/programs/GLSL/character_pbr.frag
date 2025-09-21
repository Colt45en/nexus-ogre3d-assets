// Example GLSL fragment shader for character rendering
// Implements basic PBR lighting with normal mapping

#version 330 core

// Input from vertex shader
in vec2 uv;
in vec3 worldPosition;
in vec3 worldNormal;
in vec3 worldTangent;
in vec3 lightDirection;
in vec3 viewDirection;

// Texture samplers
uniform sampler2D diffuseMap;
uniform sampler2D normalMap;
uniform sampler2D specularMap;
uniform sampler2D roughnessMap;

// Material parameters
uniform vec3 albedoColor;
uniform float metallicFactor;
uniform float roughnessFactor;

// Light parameters
uniform vec3 lightColor;
uniform float lightIntensity;

// Output color
out vec4 fragColor;

// PBR calculation functions
vec3 calculateNormal()
{
    vec3 normal = normalize(worldNormal);
    vec3 tangent = normalize(worldTangent);
    vec3 bitangent = cross(normal, tangent);
    mat3 tbn = mat3(tangent, bitangent, normal);
    
    vec3 normalSample = texture(normalMap, uv).rgb * 2.0 - 1.0;
    return normalize(tbn * normalSample);
}

float distributionGGX(vec3 N, vec3 H, float roughness)
{
    float a = roughness * roughness;
    float a2 = a * a;
    float NdotH = max(dot(N, H), 0.0);
    float NdotH2 = NdotH * NdotH;
    
    float num = a2;
    float denom = (NdotH2 * (a2 - 1.0) + 1.0);
    denom = 3.14159265 * denom * denom;
    
    return num / denom;
}

float geometrySchlickGGX(float NdotV, float roughness)
{
    float r = (roughness + 1.0);
    float k = (r * r) / 8.0;
    
    float num = NdotV;
    float denom = NdotV * (1.0 - k) + k;
    
    return num / denom;
}

vec3 fresnelSchlick(float cosTheta, vec3 F0)
{
    return F0 + (1.0 - F0) * pow(1.0 - cosTheta, 5.0);
}

void main()
{
    // Sample textures
    vec3 albedo = texture(diffuseMap, uv).rgb * albedoColor;
    float metallic = texture(specularMap, uv).r * metallicFactor;
    float roughness = texture(roughnessMap, uv).r * roughnessFactor;
    
    // Calculate surface normal
    vec3 N = calculateNormal();
    vec3 V = normalize(viewDirection);
    vec3 L = normalize(lightDirection);
    vec3 H = normalize(V + L);
    
    // Calculate F0 for dielectrics and metals
    vec3 F0 = vec3(0.04);
    F0 = mix(F0, albedo, metallic);
    
    // Cook-Torrance BRDF
    float NDF = distributionGGX(N, H, roughness);
    float G = geometrySchlickGGX(max(dot(N, V), 0.0), roughness) * 
              geometrySchlickGGX(max(dot(N, L), 0.0), roughness);
    vec3 F = fresnelSchlick(max(dot(H, V), 0.0), F0);
    
    vec3 kS = F;
    vec3 kD = vec3(1.0) - kS;
    kD *= 1.0 - metallic;
    
    vec3 numerator = NDF * G * F;
    float denominator = 4.0 * max(dot(N, V), 0.0) * max(dot(N, L), 0.0);
    vec3 specular = numerator / max(denominator, 0.001);
    
    float NdotL = max(dot(N, L), 0.0);
    vec3 Lo = (kD * albedo / 3.14159265 + specular) * lightColor * lightIntensity * NdotL;
    
    // Simple ambient lighting
    vec3 ambient = vec3(0.03) * albedo;
    vec3 color = ambient + Lo;
    
    // HDR tonemapping and gamma correction
    color = color / (color + vec3(1.0));
    color = pow(color, vec3(1.0/2.2));
    
    fragColor = vec4(color, 1.0);
}