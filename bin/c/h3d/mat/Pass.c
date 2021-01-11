﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <h3d/mat/Pass.h>
int hxsl_Globals_allocID(String);
#include <h2d/BlendMode.h>
extern venum* g$h3d_mat_Blend_One;
extern venum* g$h3d_mat_Blend_Zero;
venum* h3d_mat_Pass_set_blendSrc(h3d__mat__Pass,venum*);
venum* h3d_mat_Pass_set_blendAlphaSrc(h3d__mat__Pass,venum*);
venum* h3d_mat_Pass_set_blendDst(h3d__mat__Pass,venum*);
venum* h3d_mat_Pass_set_blendAlphaDst(h3d__mat__Pass,venum*);
extern venum* g$h3d_mat_Operation_Add;
venum* h3d_mat_Pass_set_blendOp(h3d__mat__Pass,venum*);
venum* h3d_mat_Pass_set_blendAlphaOp(h3d__mat__Pass,venum*);
extern venum* g$h3d_mat_Blend_SrcAlpha;
extern venum* g$h3d_mat_Blend_OneMinusSrcAlpha;
extern venum* g$h3d_mat_Blend_OneMinusDstColor;
extern venum* g$h3d_mat_Blend_DstColor;
extern venum* g$h3d_mat_Blend_OneMinusSrcColor;
extern venum* g$h3d_mat_Operation_ReverseSub;
extern venum* g$h3d_mat_Operation_Max;
extern venum* g$h3d_mat_Operation_Min;
bool h3d_mat_Pass_set_depthWrite(h3d__mat__Pass,bool);
venum* h3d_mat_Pass_set_depthTest(h3d__mat__Pass,venum*);
#include <hxsl/Shader.h>
hxsl__ShaderList hxsl_ShaderList_addSort(hxsl__Shader,hxsl__ShaderList);
extern hl_type t$hxsl_ShaderList;
void hxsl_ShaderList_new(hxsl__ShaderList,hxsl__Shader,hxsl__ShaderList);
extern hl_type t$vrt_9c30d10;
bool hl_BaseType_check(hl__BaseType,vdynamic*);
extern venum* g$h3d_mat_Face_Back;
venum* h3d_mat_Pass_set_culling(h3d__mat__Pass,venum*);
extern venum* g$h3d_mat_Compare_Less;

void h3d_mat_Pass_setPassName(h3d__mat__Pass r0,String r1) {
	int r2;
	r0->name = r1;
	r2 = hxsl_Globals_allocID(r1);
	r0->passId = r2;
	return;
}

