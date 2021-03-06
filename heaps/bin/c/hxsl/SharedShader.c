﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <hxsl/SharedShader.h>
#include <hxsl/Serializer.h>
extern hl_type t$haxe_ds_IntMap;
void haxe_ds_IntMap_new(haxe__ds__IntMap);
extern hl_type t$hxsl_ShaderGlobal;
#include <hl/natives.h>
hl__types__ArrayObj hl_types_ArrayObj_alloc(varray*);
extern String s$;
int String___compare(String,vdynamic*);
extern hl_type t$hxsl_Serializer;
void hxsl_Serializer_new(hxsl__Serializer);
vvirtual* hxsl_Serializer_unserialize(hxsl__Serializer,String);
void hxsl_SharedShader_initialize(hxsl__SharedShader);
#include <hxsl/VarKind.h>
#include <hxsl/Type.h>
extern hl_type t$hl_types_ArrayObj;
extern hl_type t$vrt_09f4a29;
void hxsl_SharedShader_browseVar(hxsl__SharedShader,vvirtual*,String);
#include <hxsl/Eval.h>
#include <hxsl/Const.h>
#include <hxsl/ShaderInstance.h>
extern hl_type t$hxsl_Eval;
void hxsl_Eval_new(hxsl__Eval);
extern hl_type t$hxsl_Type;
extern String s$assert;
vdynamic* haxe_Exception_thrown(vdynamic*);
extern hl_type t$hxsl_Const;
void hxsl_Eval_setConstant(hxsl__Eval,vvirtual*,venum*);
extern hxsl__$SharedShader g$_hxsl_SharedShader;
extern hl_type t$hxsl_ShaderInstance;
vvirtual* hxsl_Eval_eval(hxsl__Eval,vvirtual*);
void hxsl_ShaderInstance_new(hxsl__ShaderInstance,vvirtual*);
void hxsl_SharedShader_addParam(hxsl__SharedShader,hxsl__Eval,hxsl__ShaderInstance,vvirtual*);
void haxe_ds_IntMap_set(haxe__ds__IntMap,int,vdynamic*);
#include <haxe/ds/ObjectMap.h>
extern hl_type t$hxsl_VarKind;
extern venum* g$hxsl_VarKind_Param;
vdynamic* haxe_ds_ObjectMap_get(haxe__ds__ObjectMap,vdynamic*);
extern hl_type t$_i32;
#include <hxsl/ShaderGlobal.h>
int hxsl_Tools_allocVarId(void);
String hxsl_Tools_getName(vvirtual*);
extern String s$5058f1a;
extern hl_type t$String;
String String___add__(String,String);
extern venum* g$hxsl_VarKind_Global;
int hxsl_Globals_allocID(String);
void hxsl_ShaderGlobal_new(hxsl__ShaderGlobal,vvirtual*,int);
int hl_types_ArrayObj_push(hl__types__ArrayObj,vdynamic*);
bool hxsl_Tools_isConst(vvirtual*);
int hxsl_Tools_getConstBits(vvirtual*);
extern hl_type t$hxsl_ShaderConst;
void hxsl_ShaderConst_new(hxsl__ShaderConst,vvirtual*,int,int);

void hxsl_SharedShader_new(hxsl__SharedShader r0,String r1) {
	String r9;
	vvirtual *r10;
	hl__types__ArrayObj r5;
	hl_type *r7;
	haxe__ds__IntMap r2;
	hxsl__Serializer r11;
	hxsl__ShaderConst r4;
	int r8;
	varray *r6;
	r2 = (haxe__ds__IntMap)hl_alloc_obj(&t$haxe_ds_IntMap);
	haxe_ds_IntMap_new(r2);
	r0->instanceCache = r2;
	r4 = NULL;
	r0->consts = r4;
	r7 = &t$hxsl_ShaderGlobal;
	r8 = 0;
	r6 = hl_alloc_array(r7,r8);
	r5 = hl_types_ArrayObj_alloc(r6);
	r0->globals = r5;
	r9 = (String)s$;
	if( r1 != r9 && (!r1 || !r9 || String___compare(r1,(vdynamic*)r9) != 0) ) goto label$f922435_1_13;
	return;
	label$f922435_1_13:
	r11 = (hxsl__Serializer)hl_alloc_obj(&t$hxsl_Serializer);
	hxsl_Serializer_new(r11);
	r10 = hxsl_Serializer_unserialize(r11,r1);
	r0->data = r10;
	hxsl_SharedShader_initialize(r0);
	return;
}

