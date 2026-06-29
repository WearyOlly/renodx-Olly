// ---- Created with 3Dmigoto v1.3.2 on Thu Jun 11 14:15:41 2026
#include "../shared.h"

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[7];
}




// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main(
  float4 v0 : SV_POSITION0,
  float2 v1 : TEXCOORD0,
  float2 w1 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2,r3,r4;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xy = float2(0.100000001,0.200000003) + v1.xy;
  r0.xy = r0.xy * cb0[2].xy + cb0[2].zz;
  r0.xyzw = t2.Sample(s0_s, r0.xy).xyzw;
  r0.x = -0.5 + r0.x;
  r0.x = 0.00392156886 * r0.x;
  r1.xyzw = t1.Sample(s2_s, w1.xy).xyzw;
  r0.xyz = r1.xyz * cb0[5].zzz + r0.xxx;
  r1.xy = cb0[5].xy * float2(-0.5,0.5) + v1.xy;
  r1.xyzw = t0.Sample(s1_s, r1.xy).xyzw;
  r2.xyzw = cb0[5].xyxy * float4(0,-0.5,0.5,0.5) + v1.xyxy;
  r3.xyzw = t0.Sample(s1_s, r2.zw).xyzw;
  r2.xyzw = t0.Sample(s1_s, r2.xy).xyzw;
  r4.xyzw = t0.Sample(s1_s, v1.xy).xyzw;
  r0.w = r4.w + r2.w;
  r0.w = r0.w + r3.w;
  r0.w = r0.w + r1.w;
  r0.w = 0.25 * r0.w;
  r0.w = r0.w * r0.w;
  r0.w = r0.w * cb0[2].w + -cb0[3].x;
  if (RENODX_TONE_MAP_TYPE != 0) {
    float3 splitcolor = RGBtoHCV(r4.xyz);
    float3 thehue = HUEtoRGB(splitcolor.x);
    float3 newhuesat = renodx::color::correct::ChrominanceOKLab(thehue, r4.xyz);
    r1.xyz = r4.xyz + (newhuesat * r0.www);
  } else {
    r1.xyz = saturate(r4.xyz + r0.www);
  }
  o0.w = r4.w;
  r0.xyz = r1.xyz + r0.xyz;
  o0.xyz = cb0[6].xxx * r0.xyz;
  if (RENODX_TONE_MAP_TYPE != 0) {
    o0.xyz = renodx::draw::ToneMapPass(o0.xyz);
    o0.xyz = renodx::draw::RenderIntermediatePass(o0.xyz);
  } else {
    o0.xyz = saturate(o0.rgb);
    o0.xyz = renodx::draw::RenderIntermediatePass(o0.xyz);
  }
  return;
}