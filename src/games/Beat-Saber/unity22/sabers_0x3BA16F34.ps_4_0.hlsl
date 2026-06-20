// ---- Created with 3Dmigoto v1.3.2 on Sat Jun 20 19:20:41 2026
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3)
{
  float4 cb3[2];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[1];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[1];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[6];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float w1 : TEXCOORD1,
  nointerpolation uint v2 : SV_InstanceID0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v1.xy * cb0[4].xy + cb0[4].zw;
  r0.zw = cb1[0].xx * cb0[5].xy;
  r0.xy = r0.zw * cb0[4].xy + r0.xy;
  r0.xyzw = t0.Sample(s0_s, r0.xy).xyzw;
  r0.y = r0.x * cb0[5].z + w1.x;
  r0.z = (int)v2.x + asint(cb2[0].x);
  r1.xyz = cb3[r0.z+0].xyz;
  r1.xyz = saturate(r0.xxx * cb0[5].zzz + r1.xyz);
  r1.w = saturate(0);
  r2.xyzw = cb3[r0.z + 0].xyzw + -r1.xyzw;
  o0.xyzw = lerp(r0.yyyy, r2.xyzw, 0.65) + r1.xyzw;
  return;
}
