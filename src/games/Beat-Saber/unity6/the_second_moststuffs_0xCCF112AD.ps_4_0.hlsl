// ---- Created with 3Dmigoto v1.3.2 on Fri Jun 26 22:55:25 2026
cbuffer cb3 : register(b3)
{
  float4 cb3[3];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[1];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[5];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[10];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  float3 v1 : TEXCOORD1,
  float w1 : TEXCOORD3,
  nointerpolation uint v2 : SV_InstanceID0,
  uint v3 : SV_IsFrontFace0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v1.y * cb0[9].y + cb0[9].x;
  r0.y = cb0[3].z + cb0[3].w;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(r0.x / cb0[3].w);
  r0.y = r0.x * r0.x;
  r0.x = -r0.x * 2 + 3;
  r0.x = r0.y * r0.x;
  r0.yzw = -cb1[4].xyz + v1.xyz;
  r0.y = dot(r0.yzw, r0.yzw);
  r0.y = -cb0[7].x + r0.y;
  r0.y = max(0, r0.y);
  r0.z = w1.x * w1.x;
  r0.z = w1.x * r0.z;
  r0.w = (int)v2.x + asint(cb2[0].x);
  r0.w = (uint)r0.w << 1;
  r0.z = cb3[r0.w+0].w * r0.z;
  r1.x = max(1, r0.z);
  r0.z = r0.z * r0.z;
  r1.x = 1 / r1.x;
  r1.x = cb0[7].y * r1.x;
  r0.y = r0.y * r1.x + -cb0[2].y;
  r0.y = max(0, r0.y);
  r0.y = r0.y * cb0[2].x + 1;
  r0.y = 1 / r0.y;
  r0.x = r0.x * -r0.y + 1;
  r0.x = 1 + -r0.x;
  r0.x = r0.z * r0.x;
  o0.xyz = cb3[r0.w+0].xyz * r0.xxx;
  o0.w = lerp(o0.xyz, r0.xyz, 0) * o0.xyz;
  return;
}
