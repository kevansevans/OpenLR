﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <h3d/shader/ColorMatrix.h>
#include <hxsl/Globals.h>
void hxsl_Shader_updateConstantsFinal(hxsl__Shader,hxsl__Globals);
#include <hl/types/ArrayBytes_Float.h>
extern hl_type t$h3d_Matrix;
void h3d_Matrix_new(h3d__Matrix);
void hxsl_Shader_new(hxsl__Shader);
void h3d_Matrix_loadValues(h3d__Matrix,hl__types__ArrayBytes_Float);
void h3d_Matrix_identity(h3d__Matrix);

void h3d_shader_ColorMatrix_updateConstants(h3d__shader__ColorMatrix r0,hxsl__Globals r1) {
	int r2;
	r2 = 0;
	r0->constBits = r2;
	hxsl_Shader_updateConstantsFinal(((hxsl__Shader)r0),r1);
	return;
}

vdynamic* h3d_shader_ColorMatrix_getParamValue(h3d__shader__ColorMatrix r0,int r1) {
	vdynamic *r4;
	h3d__Matrix r3;
	int r2;
	r2 = 0;
	if( r1 != r2 ) goto label$6c082bf_2_4;
	r3 = r0->matrix__;
	return ((vdynamic*)r3);
	label$6c082bf_2_4:
	r4 = NULL;
	return r4;
}

double h3d_shader_ColorMatrix_getParamFloatValue(h3d__shader__ColorMatrix r0,int r1) {
	double r2;
	r2 = 0.;
	return r2;
}

void h3d_shader_ColorMatrix_new(h3d__shader__ColorMatrix r0,hl__types__ArrayBytes_Float r1) {
	h3d__Matrix r2;
	r2 = (h3d__Matrix)hl_alloc_obj(&t$h3d_Matrix);
	h3d_Matrix_new(r2);
	r0->matrix__ = r2;
	hxsl_Shader_new(((hxsl__Shader)r0));
	if( !r1 ) goto label$6c082bf_4_9;
	r2 = r0->matrix__;
	if( r2 == NULL ) hl_null_access();
	h3d_Matrix_loadValues(r2,r1);
	goto label$6c082bf_4_12;
	label$6c082bf_4_9:
	r2 = r0->matrix__;
	if( r2 == NULL ) hl_null_access();
	h3d_Matrix_identity(r2);
	label$6c082bf_4_12:
	return;
}

