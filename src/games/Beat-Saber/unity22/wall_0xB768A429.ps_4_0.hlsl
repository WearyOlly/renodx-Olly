// ---- Created with 3Dmigoto v1.3.2 on Sat Jun 20 19:30:54 2026
Texture2D<float4> t1 : register(t1);

Texture3D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb4 : register(b4)
{
  float4 cb4[8];
}

cbuffer cb3 : register(b3)
{
  float4 cb3[12];
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
  float4 cb0[6];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  nointerpolation uint v3 : SV_InstanceID0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = (int)v3.x + asint(cb2[0].x);
  r0.y = (uint)r0.x << 3;
  r0.x = (uint)r0.x << 2;
  r0.yzw = -cb3[r0.y+3].xyz + v1.xyz;
  r0.yzw = cb4[r0.x+3].xyz + r0.yzw;
  r0.yzw = cb0[5].zzz * r0.yzw;
  r1.xyzw = t0.Sample(s1_s, r0.yzw).xyzw;
  r0.y = -cb4[r0.x+2].x * 1.10000002 + r1.w;
  r0.y = 0.100000001 + r0.y;
  r0.y = cmp(r0.y < 0);
  if (r0.y != 0) discard;
  r0.yzw = -cb1[4].xyz + v1.xyz;
  r0.y = dot(r0.yzw, r0.yzw);
  r0.y = -cb0[4].z + r0.y;
  r0.y = max(0, r0.y);
  r0.y = r0.y * cb0[4].w + -cb0[2].y;
  r0.y = max(0, r0.y);
  r0.y = r0.y * cb0[2].x + 1;
  r0.y = 1 / r0.y;
  r0.z = v1.y * cb0[5].x + cb0[5].y;
  r0.w = cb0[3].z + cb0[3].w;
  r0.z = r0.z + -r0.w;
  r0.z = saturate(r0.z / cb0[3].w);
  r0.w = r0.z * r0.z;
  r0.z = -r0.z * 2 + 3;
  r0.z = r0.w * r0.z;
  r0.y = r0.z * -r0.y + 1;
  r0.zw = v2.xy / v2.ww;
  r1.xyzw = t1.Sample(s0_s, r0.zw).xyzw;
  r1.w = 0;
  r1.xyzw = -cb4[r0.x+0].xyzw * float4(1,1,1,2) + r1.xyzw;
  r2.xyzw = cb4[r0.x+0].xyzw * float4(1,1,1,2);
  o0.xyzw = r0.yyyy * r1.xyzw + r2.xyzw + (r2.x * 0.075);
  return;
}
