﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <h3d/shader/GenTexture.h>
#include <hxsl/Globals.h>
extern String s$mode;
extern String s$_is_out_of_range_;
String String___add__(String,String);
#include <hl/natives.h>
String String___alloc__(vbyte*,int);
extern String s$cedf8da;
vdynamic* haxe_Exception_thrown(vdynamic*);
void hxsl_Shader_updateConstantsFinal(hxsl__Shader,hxsl__Globals);
extern hl_type t$_f64;
extern hl_type t$_i32;
extern hl_type t$h3d_Vector;
void h3d_Vector_new(h3d__Vector,double*,double*,double*,double*);
void h3d_shader_ScreenShader_new(h3d__shader__ScreenShader);

void h3d_shader_GenTexture_updateConstants(h3d__shader__GenTexture r0,hxsl__Globals r1) {
	String r7, r8;
	int *r9;
	vdynamic *r6;
	vbyte *r10;
	int r2, r4, r5;
	r2 = 0;
	r0->constBits = r2;
	r2 = r0->mode__;
	r5 = 8;
	r4 = ((unsigned)r2) >> r5;
	r5 = 0;
	if( r4 == r5 ) goto label$1c0b98d_1_24;
	r7 = (String)s$mode;
	r8 = (String)s$_is_out_of_range_;
	r7 = String___add__(r7,r8);
	r4 = r2;
	r9 = &r4;
	r10 = hl_itos(r4,r9);
	r8 = String___alloc__(r10,r4);
	r7 = String___add__(r7,r8);
	r8 = (String)s$cedf8da;
	r7 = String___add__(r7,r8);
	r4 = 255;
	r9 = &r4;
	r10 = hl_itos(r4,r9);
	r8 = String___alloc__(r10,r4);
	r7 = String___add__(r7,r8);
	r6 = haxe_Exception_thrown(((vdynamic*)r7));
	hl_throw((vdynamic*)r6);
	label$1c0b98d_1_24:
	r4 = r0->constBits;
	r4 = r4 | r2;
	r0->constBits = r4;
	hxsl_Shader_updateConstantsFinal(((hxsl__Shader)r0),r1);
	return;
}

vdynamic* h3d_shader_GenTexture_getParamValue(h3d__shader__GenTexture r0,int r1) {
	h3d__Vector r5;
	double r3;
	vdynamic *r4;
	int r2;
	switch(r1) {
		default:
			goto label$1c0b98d_2_10;
		case 0:
			r3 = r0->flipY__;
			r4 = hl_alloc_dynamic(&t$_f64);
			r4->v.d = r3;
			return r4;
		case 1:
			r2 = r0->mode__;
			r4 = hl_alloc_dynamic(&t$_i32);
			r4->v.i = r2;
			return r4;
		case 2:
			r5 = r0->color__;
			return ((vdynamic*)r5);
	}
	label$1c0b98d_2_10:
	r4 = NULL;
	return r4;
}

double h3d_shader_GenTexture_getParamFloatValue(h3d__shader__GenTexture r0,int r1) {
	double r3;
	int r2;
	r2 = 0;
	if( r1 != r2 ) goto label$1c0b98d_3_4;
	r3 = r0->flipY__;
	return r3;
	label$1c0b98d_3_4:
	r3 = 0.;
	return r3;
}

void h3d_shader_GenTexture_new(h3d__shader__GenTexture r0) {
	h3d__Vector r1;
	double *r2, *r3, *r4, *r5;
	int r7;
	r1 = (h3d__Vector)hl_alloc_obj(&t$h3d_Vector);
	r2 = NULL;
	r3 = NULL;
	r4 = NULL;
	r5 = NULL;
	h3d_Vector_new(r1,r2,r3,r4,r5);
	r0->color__ = r1;
	r7 = 0;
	r0->mode__ = r7;
	h3d_shader_ScreenShader_new(((h3d__shader__ScreenShader)r0));
	return;
}

