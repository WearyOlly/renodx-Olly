// ---- Created with 3Dmigoto v1.3.2 on Sun Jun 28 11:25:31 2026
#include "../shared.h"

Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb2 : register(b2)
{
  float4 cb2[2];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[1];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[11];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float4 v2 : COLOR2,
  float4 v3 : TEXCOORD0,
  float4 v4 : TEXCOORD1,
  float3 v5 : TEXCOORD2,
  float v6 : SV_ClipDistance0,
  out float4 o0 : SV_Target0,
  out float2 o1 : SV_Target1)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = v3.xy / v4.ww;
  r0.xy = cb2[0].xy + r0.xy;
  r0.xy = cb2[1].xy * cb1[0].yy + r0.xy;
  r0.xyzw = t0.SampleLevel(s0_s, r0.xy, 0).xyzw;
  r0.xyz = r0.xyz * v1.xyz + -v2.xyz;
  r0.w = v1.w * r0.w;
  r0.w = saturate(r0.w);
  o0.xyz = v2.www * r0.xyz + v2.xyz;
  r0.x = cb0[10].x * r0.w;
  r0.y = r0.w * cb0[10].x + -9.99999975e-005;
  r0.y = ceil(r0.y);
  o1.y = cb0[3].z * r0.y;
  o0.w = r0.x;
  o1.x = 0;
  
  if (RENODX_TONE_MAP_TYPE != 0.f) {
    o0.rgb = float3(
        renodx::color::grade::Highlights(o0.r, RENODX_RENO_ULTRAKILL_ITM_STRENGTH),
        renodx::color::grade::Highlights(o0.g, RENODX_RENO_ULTRAKILL_ITM_STRENGTH),
        renodx::color::grade::Highlights(o0.b, RENODX_RENO_ULTRAKILL_ITM_STRENGTH)
    );
  };

  return;
}