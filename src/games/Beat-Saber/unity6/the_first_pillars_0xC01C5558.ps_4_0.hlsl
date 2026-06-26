// ---- Created with 3Dmigoto v1.3.2 on Fri Jun 26 22:40:54 2026
Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

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
  float4 cb0[10];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD1,
  float4 v2 : TEXCOORD2,
  float4 v3 : TEXCOORD4,
  nointerpolation uint v4 : SV_InstanceID0,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = v2.y * cb0[9].x + cb0[9].y;
  r0.y = cb0[3].z + cb0[3].w;
  r0.x = r0.x + -r0.y;
  r0.x = saturate(r0.x / cb0[3].w);
  r0.y = r0.x * r0.x;
  r0.x = -r0.x * 2 + 3;
  r0.x = r0.y * r0.x;
  r0.yzw = -cb1[4].xyz + v2.xyz;
  r0.y = dot(r0.yzw, r0.yzw);
  r0.y = -cb0[7].x + r0.y;
  r0.y = max(0, r0.y);
  r0.z = (int)v4.x + asint(cb2[0].x);
  r0.w = max(cb3[r0.z+0].w, 1);
  r0.w = 1 / r0.w;
  r0.w = cb0[7].y * r0.w;
  r0.w = r0.y * r0.w + -cb0[2].y;
  r0.w = max(0, r0.w);
  r0.w = r0.w * cb0[2].x + 1;
  r0.w = 1 / r0.w;
  r0.w = r0.x * -r0.w + 1;
  r0.w = 1 + -r0.w;
  r1.x = cb3[r0.z+0].w * cb3[r0.z+0].w;
  r0.w = r1.x * r0.w;
  r1.x = max(1, r0.w);
  r1.x = 1 / r1.x;
  r1.x = cb0[7].y * r1.x;
  r0.y = r0.y * r1.x + -cb0[2].y;
  r0.y = max(0, r0.y);
  r0.y = r0.y * cb0[2].x + 1;
  r0.y = 1 / r0.y;
  r0.x = r0.x * -r0.y + 1;
  r1.xy = v3.xy / v3.ww;
  r1.xyzw = t0.Sample(s1_s, r1.xy).xyzw;
  r0.y = -0.5 + r1.x;
  r0.y = 0.00392156886 * r0.y;
  r1.xyz = cb3[r0.z+0].xyz * r0.www + r0.yyy;
  o0.w = lerp(r0.w, r0.xyz, 1) * r0.w;
  r0.yz = v1.xy / v1.ww;
  r2.xyzw = t1.Sample(s0_s, r0.yz).xyzw;
  r0.yzw = r2.xyz + -r1.xyz;
  r1.xyz = r1.xyz + r1.xyz;
  o0.xyz = r0.xxx * r0.yzw + r1.xyz;
  return;
}
