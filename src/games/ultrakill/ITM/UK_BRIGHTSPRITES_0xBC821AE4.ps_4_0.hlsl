#include "../shared.h"

// ---- Created with 3Dmigoto v1.3.16 on Thu Jan 29 13:21:06 2026
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_Target0)
{
  float4 r0;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t0.Sample(s0_s, v2.xy).xyzw;
  r0.xyzw = v1.xyzw * r0.xyzw;
  o0.xyz = r0.xyz * r0.www;
  o0.w = r0.w;

  if (RENODX_TONE_MAP_TYPE != 0.f) {
    o0.rgb = float3(
        renodx::color::grade::Highlights(o0.r, RENODX_RENO_ULTRAKILL_ITM_STRENGTH),
        renodx::color::grade::Highlights(o0.g, RENODX_RENO_ULTRAKILL_ITM_STRENGTH),
        renodx::color::grade::Highlights(o0.b, RENODX_RENO_ULTRAKILL_ITM_STRENGTH)
    );
  };

  return;
}