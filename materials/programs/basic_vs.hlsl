// HLSL Vertex Shader for basic diffuse lighting
// Example shader for OGRE 3D assets

struct VS_INPUT
{
    float4 position : POSITION;
    float3 normal : NORMAL;
    float2 texcoord : TEXCOORD0;
};

struct VS_OUTPUT
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

VS_OUTPUT main(VS_INPUT input)
{
    VS_OUTPUT output;
    
    output.position = mul(input.position, worldViewProj);
    output.normal = normalize(mul(input.normal, (float3x3)world));
    output.texcoord = input.texcoord;
    output.worldPos = mul(input.position, world).xyz;
    
    return output;
}