void hxsl_SharedShader_initialize(hxsl__SharedShader r0) {
	String r9;
	vvirtual *r4, *r6;
	hl__types__ArrayObj r3;
	vdynamic *r7;
	varray *r8;
	int r1, r5;
	r1 = 0;
	r4 = r0->data;
	if( r4 == NULL ) hl_null_access();
	r3 = hl_vfields(r4)[2] ? (*(hl__types__ArrayObj*)(hl_vfields(r4)[2])) : (hl__types__ArrayObj)hl_dyn_getp(r4->value,239676598/*vars*/,&t$hl_types_ArrayObj);
	label$f922435_2_4:
	if( r3 == NULL ) hl_null_access();
	r5 = r3->length;
	if( r1 >= r5 ) goto label$f922435_2_19;
	r5 = r3->length;
	if( ((unsigned)r1) < ((unsigned)r5) ) goto label$f922435_2_12;
	r6 = NULL;
	goto label$f922435_2_15;
	label$f922435_2_12:
	r8 = r3->array;
	r7 = ((vdynamic**)(r8 + 1))[r1];
	r6 = hl_to_virtual(&t$vrt_09f4a29,(vdynamic*)r7);
	label$f922435_2_15:
	++r1;
	r9 = NULL;
	hxsl_SharedShader_browseVar(r0,r6,r9);
	goto label$f922435_2_4;
	label$f922435_2_19:
	return;
}

hxsl__ShaderInstance hxsl_SharedShader_makeInstance(hxsl__SharedShader r0,int r1) {
	String r11;
	hl__types__ArrayObj r20;
	hxsl__$SharedShader r17;
	vvirtual *r6, *r8, *r19;
	hxsl__Eval r2;
	venum *r7, *r12;
	bool r15;
	haxe__ds__IntMap r22;
	hxsl__ShaderInstance r18;
	hxsl__ShaderConst r4, r5;
	vdynamic *r10;
	varray *r21;
	int r9, r13, r14, r16;
	r2 = (hxsl__Eval)hl_alloc_obj(&t$hxsl_Eval);
	hxsl_Eval_new(r2);
	r4 = r0->consts;
	label$f922435_3_3:
	if( !r4 ) goto label$f922435_3_52;
	if( r4 == NULL ) hl_null_access();
	r6 = r4->v;
	r8 = r4->v;
	if( r8 == NULL ) hl_null_access();
	r7 = hl_vfields(r8)[5] ? (*(venum**)(hl_vfields(r8)[5])) : (venum*)hl_dyn_getp(r8->value,218690500/*type*/,&t$hxsl_Type);
	if( r7 == NULL ) hl_null_access();
	r9 = HL__ENUM_INDEX__(r7);
	switch(r9) {
		default:
		case 0:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
		case 10:
		case 11:
		case 12:
		case 13:
		case 14:
		case 15:
		case 16:
			r11 = (String)s$assert;
			r10 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r10);
		case 1:
			r13 = r4->pos;
			r9 = ((unsigned)r1) >> r13;
			r13 = 1;
			r14 = r4->bits;
			r13 = r13 << r14;
			r14 = 1;
			r13 = r13 - r14;
			r9 = r9 & r13;
			r12 = hl_alloc_enum(&t$hxsl_Const,2);
			((hxsl_Const_CInt*)r12)->p0 = r9;
			goto label$f922435_3_47;
		case 2:
			r13 = r4->pos;
			r9 = ((unsigned)r1) >> r13;
			r13 = 1;
			r9 = r9 & r13;
			r13 = 0;
			if( r9 != r13 ) goto label$f922435_3_34;
			r15 = false;
			goto label$f922435_3_35;
			label$f922435_3_34:
			r15 = true;
			label$f922435_3_35:
			r12 = hl_alloc_enum(&t$hxsl_Const,1);
			((hxsl_Const_CBool*)r12)->p0 = r15;
			goto label$f922435_3_47;
		case 17:
			r9 = ((hxsl_Type_TChannel*)r7)->p0;
			r14 = r4->pos;
			r13 = ((unsigned)r1) >> r14;
			r14 = 1;
			r16 = r4->bits;
			r14 = r14 << r16;
			r16 = 1;
			r14 = r14 - r16;
			r13 = r13 & r14;
			r12 = hl_alloc_enum(&t$hxsl_Const,2);
			((hxsl_Const_CInt*)r12)->p0 = r13;
	}
	label$f922435_3_47:
	if( r2 == NULL ) hl_null_access();
	hxsl_Eval_setConstant(r2,r6,r12);
	r5 = r4->next;
	r4 = r5;
	goto label$f922435_3_3;
	label$f922435_3_52:
	if( r2 == NULL ) hl_null_access();
	r15 = true;
	r2->inlineCalls = r15;
	r17 = (hxsl__$SharedShader)g$_hxsl_SharedShader;
	r15 = r17->UNROLL_LOOPS;
	r2->unrollLoops = r15;
	r18 = (hxsl__ShaderInstance)hl_alloc_obj(&t$hxsl_ShaderInstance);
	r19 = r0->data;
	r19 = hxsl_Eval_eval(r2,r19);
	hxsl_ShaderInstance_new(r18,r19);
	r9 = 0;
	r0->paramsCount = r9;
	r9 = 0;
	r19 = r0->data;
	if( r19 == NULL ) hl_null_access();
	r20 = hl_vfields(r19)[2] ? (*(hl__types__ArrayObj*)(hl_vfields(r19)[2])) : (hl__types__ArrayObj)hl_dyn_getp(r19->value,239676598/*vars*/,&t$hl_types_ArrayObj);
	label$f922435_3_68:
	if( r20 == NULL ) hl_null_access();
	r14 = r20->length;
	if( r9 >= r14 ) goto label$f922435_3_82;
	r14 = r20->length;
	if( ((unsigned)r9) < ((unsigned)r14) ) goto label$f922435_3_76;
	r6 = NULL;
	goto label$f922435_3_79;
	label$f922435_3_76:
	r21 = r20->array;
	r10 = ((vdynamic**)(r21 + 1))[r9];
	r6 = hl_to_virtual(&t$vrt_09f4a29,(vdynamic*)r10);
	label$f922435_3_79:
	++r9;
	hxsl_SharedShader_addParam(r0,r2,r18,r6);
	goto label$f922435_3_68;
	label$f922435_3_82:
	r22 = r0->instanceCache;
	if( r22 == NULL ) hl_null_access();
	haxe_ds_IntMap_set(r22,r1,((vdynamic*)r18));
	return r18;
}

