﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <h3d/shader/VolumeDecal.h>
#include <hxsl/Globals.h>
void hxsl_Shader_updateConstantsFinal(hxsl__Shader,hxsl__Globals);
extern hl_type t$h3d_Vector;
void h3d_Vector_new(h3d__Vector,double*,double*,double*,double*);
void hxsl_Shader_new(hxsl__Shader);

void h3d_shader_VolumeDecal_updateConstants(h3d__shader__VolumeDecal r0,hxsl__Globals r1) {
	bool r4;
	int r2, r5;
	r2 = 0;
	r0->constBits = r2;
	r4 = r0->isCentered__;
	if( !r4 ) goto label$3297a7c_1_8;
	r2 = r0->constBits;
	r5 = 64;
	r2 = r2 | r5;
	r0->constBits = r2;
	label$3297a7c_1_8:
	hxsl_Shader_updateConstantsFinal(((hxsl__Shader)r0),r1);
	return;
}

vdynamic* h3d_shader_VolumeDecal_getParamValue(h3d__shader__VolumeDecal r0,int r1) {
	bool r4;
	h3d__Vector r2;
	vdynamic *r3;
	switch(r1) {
		default:
			goto label$3297a7c_2_11;
		case 0:
			r2 = r0->scale__;
			return ((vdynamic*)r2);
		case 1:
			r2 = r0->normal__;
			return ((vdynamic*)r2);
		case 2:
			r2 = r0->tangent__;
			return ((vdynamic*)r2);
		case 3:
			r4 = r0->isCentered__;
			r3 = hl_alloc_dynbool(r4);
			return r3;
	}
	label$3297a7c_2_11:
	r3 = NULL;
	return r3;
}

double h3d_shader_VolumeDecal_getParamFloatValue(h3d__shader__VolumeDecal r0,int r1) {
	double r2;
	r2 = 0.;
	return r2;
}

void h3d_shader_VolumeDecal_new(h3d__shader__VolumeDecal r0,double r1,double r2) {
	bool r3;
	h3d__Vector r4;
	double r10;
	double *r5, *r6, *r7, *r8;
	r3 = true;
	r0->isCentered__ = r3;
	r4 = (h3d__Vector)hl_alloc_obj(&t$h3d_Vector);
	r5 = NULL;
	r6 = NULL;
	r7 = NULL;
	r8 = NULL;
	h3d_Vector_new(r4,r5,r6,r7,r8);
	r0->tangent__ = r4;
	r4 = (h3d__Vector)hl_alloc_obj(&t$h3d_Vector);
	r5 = NULL;
	r6 = NULL;
	r7 = NULL;
	r8 = NULL;
	h3d_Vector_new(r4,r5,r6,r7,r8);
	r0->normal__ = r4;
	r4 = (h3d__Vector)hl_alloc_obj(&t$h3d_Vector);
	r5 = NULL;
	r6 = NULL;
	r7 = NULL;
	r8 = NULL;
	h3d_Vector_new(r4,r5,r6,r7,r8);
	r0->scale__ = r4;
	hxsl_Shader_new(((hxsl__Shader)r0));
	r4 = r0->normal__;
	if( r4 == NULL ) hl_null_access();
	r10 = 0.;
	r4->x = r10;
	r10 = 0.;
	r4->y = r10;
	r10 = 1.;
	r4->z = r10;
	r10 = 1.;
	r4->w = r10;
	r4 = r0->tangent__;
	if( r4 == NULL ) hl_null_access();
	r10 = 1.;
	r4->x = r10;
	r10 = 0.;
	r4->y = r10;
	r10 = 0.;
	r4->z = r10;
	r10 = 1.;
	r4->w = r10;
	r4 = r0->scale__;
	if( r4 == NULL ) hl_null_access();
	r10 = 1.;
	r10 = r10 / r1;
	r4->x = r10;
	r10 = 1.;
	r10 = r10 / r2;
	r4->y = r10;
	r10 = 0.;
	r4->z = r10;
	r10 = 1.;
	r4->w = r10;
	return;
}