void h3d_mat_Pass_setBlendMode(h3d__mat__Pass r0,venum* r1) {
	venum *r4, *r5, *r6, *r7;
	int r3;
	if( r1 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r1);
	switch(r3) {
		default:
			goto label$738dde6_2_147;
		case 0:
			r4 = (venum*)g$h3d_mat_Blend_One;
			r5 = (venum*)g$h3d_mat_Blend_Zero;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 1:
			r4 = (venum*)g$h3d_mat_Blend_SrcAlpha;
			r5 = (venum*)g$h3d_mat_Blend_OneMinusSrcAlpha;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 2:
			r4 = (venum*)g$h3d_mat_Blend_SrcAlpha;
			r5 = (venum*)g$h3d_mat_Blend_One;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 3:
			r4 = (venum*)g$h3d_mat_Blend_One;
			r5 = (venum*)g$h3d_mat_Blend_OneMinusSrcAlpha;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 4:
			r4 = (venum*)g$h3d_mat_Blend_OneMinusDstColor;
			r5 = (venum*)g$h3d_mat_Blend_One;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 5:
			r4 = (venum*)g$h3d_mat_Blend_DstColor;
			r5 = (venum*)g$h3d_mat_Blend_Zero;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 6:
			r4 = (venum*)g$h3d_mat_Blend_DstColor;
			r5 = (venum*)g$h3d_mat_Blend_OneMinusSrcAlpha;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 7:
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r5 = (venum*)g$h3d_mat_Blend_OneMinusSrcColor;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 8:
			r4 = (venum*)g$h3d_mat_Blend_One;
			r5 = (venum*)g$h3d_mat_Blend_OneMinusSrcColor;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Add;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 9:
			r4 = (venum*)g$h3d_mat_Blend_SrcAlpha;
			r5 = (venum*)g$h3d_mat_Blend_One;
			r6 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r6 = h3d_mat_Pass_set_blendDst(r0,r5);
			r6 = h3d_mat_Pass_set_blendAlphaDst(r0,r5);
			r7 = (venum*)g$h3d_mat_Operation_ReverseSub;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_ReverseSub;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			goto label$738dde6_2_147;
		case 10:
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendDst(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendAlphaDst(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendAlphaDst(r0,r4);
			r7 = (venum*)g$h3d_mat_Operation_Max;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Max;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
			goto label$738dde6_2_147;
		case 11:
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendSrc(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendDst(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendAlphaDst(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendAlphaSrc(r0,r4);
			r4 = (venum*)g$h3d_mat_Blend_Zero;
			r4 = h3d_mat_Pass_set_blendAlphaDst(r0,r4);
			r7 = (venum*)g$h3d_mat_Operation_Min;
			r7 = h3d_mat_Pass_set_blendAlphaOp(r0,r7);
			r7 = (venum*)g$h3d_mat_Operation_Min;
			r7 = h3d_mat_Pass_set_blendOp(r0,r7);
	}
	label$738dde6_2_147:
	return;
}

void h3d_mat_Pass_depth(h3d__mat__Pass r0,bool r1,venum* r2) {
	venum *r4;
	bool r3;
	r3 = h3d_mat_Pass_set_depthWrite(r0,r1);
	r4 = h3d_mat_Pass_set_depthTest(r0,r2);
	return;
}

hxsl__Shader h3d_mat_Pass_addShader(h3d__mat__Pass r0,hxsl__Shader r1) {
	hxsl__Shader r2;
	hxsl__ShaderList r3;
	if( r1 ) goto label$738dde6_4_3;
	r2 = NULL;
	return r2;
	label$738dde6_4_3:
	r3 = r0->shaders;
	r3 = hxsl_ShaderList_addSort(r1,r3);
	r0->shaders = r3;
	return r1;
}

hxsl__Shader h3d_mat_Pass_addShaderAtIndex(h3d__mat__Pass r0,hxsl__Shader r1,int r2) {
	hxsl__ShaderList r3, r5, r7, r8;
	int r6;
	r3 = NULL;
	r5 = r0->shaders;
	label$738dde6_5_2:
	r6 = 0;
	if( r6 >= r2 ) goto label$738dde6_5_13;
	r8 = r0->parentShaders;
	if( r5 == r8 ) goto label$738dde6_5_13;
	r3 = r5;
	if( r5 == NULL ) hl_null_access();
	r7 = r5->next;
	r5 = r7;
	--r2;
	goto label$738dde6_5_2;
	label$738dde6_5_13:
	if( r3 ) goto label$738dde6_5_18;
	r7 = (hxsl__ShaderList)hl_alloc_obj(&t$hxsl_ShaderList);
	hxsl_ShaderList_new(r7,r1,r5);
	r0->shaders = r7;
	goto label$738dde6_5_22;
	label$738dde6_5_18:
	if( r3 == NULL ) hl_null_access();
	r8 = (hxsl__ShaderList)hl_alloc_obj(&t$hxsl_ShaderList);
	hxsl_ShaderList_new(r8,r1,r5);
	r3->next = r8;
	label$738dde6_5_22:
	return r1;
}

int h3d_mat_Pass_getShaderIndex(h3d__mat__Pass r0,hxsl__Shader r1) {
	hxsl__Shader r6;
	hxsl__ShaderList r3, r4, r5;
	int r2, r7;
	r2 = 0;
	r3 = r0->shaders;
	label$738dde6_6_2:
	r5 = r0->parentShaders;
	if( r3 == r5 ) goto label$738dde6_6_13;
	if( r3 == NULL ) hl_null_access();
	r6 = r3->s;
	if( r6 != r1 ) goto label$738dde6_6_9;
	return r2;
	label$738dde6_6_9:
	r4 = r3->next;
	r3 = r4;
	++r2;
	goto label$738dde6_6_2;
	label$738dde6_6_13:
	r7 = -1;
	return r7;
}

bool h3d_mat_Pass_removeShader(h3d__mat__Pass r0,hxsl__Shader r1) {
	vvirtual *r3, *r6;
	bool r7;
	hxsl__Shader r5;
	hxsl__ShaderList r2, r4;
	r2 = r0->shaders;
	r3 = NULL;
	label$738dde6_7_2:
	if( !r2 ) goto label$738dde6_7_21;
	if( r2 == NULL ) hl_null_access();
	r5 = r2->s;
	if( r5 != r1 ) goto label$738dde6_7_16;
	if( r3 ) goto label$738dde6_7_11;
	r4 = r2->next;
	r0->shaders = r4;
	goto label$738dde6_7_14;
	label$738dde6_7_11:
	if( r3 == NULL ) hl_null_access();
	r4 = r2->next;
	if( hl_vfields(r3)[0] ) *(hxsl__ShaderList*)(hl_vfields(r3)[0]) = (hxsl__ShaderList)r4; else hl_dyn_setp(r3->value,151160317/*next*/,&t$hxsl_ShaderList,r4);
	label$738dde6_7_14:
	r7 = true;
	return r7;
	label$738dde6_7_16:
	r6 = hl_to_virtual(&t$vrt_9c30d10,(vdynamic*)r2);
	r3 = r6;
	r4 = r2->next;
	r2 = r4;
	goto label$738dde6_7_2;
	label$738dde6_7_21:
	r7 = false;
	return r7;
}

hxsl__Shader h3d_mat_Pass_getShader(h3d__mat__Pass r0,hl__Class r1) {
	bool r7;
	hxsl__Shader r5, r6;
	hxsl__ShaderList r2, r3, r4;
	r2 = r0->shaders;
	label$738dde6_8_1:
	r4 = r0->parentShaders;
	if( r2 == r4 ) goto label$738dde6_8_16;
	if( r2 == NULL ) hl_null_access();
	r5 = r2->s;
	r7 = hl_BaseType_check(((hl__BaseType)r1),((vdynamic*)r5));
	if( !r7 ) goto label$738dde6_8_10;
	r6 = r5;
	goto label$738dde6_8_11;
	label$738dde6_8_10:
	r6 = NULL;
	label$738dde6_8_11:
	if( !r6 ) goto label$738dde6_8_13;
	return r6;
	label$738dde6_8_13:
	r3 = r2->next;
	r2 = r3;
	goto label$738dde6_8_1;
	label$738dde6_8_16:
	r5 = NULL;
	return r5;
}

hxsl__ShaderList h3d_mat_Pass_getShadersRec(h3d__mat__Pass r0) {
	hxsl__ShaderList r2, r3, r4, r5;
	h3d__mat__Pass r1;
	r1 = r0->parentPass;
	if( !r1 ) goto label$738dde6_9_7;
	r2 = r0->parentShaders;
	r1 = r0->parentPass;
	if( r1 == NULL ) hl_null_access();
	r3 = r1->shaders;
	if( r2 != r3 ) goto label$738dde6_9_9;
	label$738dde6_9_7:
	r2 = r0->shaders;
	return r2;
	label$738dde6_9_9:
	r2 = r0->shaders;
	r3 = NULL;
	label$738dde6_9_11:
	if( !r2 ) goto label$738dde6_9_20;
	r5 = r0->parentShaders;
	if( r2 == r5 ) goto label$738dde6_9_20;
	r3 = r2;
	if( r2 == NULL ) hl_null_access();
	r4 = r2->next;
	r2 = r4;
	goto label$738dde6_9_11;
	label$738dde6_9_20:
	r1 = r0->parentPass;
	if( r1 == NULL ) hl_null_access();
	r4 = r1->shaders;
	r0->parentShaders = r4;
	if( r3 ) goto label$738dde6_9_28;
	r4 = r0->parentShaders;
	r0->shaders = r4;
	goto label$738dde6_9_31;
	label$738dde6_9_28:
	if( r3 == NULL ) hl_null_access();
	r5 = r0->parentShaders;
	r3->next = r5;
	label$738dde6_9_31:
	r4 = r0->shaders;
	return r4;
}

void h3d_mat_Pass_new(h3d__mat__Pass r0,String r1,hxsl__ShaderList r2,h3d__mat__Pass r3) {
	venum *r6, *r7, *r8, *r9, *r11, *r12;
	bool r10;
	int r4;
	r4 = 0;
	r0->layer = r4;
	r4 = 0;
	r0->bits = r4;
	r0->parentPass = r3;
	r0->shaders = r2;
	h3d_mat_Pass_setPassName(r0,r1);
	r6 = (venum*)g$h3d_mat_Face_Back;
	r6 = h3d_mat_Pass_set_culling(r0,r6);
	r7 = (venum*)g$h3d_mat_Blend_One;
	r8 = (venum*)g$h3d_mat_Blend_Zero;
	r9 = h3d_mat_Pass_set_blendSrc(r0,r7);
	r9 = h3d_mat_Pass_set_blendAlphaSrc(r0,r7);
	r9 = h3d_mat_Pass_set_blendDst(r0,r8);
	r9 = h3d_mat_Pass_set_blendAlphaDst(r0,r8);
	r10 = true;
	r11 = (venum*)g$h3d_mat_Compare_Less;
	h3d_mat_Pass_depth(r0,r10,r11);
	r12 = (venum*)g$h3d_mat_Operation_Add;
	r12 = h3d_mat_Pass_set_blendAlphaOp(r0,r12);
	r12 = h3d_mat_Pass_set_blendOp(r0,r12);
	r4 = 15;
	r0->colorMask = r4;
	return;
}

bool h3d_mat_Pass_set_enableLights(h3d__mat__Pass r0,bool r1) {
	int r2, r3;
	r2 = r0->flags;
	r3 = -2;
	r2 = r2 & r3;
	if( !r1 ) goto label$738dde6_11_6;
	r3 = 1;
	goto label$738dde6_11_7;
	label$738dde6_11_6:
	r3 = 0;
	label$738dde6_11_7:
	r2 = r2 | r3;
	r0->flags = r2;
	r0->enableLights = r1;
	return r1;
}

bool h3d_mat_Pass_set_dynamicParameters(h3d__mat__Pass r0,bool r1) {
	int r2, r3, r4;
	r2 = r0->flags;
	r3 = -3;
	r2 = r2 & r3;
	if( !r1 ) goto label$738dde6_12_6;
	r3 = 1;
	goto label$738dde6_12_7;
	label$738dde6_12_6:
	r3 = 0;
	label$738dde6_12_7:
	r4 = 1;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->flags = r2;
	r0->dynamicParameters = r1;
	return r1;
}

bool h3d_mat_Pass_set_isStatic(h3d__mat__Pass r0,bool r1) {
	int r2, r3, r4;
	r2 = r0->flags;
	r3 = -5;
	r2 = r2 & r3;
	if( !r1 ) goto label$738dde6_13_6;
	r3 = 1;
	goto label$738dde6_13_7;
	label$738dde6_13_6:
	r3 = 0;
	label$738dde6_13_7:
	r4 = 2;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->flags = r2;
	r0->isStatic = r1;
	return r1;
}

venum* h3d_mat_Pass_set_culling(h3d__mat__Pass r0,venum* r1) {
	int r2, r3;
	r2 = r0->bits;
	r3 = -4;
	r2 = r2 & r3;
	if( r1 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r1);
	r2 = r2 | r3;
	r0->bits = r2;
	r0->culling = r1;
	return r1;
}

bool h3d_mat_Pass_set_depthWrite(h3d__mat__Pass r0,bool r1) {
	int r2, r3, r4;
	r2 = r0->bits;
	r3 = -5;
	r2 = r2 & r3;
	if( !r1 ) goto label$738dde6_15_6;
	r3 = 1;
	goto label$738dde6_15_7;
	label$738dde6_15_6:
	r3 = 0;
	label$738dde6_15_7:
	r4 = 2;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->bits = r2;
	r0->depthWrite = r1;
	return r1;
}

venum* h3d_mat_Pass_set_depthTest(h3d__mat__Pass r0,venum* r1) {
	int r2, r3, r4;
	r2 = r0->bits;
	r3 = -57;
	r2 = r2 & r3;
	if( r1 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r1);
	r4 = 3;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->bits = r2;
	r0->depthTest = r1;
	return r1;
}

venum* h3d_mat_Pass_set_blendSrc(h3d__mat__Pass r0,venum* r1) {
	int r2, r3, r4;
	r2 = r0->bits;
	r3 = -961;
	r2 = r2 & r3;
	if( r1 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r1);
	r4 = 6;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->bits = r2;
	r0->blendSrc = r1;
	return r1;
}

venum* h3d_mat_Pass_set_blendDst(h3d__mat__Pass r0,venum* r1) {
	int r2, r3, r4;
	r2 = r0->bits;
	r3 = -15361;
	r2 = r2 & r3;
	if( r1 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r1);
	r4 = 10;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->bits = r2;
	r0->blendDst = r1;
	return r1;
}

venum* h3d_mat_Pass_set_blendAlphaSrc(h3d__mat__Pass r0,venum* r1) {
	int r2, r3, r4;
	r2 = r0->bits;
	r3 = -245761;
	r2 = r2 & r3;
	if( r1 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r1);
	r4 = 14;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->bits = r2;
	r0->blendAlphaSrc = r1;
	return r1;
}

venum* h3d_mat_Pass_set_blendAlphaDst(h3d__mat__Pass r0,venum* r1) {
	int r2, r3, r4;
	r2 = r0->bits;
	r3 = -3932161;
	r2 = r2 & r3;
	if( r1 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r1);
	r4 = 18;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->bits = r2;
	r0->blendAlphaDst = r1;
	return r1;
}

venum* h3d_mat_Pass_set_blendOp(h3d__mat__Pass r0,venum* r1) {
	int r2, r3, r4;
	r2 = r0->bits;
	r3 = -29360129;
	r2 = r2 & r3;
	if( r1 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r1);
	r4 = 22;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->bits = r2;
	r0->blendOp = r1;
	return r1;
}

venum* h3d_mat_Pass_set_blendAlphaOp(h3d__mat__Pass r0,venum* r1) {
	int r2, r3, r4;
	r2 = r0->bits;
	r3 = -234881025;
	r2 = r2 & r3;
	if( r1 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r1);
	r4 = 25;
	r3 = r3 << r4;
	r2 = r2 | r3;
	r0->bits = r2;
	r0->blendAlphaOp = r1;
	return r1;
}

