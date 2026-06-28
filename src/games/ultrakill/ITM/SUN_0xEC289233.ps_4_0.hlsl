// ---- Created with 3Dmigoto v1.3.2 on Sun Jun 28 11:17:42 2026
#include "../shared.h"

TextureCube<float4> t1 : register(t1);

TextureCube<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1)
{
  float4 cb1[1];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[3];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD2,
  float4 v2 : TEXCOORD3,
  float3 v3 : TEXCOORD4,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = dot(v1.xyz, v1.xyz);
  r0.x = rsqrt(r0.x);
  r0.xyz = v1.xyz * r0.xxx;
  r1.z = -r0.z;
  r0.w = cb1[0].y * cb0[2].x;
  sincos(r0.w, r2.x, r3.x);
  r4.x = -r2.x;
  r4.y = r3.x;
  r4.z = r2.x;
  r1.y = dot(r4.zy, -r0.xy);
  r1.x = dot(r4.yx, -r0.xy);
  r0.z = -r0.z;
  r2.xyzw = t0.SampleLevel(s1_s, r1.xyz, 0).xyzw;
  r1.zw = r2.xy * float2(2,2) + float2(-1,-1);
  r0.w = dot(r1.zw, r1.zw);
  r0.w = rsqrt(r0.w);
  r1.zw = r1.zw * r0.ww;
  r1.zw = float2(0.0250000004,0.0250000004) * r1.zw;
  r2.xy = float2(0.628310025,-0.628310025) * cb1[0].yy;
  sincos(r2.x, r2.x, r3.x);
  r4.x = sin(r2.y);
  r4.z = r2.x;
  r4.y = r3.x;
  r2.x = dot(r1.zw, r4.yz);
  r2.y = dot(r1.zw, r4.xy);
  r1.zw = r2.xy * r1.xy;
  r0.xy = r1.zw * float2(2,2) + r1.xy;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.xyzw = t1.SampleLevel(s0_s, r0.xyz, 0).xyzw;
  o0.xyz = r0.xyz;
  o0.w = 1;
  if (RENODX_TONE_MAP_TYPE != 0.f) {
    o0.rgb = float3(
        renodx::color::grade::Highlights(o0.r, RENODX_RENO_ULTRAKILL_ITM_STRENGTH),
        renodx::color::grade::Highlights(o0.g, RENODX_RENO_ULTRAKILL_ITM_STRENGTH),
        renodx::color::grade::Highlights(o0.b, RENODX_RENO_ULTRAKILL_ITM_STRENGTH)
    );
  };

  return;
}