void hxsl_SharedShader_addParam(hxsl__SharedShader r0,hxsl__Eval r1,hxsl__ShaderInstance r2,vvirtual* r3) {
	haxe__ds__ObjectMap r16;
	hl__types__ArrayObj r9;
	vvirtual *r5;
	venum *r4, *r13, *r14;
	haxe__ds__IntMap r15;
	vdynamic *r11, *r17;
	varray *r12;
	int r7, r8, r10;
	if( r3 == NULL ) hl_null_access();
	r4 = hl_vfields(r3)[5] ? (*(venum**)(hl_vfields(r3)[5])) : (venum*)hl_dyn_getp(r3->value,218690500/*type*/,&t$hxsl_Type);
	if( r4 == NULL ) hl_null_access();
	r7 = HL__ENUM_INDEX__(r4);
	r8 = 13;
	if( r7 != r8 ) goto label$f922435_4_23;
	r9 = ((hxsl_Type_TStruct*)r4)->p0;
	r7 = 0;
	label$f922435_4_8:
	if( r9 == NULL ) hl_null_access();
	r10 = r9->length;
	if( r7 >= r10 ) goto label$f922435_4_22;
	r10 = r9->length;
	if( ((unsigned)r7) < ((unsigned)r10) ) goto label$f922435_4_16;
	r5 = NULL;
	goto label$f922435_4_19;
	label$f922435_4_16:
	r12 = r9->array;
	r11 = ((vdynamic**)(r12 + 1))[r7];
	r5 = hl_to_virtual(&t$vrt_09f4a29,(vdynamic*)r11);
	label$f922435_4_19:
	++r7;
	hxsl_SharedShader_addParam(r0,r1,r2,r5);
	goto label$f922435_4_8;
	label$f922435_4_22:
	goto label$f922435_4_42;
	label$f922435_4_23:
	r13 = hl_vfields(r3)[1] ? (*(venum**)(hl_vfields(r3)[1])) : (venum*)hl_dyn_getp(r3->value,118088286/*kind*/,&t$hxsl_VarKind);
	r14 = (venum*)g$hxsl_VarKind_Param;
	if( r13 != r14 ) goto label$f922435_4_42;
	if( r2 == NULL ) hl_null_access();
	r15 = r2->params;
	if( r15 == NULL ) hl_null_access();
	if( r1 == NULL ) hl_null_access();
	r16 = r1->varMap;
	if( r16 == NULL ) hl_null_access();
	r11 = haxe_ds_ObjectMap_get(r16,((vdynamic*)r3));
	r5 = hl_to_virtual(&t$vrt_09f4a29,(vdynamic*)r11);
	if( r5 == NULL ) hl_null_access();
	r7 = hl_vfields(r5)[0] ? (*(int*)(hl_vfields(r5)[0])) : (int)hl_dyn_geti(r5->value,23515/*id*/,&t$_i32);
	r8 = r0->paramsCount;
	r17 = hl_alloc_dynamic(&t$_i32);
	r17->v.i = r8;
	haxe_ds_IntMap_set(r15,r7,((vdynamic*)r17));
	r7 = r0->paramsCount;
	++r7;
	r0->paramsCount = r7;
	label$f922435_4_42:
	return;
}

