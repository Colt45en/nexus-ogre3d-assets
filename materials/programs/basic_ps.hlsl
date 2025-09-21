// HLSL Pixel Shader for basic diffuse lighting
// Example shader for OGRE 3D assets

struct PS_INPUT
{
    float4 position : SV_POSITION;
    float3 normal : NORMAL;
    float2 texcoord : TEXCOORD0;
    float3 worldPos : TEXCOORD1;
};

cbuffer PerFrame : register(b0)
{
    float4x4 worldViewProj;
    float4x4 world;
    float3 lightDirection;
    float4 lightColor;
};

Texture2D diffuseTexture : register(t0);
SamplerState textureSampler : register(s0);

float4 main(PS_INPUT input) : SV_TARGET
{
    float4 diffuse = diffuseTexture.Sample(textureSampler, input.texcoord);
    
    float3 normal = normalize(input.normal);
    float3 lightDir = normalize(-lightDirection);
    
    float ndotl = max(0.0, dot(normal, lightDir));
    
    float4 finalColor = diffuse * lightColor * ndotl;
    finalColor.a = diffuse.a;
    
    return finalColor;
}