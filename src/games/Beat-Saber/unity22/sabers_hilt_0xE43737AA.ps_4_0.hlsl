// ---- Created with 3Dmigoto v1.3.2 on Sat Jun 20 20:47:55 2026
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
  float4 cb1[5];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[8];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  nointerpolation uint v3 : SV_InstanceID0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = -cb1[4].xyz + v1.xyz;
  r0.x = dot(r0.xyz, r0.xyz);
  r0.x = -cb0[7].x + r0.x;
  r0.x = max(0, r0.x);
  r0.x = r0.x * cb0[7].y + -cb0[2].y;
  r0.x = max(0, r0.x);
  r0.x = r0.x * cb0[2].x + 1;
  r0.x = 1 / r0.x;
  r0.x = 1 + -r0.x;
  r0.yz = v2.xy / v2.ww;
  r1.xyzw = t0.Sample(s0_s, r0.yz).xyzw;
  r1.w = 0;
  r0.y = (int)v3.x + asint(cb2[0].x);
  r1.xyzw = -cb3[r0.y+0].xyzw + r1.xyzw;
  o0.xyzw = r0.xxxx * r1.xyzw + (cb3[r0.y+0].xyzw + 0.35);
  return;
}