void hxsl_SharedShader_browseVar(hxsl__SharedShader r0,vvirtual* r1,String r2) {
	String r6, r7, r8;
	hl__types__ArrayObj r11;
	vvirtual *r3;
	venum *r9, *r15, *r16;
	bool r18;
	hxsl__ShaderGlobal r17;
	hxsl__ShaderConst r20, r21;
	vdynamic *r13;
	varray *r14;
	int r4, r10, r12, r19;
	if( r1 == NULL ) hl_null_access();
	r4 = hxsl_Tools_allocVarId();
	if( hl_vfields(r1)[0] ) *(int*)(hl_vfields(r1)[0]) = (int)r4; else hl_dyn_seti(r1->value,23515/*id*/,&t$_i32,r4);
	if( r2 ) goto label$f922435_5_7;
	r6 = hxsl_Tools_getName(r1);
	r2 = r6;
	goto label$f922435_5_12;
	label$f922435_5_7:
	r7 = (String)s$5058f1a;
	r8 = hl_vfields(r1)[2] ? (*(String*)(hl_vfields(r1)[2])) : (String)hl_dyn_getp(r1->value,150958933/*name*/,&t$String);
	r7 = String___add__(r7,r8);
	r6 = String___add__(r2,r7);
	r2 = r6;
	label$f922435_5_12:
	r9 = hl_vfields(r1)[5] ? (*(venum**)(hl_vfields(r1)[5])) : (venum*)hl_dyn_getp(r1->value,218690500/*type*/,&t$hxsl_Type);
	if( r9 == NULL ) hl_null_access();
	r4 = HL__ENUM_INDEX__(r9);
	r10 = 13;
	if( r4 != r10 ) goto label$f922435_5_34;
	r11 = ((hxsl_Type_TStruct*)r9)->p0;
	r4 = 0;
	label$f922435_5_19:
	if( r11 == NULL ) hl_null_access();
	r12 = r11->length;
	if( r4 >= r12 ) goto label$f922435_5_33;
	r12 = r11->length;
	if( ((unsigned)r4) < ((unsigned)r12) ) goto label$f922435_5_27;
	r3 = NULL;
	goto label$f922435_5_30;
	label$f922435_5_27:
	r14 = r11->array;
	r13 = ((vdynamic**)(r14 + 1))[r4];
	r3 = hl_to_virtual(&t$vrt_09f4a29,(vdynamic*)r13);
	label$f922435_5_30:
	++r4;
	hxsl_SharedShader_browseVar(r0,r3,r2);
	goto label$f922435_5_19;
	label$f922435_5_33:
	goto label$f922435_5_68;
	label$f922435_5_34:
	r4 = 0;
	r15 = hl_vfields(r1)[1] ? (*(venum**)(hl_vfields(r1)[1])) : (venum*)hl_dyn_getp(r1->value,118088286/*kind*/,&t$hxsl_VarKind);
	r16 = (venum*)g$hxsl_VarKind_Global;
	if( r15 != r16 ) goto label$f922435_5_45;
	r10 = hxsl_Globals_allocID(r6);
	r4 = r10;
	r11 = r0->globals;
	if( r11 == NULL ) hl_null_access();
	r17 = (hxsl__ShaderGlobal)hl_alloc_obj(&t$hxsl_ShaderGlobal);
	hxsl_ShaderGlobal_new(r17,r1,r10);
	r10 = hl_types_ArrayObj_push(r11,((vdynamic*)r17));
	label$f922435_5_45:
	r18 = hxsl_Tools_isConst(r1);
	if( r18 ) goto label$f922435_5_48;
	return;
	label$f922435_5_48:
	r10 = hxsl_Tools_getConstBits(r1);
	r19 = 0;
	if( r19 >= r10 ) goto label$f922435_5_68;
	r20 = r0->consts;
	if( r20 ) goto label$f922435_5_55;
	r12 = 0;
	goto label$f922435_5_62;
	label$f922435_5_55:
	r20 = r0->consts;
	if( r20 == NULL ) hl_null_access();
	r12 = r20->pos;
	r20 = r0->consts;
	if( r20 == NULL ) hl_null_access();
	r19 = r20->bits;
	r12 = r12 + r19;
	label$f922435_5_62:
	r20 = (hxsl__ShaderConst)hl_alloc_obj(&t$hxsl_ShaderConst);
	hxsl_ShaderConst_new(r20,r1,r12,r10);
	r20->globalId = r4;
	r21 = r0->consts;
	r20->next = r21;
	r0->consts = r20;
	label$f922435_5_68:
	return;
}
