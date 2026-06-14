// ---- Created with 3Dmigoto v1.3.2 on Fri Jun 12 15:11:23 2026
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[6];
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
  float w1 : TEXCOORD5,
  float3 v2 : TEXCOORD2,
  nointerpolation uint v3 : SV_InstanceID0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v2.y * cb0[7].x + cb0[7].y;
  r0.y = cb0[5].z + cb0[5].w;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(r0.x / cb0[5].w);
  r0.y = r0.x * r0.x;
  r0.x = -r0.x * 2 + 3;
  r0.x = r0.y * r0.x;
  r0.yzw = -cb1[4].xyz + v2.xyz;
  r0.y = dot(r0.yzw, r0.yzw);
  r0.y = -cb0[6].x + r0.y;
  r0.y = max(0, r0.y);
  r0.z = w1.x * w1.x;
  r0.z = w1.x * r0.z;
  r0.w = (int)v3.x + asint(cb2[0].x);
  r0.w = (int)r0.w * 3;
  r0.z = cb3[r0.w+0].w * r0.z;
  r1.x = max(1, r0.z);
  r1.x = 1 / r1.x;
  r1.x = cb0[6].y * r1.x;
  r0.y = r0.y * r1.x + -cb0[4].y;
  r0.y = max(0, r0.y);
  r0.y = r0.y * cb0[4].x + 1;
  r0.y = 1 / r0.y;
  r0.x = r0.x * -r0.y + 1;
  r0.x = 1 + -r0.x;
  r0.x = r0.z * r0.x;
  r0.x = r0.x * r0.x;
  r1.x = v1.x / v1.z;
  r1.y = v1.y;
  r1.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r0.y = r1.w * r1.w;
  r0.x = r0.x * r0.y;
  r0.y = r0.x * r0.x;
  r0.y = cb0[9].x * r0.y;
  r0.y = r0.y * r0.y;
  r0.y = r0.y * cb0[6].z + -cb0[6].w;
  o0.xyz = cb3[r0.w+0].xyz * r0.xxx + (cb3[r0.w+0].xyz * r0.yyy);
  o0.w = cb0[7].w * r0.x;
  return;
}
