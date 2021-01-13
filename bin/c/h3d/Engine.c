﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <h3d/Engine.h>
void h3d_Engine_onCreate(h3d__Engine,bool);
extern hl_type t$fun_d6a95db;
#include <hxsl/RuntimeShader.h>
void h3d_Engine_doFlushTarget(h3d__Engine);
#include <h3d/mat/Pass.h>
#include <h3d/shader/Buffers.h>
#include <h3d/Buffer.h>
#include <h3d/impl/ManagedBuffer.h>
#include <h3d/Indexes.h>
bool h3d_Indexes_isDisposed(h3d__Indexes);
extern String s$Buffer_is_split;
vdynamic* haxe_Exception_thrown(vdynamic*);
#include <hxd/impl/Allocator.h>
#include <hl/types/ArrayObj.h>
#include <h3d/mat/TextureFlags.h>
#include <hxd/PixelFormat.h>
#include <h3d/impl/Feature.h>
extern h3d__$Engine g$_h3d_Engine;
int hxd_Window_get_width(hxd__Window);
int hxd_Window_get_height(hxd__Window);
hxd__impl__Allocator hxd_impl_Allocator_get(void);
void hxd_impl_Allocator_onContextLost(hxd__impl__Allocator);
void h3d_impl_MemoryManager_onContextLost(h3d__impl__MemoryManager);
extern hl_type t$h3d_impl_MemoryManager;
void h3d_impl_MemoryManager_new(h3d__impl__MemoryManager,h3d__impl__Driver);
void h3d_impl_MemoryManager_init(h3d__impl__MemoryManager);
extern hl_type t$h3d_mat_Texture;
extern hl_type t$h3d_mat_TextureFlags;
#include <hl/natives.h>
extern venum* g$h3d_mat_TextureFlags_NoAlloc;
hl__types__ArrayObj hl_types_ArrayObj_alloc(varray*);
void h3d_mat_Texture_new(h3d__mat__Texture,int,int,hl__types__ArrayObj,venum*);
extern venum* g$6181a89;
bool h3d_Engine_set_fullScreen(h3d__Engine,bool);
void h3d_Engine_resize(h3d__Engine,int,int);
#include <hxd/SystemValue.h>
extern venum* g$hxd_SystemValue_IsWindowed;
bool hxd_System_getValue(venum*);
int hxd_Window_set_displayMode(hxd__Window,int);
#include <hxd/Timer.h>
extern hxd__$Timer g$_hxd_Timer;
extern hl_type t$_f64;
extern hl_type t$_i32;
void h3d_Engine_clear(h3d__Engine,vdynamic*,vdynamic*,vdynamic*);
extern hl_type t$h3d__Engine_TargetTmp;
void h3d__Engine_TargetTmp_new(h3d___Engine__TargetTmp,h3d__mat__Texture,h3d___Engine__TargetTmp,int,int);
void h3d_Engine_updateNeedFlush(h3d__Engine);
extern String s$6e0e621;
extern hl_type t$fun_d333c41;
#include <h3d/impl/GlDriver.h>
extern hl_type t$fun_9e7b219;
extern hl_type t$haxe_ds_ObjectMap;
void haxe_ds_ObjectMap_new(haxe__ds__ObjectMap);
extern hl_type t$haxe_ds_IntMap;
void haxe_ds_IntMap_new(haxe__ds__IntMap);
extern hl_type t$h3d_Vector;
void h3d_Vector_new(h3d__Vector,double*,double*,double*,double*);
hxd__Window hxd_Window_getInstance(void);
double hxd_System_getDefaultFrameRate(void);
void hxd_Window_addResizeEvent(hxd__Window,vclosure*);
extern hl_type t$h3d_impl_GlDriver;
void h3d_impl_GlDriver_new(h3d__impl__GlDriver,int*);

void h3d_Engine_init(h3d__Engine r0) {
	bool *r5;
	bool r4;
	vclosure *r3;
	h3d__impl__Driver r2;
	r2 = r0->driver;
	if( r2 == NULL ) hl_null_access();
	r3 = hl_alloc_closure_ptr(&t$fun_d6a95db,h3d_Engine_onCreate,r0);
	r4 = r0->hardware;
	r4 = !r4;
	r5 = &r4;
	((void (*)(h3d__impl__Driver,vclosure*,bool*))r2->$type->vobj_proto[7])(r2,r3,r5);
	return;
}

void h3d_Engine_selectShader(h3d__Engine r0,hxsl__RuntimeShader r1) {
	bool r3;
	h3d__impl__Driver r4;
	int r5;
	r3 = r0->needFlushTarget;
	if( !r3 ) goto label$5eb80ee_2_3;
	h3d_Engine_doFlushTarget(r0);
	label$5eb80ee_2_3:
	r4 = r0->driver;
	if( r4 == NULL ) hl_null_access();
	r3 = ((bool (*)(h3d__impl__Driver,hxsl__RuntimeShader))r4->$type->vobj_proto[9])(r4,r1);
	if( !r3 ) goto label$5eb80ee_2_10;
	r5 = r0->shaderSwitches;
	++r5;
	r0->shaderSwitches = r5;
	label$5eb80ee_2_10:
	return;
}

void h3d_Engine_selectMaterial(h3d__Engine r0,h3d__mat__Pass r1) {
	h3d__impl__Driver r3;
	r3 = r0->driver;
	if( r3 == NULL ) hl_null_access();
	((void (*)(h3d__impl__Driver,h3d__mat__Pass))r3->$type->vobj_proto[10])(r3,r1);
	return;
}

void h3d_Engine_uploadShaderBuffers(h3d__Engine r0,h3d__shader__Buffers r1,int r2) {
	h3d__impl__Driver r4;
	r4 = r0->driver;
	if( r4 == NULL ) hl_null_access();
	((void (*)(h3d__impl__Driver,h3d__shader__Buffers,int))r4->$type->vobj_proto[11])(r4,r1,r2);
	return;
}

bool h3d_Engine_selectBuffer(h3d__Engine r0,h3d__Buffer r1) {
	vvirtual *r4;
	bool r5;
	h3d__impl__Driver r6;
	h3d__impl__ManagedBuffer r3;
	if( r1 == NULL ) hl_null_access();
	r3 = r1->buffer;
	if( !r3 ) goto label$5eb80ee_5_7;
	r3 = r1->buffer;
	if( r3 == NULL ) hl_null_access();
	r4 = r3->vbuf;
	if( r4 ) goto label$5eb80ee_5_9;
	label$5eb80ee_5_7:
	r5 = false;
	return r5;
	label$5eb80ee_5_9:
	r5 = r0->needFlushTarget;
	if( !r5 ) goto label$5eb80ee_5_12;
	h3d_Engine_doFlushTarget(r0);
	label$5eb80ee_5_12:
	r6 = r0->driver;
	if( r6 == NULL ) hl_null_access();
	((void (*)(h3d__impl__Driver,h3d__Buffer))r6->$type->vobj_proto[12])(r6,r1);
	r5 = true;
	return r5;
}

void h3d_Engine_renderBuffer(h3d__Engine r0,h3d__Buffer r1,h3d__Indexes r2,int r3,int* r4,int* r5) {
	vvirtual *r19;
	bool r9;
	h3d__Buffer r12;
	double r10, r13, r15;
	h3d__impl__Driver r18;
	int r6, r7, r11, r14, r16, r17;
	if( r4 ) goto label$5eb80ee_6_3;
	r6 = 0;
	goto label$5eb80ee_6_4;
	label$5eb80ee_6_3:
	r6 = *r4;
	label$5eb80ee_6_4:
	if( r5 ) goto label$5eb80ee_6_7;
	r7 = -1;
	goto label$5eb80ee_6_8;
	label$5eb80ee_6_7:
	r7 = *r5;
	label$5eb80ee_6_8:
	if( r2 == NULL ) hl_null_access();
	r9 = h3d_Indexes_isDisposed(r2);
	if( !r9 ) goto label$5eb80ee_6_12;
	return;
	label$5eb80ee_6_12:
	r9 = true;
	if( !r9 ) goto label$5eb80ee_6_77;
	if( r1 == NULL ) hl_null_access();
	r11 = r1->vertices;
	r10 = (double)r11;
	r13 = (double)r3;
	r10 = r10 / r13;
	r11 = (int)r10;
	r14 = r1->position;
	r13 = (double)r14;
	r15 = (double)r3;
	r13 = r13 / r15;
	r14 = (int)r13;
	r17 = 0;
	if( r17 >= r6 ) goto label$5eb80ee_6_42;
	if( r6 < r11 ) goto label$5eb80ee_6_36;
	r16 = r6 - r11;
	r6 = r16;
	r12 = r1->next;
	r1 = r12;
	if( r12 ) goto label$5eb80ee_6_35;
	goto label$5eb80ee_6_77;
	label$5eb80ee_6_35:
	goto label$5eb80ee_6_12;
	label$5eb80ee_6_36:
	r16 = r14 + r6;
	r14 = r16;
	r16 = r11 - r6;
	r11 = r16;
	r16 = 0;
	r6 = r16;
	label$5eb80ee_6_42:
	r17 = 0;
	if( r7 < r17 ) goto label$5eb80ee_6_55;
	r17 = 0;
	if( r7 != r17 ) goto label$5eb80ee_6_47;
	return;
	label$5eb80ee_6_47:
	r16 = r7 - r11;
	r7 = r16;
	r17 = 0;
	if( r16 >= r17 ) goto label$5eb80ee_6_55;
	r16 = r11 + r7;
	r11 = r16;
	r16 = 0;
	r7 = r16;
	label$5eb80ee_6_55:
	r17 = 0;
	if( r17 >= r11 ) goto label$5eb80ee_6_72;
	r9 = h3d_Engine_selectBuffer(r0,r1);
	if( !r9 ) goto label$5eb80ee_6_72;
	r18 = r0->driver;
	if( r18 == NULL ) hl_null_access();
	if( r2 == NULL ) hl_null_access();
	r19 = r2->ibuf;
	r17 = 3;
	r16 = r14 * r17;
	((void (*)(h3d__impl__Driver,vvirtual*,int,int))r18->$type->vobj_proto[13])(r18,r19,r16,r11);
	r16 = r0->drawTriangles;
	r16 = r16 + r11;
	r0->drawTriangles = r16;
	r16 = r0->drawCalls;
	++r16;
	r0->drawCalls = r16;
	label$5eb80ee_6_72:
	r12 = r1->next;
	r1 = r12;
	if( r12 ) goto label$5eb80ee_6_76;
	goto label$5eb80ee_6_77;
	label$5eb80ee_6_76:
	goto label$5eb80ee_6_12;
	label$5eb80ee_6_77:
	return;
}

void h3d_Engine_renderIndexed(h3d__Engine r0,h3d__Buffer r1,h3d__Indexes r2,int* r3,int* r4) {
	String r10;
	vvirtual *r18;
	bool r11;
	double r12, r14;
	h3d__Buffer r8;
	h3d__impl__Driver r17;
	vdynamic *r9;
	int r5, r6, r13, r15, r16;
	if( r3 ) goto label$5eb80ee_7_3;
	r5 = 0;
	goto label$5eb80ee_7_4;
	label$5eb80ee_7_3:
	r5 = *r3;
	label$5eb80ee_7_4:
	if( r4 ) goto label$5eb80ee_7_7;
	r6 = -1;
	goto label$5eb80ee_7_8;
	label$5eb80ee_7_7:
	r6 = *r4;
	label$5eb80ee_7_8:
	if( r1 == NULL ) hl_null_access();
	r8 = r1->next;
	if( !r8 ) goto label$5eb80ee_7_14;
	r10 = (String)s$Buffer_is_split;
	r9 = haxe_Exception_thrown(((vdynamic*)r10));
	hl_throw((vdynamic*)r9);
	label$5eb80ee_7_14:
	if( r2 == NULL ) hl_null_access();
	r11 = h3d_Indexes_isDisposed(r2);
	if( !r11 ) goto label$5eb80ee_7_18;
	return;
	label$5eb80ee_7_18:
	r13 = r2->count;
	r12 = (double)r13;
	r14 = 3.;
	r12 = r12 / r14;
	r13 = (int)r12;
	r16 = 0;
	if( r6 >= r16 ) goto label$5eb80ee_7_27;
	r15 = r13 - r5;
	r6 = r15;
	label$5eb80ee_7_27:
	r16 = 0;
	if( r16 >= r6 ) goto label$5eb80ee_7_43;
	r11 = h3d_Engine_selectBuffer(r0,r1);
	if( !r11 ) goto label$5eb80ee_7_43;
	r17 = r0->driver;
	if( r17 == NULL ) hl_null_access();
	r18 = r2->ibuf;
	r16 = 3;
	r15 = r5 * r16;
	((void (*)(h3d__impl__Driver,vvirtual*,int,int))r17->$type->vobj_proto[13])(r17,r18,r15,r6);
	r15 = r0->drawTriangles;
	r15 = r15 + r6;
	r0->drawTriangles = r15;
	r15 = r0->drawCalls;
	++r15;
	r0->drawCalls = r15;
	label$5eb80ee_7_43:
	return;
}

bool h3d_Engine_set_debug(h3d__Engine r0,bool r1) {
	bool r2;
	h3d__impl__Driver r4;
	r0->debug = r1;
	r4 = r0->driver;
	if( r4 == NULL ) hl_null_access();
	r2 = r0->debug;
	((void (*)(h3d__impl__Driver,bool))r4->$type->vobj_proto[22])(r4,r2);
	return r1;
}

void h3d_Engine_onCreate(h3d__Engine r0,bool r1) {
	hl__types__ArrayObj r12;
	venum *r16, *r17, *r18;
	hl_type *r14;
	bool r4;
	hxd__impl__Allocator r7;
	hxd__Window r6;
	h3d__impl__MemoryManager r8;
	h3d__$Engine r2;
	vclosure *r19;
	h3d__impl__Driver r9;
	varray *r13;
	h3d__mat__Texture r10;
	int r5, r11, r15;
	r2 = (h3d__$Engine)g$_h3d_Engine;
	r2->CURRENT = r0;
	r4 = r0->autoResize;
	if( !r4 ) goto label$5eb80ee_9_12;
	r6 = r0->window;
	if( r6 == NULL ) hl_null_access();
	r5 = hxd_Window_get_width(r6);
	r0->width = r5;
	r6 = r0->window;
	if( r6 == NULL ) hl_null_access();
	r5 = hxd_Window_get_height(r6);
	r0->height = r5;
	label$5eb80ee_9_12:
	if( !r1 ) goto label$5eb80ee_9_20;
	r7 = hxd_impl_Allocator_get();
	if( r7 == NULL ) hl_null_access();
	hxd_impl_Allocator_onContextLost(r7);
	r8 = r0->mem;
	if( r8 == NULL ) hl_null_access();
	h3d_impl_MemoryManager_onContextLost(r8);
	goto label$5eb80ee_9_40;
	label$5eb80ee_9_20:
	r8 = (h3d__impl__MemoryManager)hl_alloc_obj(&t$h3d_impl_MemoryManager);
	r9 = r0->driver;
	h3d_impl_MemoryManager_new(r8,r9);
	r0->mem = r8;
	r8 = r0->mem;
	if( r8 == NULL ) hl_null_access();
	h3d_impl_MemoryManager_init(r8);
	r10 = (h3d__mat__Texture)hl_alloc_obj(&t$h3d_mat_Texture);
	r5 = 0;
	r11 = 0;
	r14 = &t$h3d_mat_TextureFlags;
	r15 = 1;
	r13 = hl_alloc_array(r14,r15);
	r16 = (venum*)g$h3d_mat_TextureFlags_NoAlloc;
	r15 = 0;
	((venum**)(r13 + 1))[r15] = r16;
	r12 = hl_types_ArrayObj_alloc(r13);
	r17 = NULL;
	h3d_mat_Texture_new(r10,r5,r11,r12,r17);
	r0->nullTexture = r10;
	label$5eb80ee_9_40:
	r9 = r0->driver;
	if( r9 == NULL ) hl_null_access();
	r18 = (venum*)g$6181a89;
	r4 = ((bool (*)(h3d__impl__Driver,venum*))r9->$type->vobj_proto[0])(r9,r18);
	r0->hardware = r4;
	r4 = r0->debug;
	r4 = h3d_Engine_set_debug(r0,r4);
	r4 = r0->fullScreen;
	r4 = h3d_Engine_set_fullScreen(r0,r4);
	r5 = r0->width;
	r11 = r0->height;
	h3d_Engine_resize(r0,r5,r11);
	if( !r1 ) goto label$5eb80ee_9_57;
	r19 = r0->onContextLost;
	if( r19 == NULL ) hl_null_access();
	r19->hasValue ? ((void (*)(vdynamic*))r19->fun)((vdynamic*)r19->value) : ((void (*)(void))r19->fun)();
	goto label$5eb80ee_9_60;
	label$5eb80ee_9_57:
	r19 = r0->onReady;
	if( r19 == NULL ) hl_null_access();
	r19->hasValue ? ((void (*)(vdynamic*))r19->fun)((vdynamic*)r19->value) : ((void (*)(void))r19->fun)();
	label$5eb80ee_9_60:
	r4 = true;
	r0->ready = r4;
	return;
}

void h3d_Engine_onContextLost(h3d__Engine r0) {
	return;
}

void h3d_Engine_onReady(h3d__Engine r0) {
	return;
}

void h3d_Engine_onWindowResize(h3d__Engine r0) {
	bool r2;
	hxd__Window r5;
	vclosure *r8;
	h3d__impl__Driver r3;
	int r4, r6, r7;
	r2 = r0->autoResize;
	if( !r2 ) goto label$5eb80ee_12_20;
	r3 = r0->driver;
	if( r3 == NULL ) hl_null_access();
	r2 = ((bool (*)(h3d__impl__Driver))r3->$type->vobj_proto[3])(r3);
	if( r2 ) goto label$5eb80ee_12_20;
	r5 = r0->window;
	if( r5 == NULL ) hl_null_access();
	r4 = hxd_Window_get_width(r5);
	r5 = r0->window;
	if( r5 == NULL ) hl_null_access();
	r6 = hxd_Window_get_height(r5);
	r7 = r0->width;
	if( r4 != r7 ) goto label$5eb80ee_12_16;
	r7 = r0->height;
	if( r6 == r7 ) goto label$5eb80ee_12_17;
	label$5eb80ee_12_16:
	h3d_Engine_resize(r0,r4,r6);
	label$5eb80ee_12_17:
	r8 = r0->onResized;
	if( r8 == NULL ) hl_null_access();
	r8->hasValue ? ((void (*)(vdynamic*))r8->fun)((vdynamic*)r8->value) : ((void (*)(void))r8->fun)();
	label$5eb80ee_12_20:
	return;
}

bool h3d_Engine_set_fullScreen(h3d__Engine r0,bool r1) {
	venum *r4;
	bool r2;
	hxd__Window r6;
	h3d__impl__MemoryManager r3;
	int r5;
	r0->fullScreen = r1;
	r3 = r0->mem;
	if( !r3 ) goto label$5eb80ee_13_13;
	r4 = (venum*)g$hxd_SystemValue_IsWindowed;
	r2 = hxd_System_getValue(r4);
	if( !r2 ) goto label$5eb80ee_13_13;
	r6 = r0->window;
	if( r6 == NULL ) hl_null_access();
	if( !r1 ) goto label$5eb80ee_13_11;
	r5 = 2;
	goto label$5eb80ee_13_12;
	label$5eb80ee_13_11:
	r5 = 0;
	label$5eb80ee_13_12:
	r5 = hxd_Window_set_displayMode(r6,r5);
	label$5eb80ee_13_13:
	return r1;
}

void h3d_Engine_onResized(h3d__Engine r0) {
	return;
}

void h3d_Engine_resize(h3d__Engine r0,int r1,int r2) {
	bool r6;
	h3d__impl__Driver r7;
	int r4, r5;
	r5 = 32;
	if( r1 >= r5 ) goto label$5eb80ee_15_4;
	r4 = 32;
	r1 = r4;
	label$5eb80ee_15_4:
	r5 = 32;
	if( r2 >= r5 ) goto label$5eb80ee_15_8;
	r4 = 32;
	r2 = r4;
	label$5eb80ee_15_8:
	r0->width = r1;
	r0->height = r2;
	r7 = r0->driver;
	if( r7 == NULL ) hl_null_access();
	r6 = ((bool (*)(h3d__impl__Driver))r7->$type->vobj_proto[3])(r7);
	if( r6 ) goto label$5eb80ee_15_17;
	r7 = r0->driver;
	if( r7 == NULL ) hl_null_access();
	((void (*)(h3d__impl__Driver,int,int))r7->$type->vobj_proto[8])(r7,r1,r2);
	label$5eb80ee_15_17:
	return;
}

bool h3d_Engine_begin(h3d__Engine r0) {
	h3d___Engine__TargetTmp r5;
	bool r2;
	hxd__$Timer r8;
	double r10;
	vdynamic *r9, *r11, *r12;
	h3d__impl__Driver r3;
	h3d__mat__Texture r6, r7;
	int r4;
	r3 = r0->driver;
	if( r3 == NULL ) hl_null_access();
	r2 = ((bool (*)(h3d__impl__Driver))r3->$type->vobj_proto[3])(r3);
	if( !r2 ) goto label$5eb80ee_16_6;
	r2 = false;
	return r2;
	label$5eb80ee_16_6:
	r2 = true;
	r0->inRender = r2;
	r4 = 0;
	r0->drawTriangles = r4;
	r4 = 0;
	r0->shaderSwitches = r4;
	r4 = 0;
	r0->drawCalls = r4;
	r5 = NULL;
	r0->targetStack = r5;
	r6 = r0->currentTargetTex;
	r7 = NULL;
	if( r6 != r7 ) goto label$5eb80ee_16_21;
	r2 = false;
	goto label$5eb80ee_16_22;
	label$5eb80ee_16_21:
	r2 = true;
	label$5eb80ee_16_22:
	r0->needFlushTarget = r2;
	r3 = r0->driver;
	if( r3 == NULL ) hl_null_access();
	r8 = (hxd__$Timer)g$_hxd_Timer;
	r4 = r8->frameCount;
	((void (*)(h3d__impl__Driver,int))r3->$type->vobj_proto[4])(r3,r4);
	r9 = r0->backgroundColor;
	if( !r9 ) goto label$5eb80ee_16_37;
	r9 = r0->backgroundColor;
	r4 = 1;
	r10 = (double)r4;
	r11 = hl_alloc_dynamic(&t$_f64);
	r11->v.d = r10;
	r4 = 0;
	r12 = hl_alloc_dynamic(&t$_i32);
	r12->v.i = r4;
	h3d_Engine_clear(r0,r9,r11,r12);
	label$5eb80ee_16_37:
	r2 = true;
	return r2;
}

void h3d_Engine_end(h3d__Engine r0) {
	bool r1;
	h3d__impl__Driver r3;
	r1 = false;
	r0->inRender = r1;
	r3 = r0->driver;
	if( r3 == NULL ) hl_null_access();
	((void (*)(h3d__impl__Driver))r3->$type->vobj_proto[21])(r3);
	return;
}

h3d__mat__Texture h3d_Engine_getCurrentTarget(h3d__Engine r0) {
	h3d___Engine__TargetTmp r1;
	h3d__mat__Texture r2;
	r1 = r0->targetStack;
	if( r1 ) goto label$5eb80ee_18_4;
	r2 = NULL;
	return r2;
	label$5eb80ee_18_4:
	r1 = r0->targetStack;
	if( r1 == NULL ) hl_null_access();
	r2 = r1->_t;
	return r2;
}

void h3d_Engine_pushTarget(h3d__Engine r0,h3d__mat__Texture r1,int* r2,int* r3) {
	h3d___Engine__TargetTmp r6, r8, r9;
	int r4, r5;
	if( r2 ) goto label$5eb80ee_19_3;
	r4 = 0;
	goto label$5eb80ee_19_4;
	label$5eb80ee_19_3:
	r4 = *r2;
	label$5eb80ee_19_4:
	if( r3 ) goto label$5eb80ee_19_7;
	r5 = 0;
	goto label$5eb80ee_19_8;
	label$5eb80ee_19_7:
	r5 = *r3;
	label$5eb80ee_19_8:
	r6 = r0->targetTmp;
	if( r6 ) goto label$5eb80ee_19_15;
	r8 = (h3d___Engine__TargetTmp)hl_alloc_obj(&t$h3d__Engine_TargetTmp);
	r9 = r0->targetStack;
	h3d__Engine_TargetTmp_new(r8,r1,r9,r4,r5);
	r6 = r8;
	goto label$5eb80ee_19_23;
	label$5eb80ee_19_15:
	if( r6 == NULL ) hl_null_access();
	r8 = r6->next;
	r0->targetTmp = r8;
	r6->_t = r1;
	r9 = r0->targetStack;
	r6->next = r9;
	r6->mipLevel = r5;
	r6->layer = r4;
	label$5eb80ee_19_23:
	r0->targetStack = r6;
	h3d_Engine_updateNeedFlush(r0);
	return;
}

void h3d_Engine_updateNeedFlush(h3d__Engine r0) {
	h3d___Engine__TargetTmp r1;
	hl__types__ArrayObj r8;
	bool r3;
	int r6, r7;
	h3d__mat__Texture r4, r5;
	r1 = r0->targetStack;
	if( r1 ) goto label$5eb80ee_20_10;
	r4 = r0->currentTargetTex;
	r5 = NULL;
	if( r4 != r5 ) goto label$5eb80ee_20_7;
	r3 = false;
	goto label$5eb80ee_20_8;
	label$5eb80ee_20_7:
	r3 = true;
	label$5eb80ee_20_8:
	r0->needFlushTarget = r3;
	goto label$5eb80ee_20_26;
	label$5eb80ee_20_10:
	r4 = r0->currentTargetTex;
	if( r1 == NULL ) hl_null_access();
	r5 = r1->_t;
	if( r4 != r5 ) goto label$5eb80ee_20_24;
	r6 = r0->currentTargetLayer;
	r7 = r1->layer;
	if( r6 != r7 ) goto label$5eb80ee_20_24;
	r6 = r0->currentTargetMip;
	r7 = r1->mipLevel;
	if( r6 != r7 ) goto label$5eb80ee_20_24;
	r8 = r1->textures;
	if( r8 ) goto label$5eb80ee_20_24;
	r3 = false;
	goto label$5eb80ee_20_25;
	label$5eb80ee_20_24:
	r3 = true;
	label$5eb80ee_20_25:
	r0->needFlushTarget = r3;
	label$5eb80ee_20_26:
	return;
}

void h3d_Engine_popTarget(h3d__Engine r0) {
	String r5;
	h3d___Engine__TargetTmp r1, r3, r8;
	hl__types__ArrayObj r7;
	vdynamic *r4;
	h3d__mat__Texture r6;
	r1 = r0->targetStack;
	if( r1 ) goto label$5eb80ee_21_5;
	r5 = (String)s$6e0e621;
	r4 = haxe_Exception_thrown(((vdynamic*)r5));
	hl_throw((vdynamic*)r4);
	label$5eb80ee_21_5:
	if( r1 == NULL ) hl_null_access();
	r3 = r1->next;
	r0->targetStack = r3;
	h3d_Engine_updateNeedFlush(r0);
	r6 = NULL;
	r1->_t = r6;
	r7 = NULL;
	r1->textures = r7;
	r8 = r0->targetTmp;
	r1->next = r8;
	r0->targetTmp = r1;
	return;
}

void h3d_Engine_doFlushTarget(h3d__Engine r0) {
	h3d___Engine__TargetTmp r1;
	hl__types__ArrayObj r7;
	bool r11;
	int *r5, *r6;
	h3d__impl__Driver r3;
	int r8, r9, r10;
	h3d__mat__Texture r4;
	r1 = r0->targetStack;
	if( r1 ) goto label$5eb80ee_22_11;
	r3 = r0->driver;
	if( r3 == NULL ) hl_null_access();
	r4 = NULL;
	r5 = NULL;
	r6 = NULL;
	((void (*)(h3d__impl__Driver,h3d__mat__Texture,int*,int*))r3->$type->vobj_proto[15])(r3,r4,r5,r6);
	r4 = NULL;
	r0->currentTargetTex = r4;
	goto label$5eb80ee_22_33;
	label$5eb80ee_22_11:
	if( r1 == NULL ) hl_null_access();
	r7 = r1->textures;
	if( !r7 ) goto label$5eb80ee_22_19;
	r3 = r0->driver;
	if( r3 == NULL ) hl_null_access();
	r7 = r1->textures;
	((void (*)(h3d__impl__Driver,hl__types__ArrayObj))r3->$type->vobj_proto[16])(r3,r7);
	goto label$5eb80ee_22_27;
	label$5eb80ee_22_19:
	r3 = r0->driver;
	if( r3 == NULL ) hl_null_access();
	r4 = r1->_t;
	r8 = r1->layer;
	r5 = &r8;
	r9 = r1->mipLevel;
	r6 = &r9;
	((void (*)(h3d__impl__Driver,h3d__mat__Texture,int*,int*))r3->$type->vobj_proto[15])(r3,r4,r5,r6);
	label$5eb80ee_22_27:
	r4 = r1->_t;
	r0->currentTargetTex = r4;
	r10 = r1->layer;
	r0->currentTargetLayer = r10;
	r10 = r1->mipLevel;
	r0->currentTargetMip = r10;
	label$5eb80ee_22_33:
	r11 = false;
	r0->needFlushTarget = r11;
	return;
}

void h3d_Engine_clear(h3d__Engine r0,vdynamic* r1,vdynamic* r2,vdynamic* r3) {
	bool r11;
	h3d__Vector r5;
	double r7, r10;
	h3d__impl__Driver r12;
	int r6, r8, r9;
	if( !r1 ) goto label$5eb80ee_23_32;
	r5 = r0->tmpVector;
	r6 = r1 ? r1->v.i : 0;
	if( r5 == NULL ) hl_null_access();
	r9 = 16;
	r8 = r6 >> r9;
	r9 = 255;
	r8 = r8 & r9;
	r7 = (double)r8;
	r10 = 255.;
	r7 = r7 / r10;
	r5->x = r7;
	r9 = 8;
	r8 = r6 >> r9;
	r9 = 255;
	r8 = r8 & r9;
	r7 = (double)r8;
	r10 = 255.;
	r7 = r7 / r10;
	r5->y = r7;
	r9 = 255;
	r8 = r6 & r9;
	r7 = (double)r8;
	r10 = 255.;
	r7 = r7 / r10;
	r5->z = r7;
	r9 = 24;
	r8 = ((unsigned)r6) >> r9;
	r7 = (double)r8;
	r10 = 255.;
	r7 = r7 / r10;
	r5->w = r7;
	label$5eb80ee_23_32:
	r11 = r0->needFlushTarget;
	if( !r11 ) goto label$5eb80ee_23_35;
	h3d_Engine_doFlushTarget(r0);
	label$5eb80ee_23_35:
	r12 = r0->driver;
	if( r12 == NULL ) hl_null_access();
	if( r1 ) goto label$5eb80ee_23_40;
	r5 = NULL;
	goto label$5eb80ee_23_41;
	label$5eb80ee_23_40:
	r5 = r0->tmpVector;
	label$5eb80ee_23_41:
	((void (*)(h3d__impl__Driver,h3d__Vector,vdynamic*,vdynamic*))r12->$type->vobj_proto[6])(r12,r5,r2,r3);
	return;
}

void h3d_Engine_setRenderZone(h3d__Engine r0,int* r1,int* r2,int* r3,int* r4) {
	bool r10;
	h3d__impl__Driver r11;
	int r5, r6, r7, r8;
	if( r1 ) goto label$5eb80ee_24_3;
	r5 = 0;
	goto label$5eb80ee_24_4;
	label$5eb80ee_24_3:
	r5 = *r1;
	label$5eb80ee_24_4:
	if( r2 ) goto label$5eb80ee_24_7;
	r6 = 0;
	goto label$5eb80ee_24_8;
	label$5eb80ee_24_7:
	r6 = *r2;
	label$5eb80ee_24_8:
	if( r3 ) goto label$5eb80ee_24_11;
	r7 = -1;
	goto label$5eb80ee_24_12;
	label$5eb80ee_24_11:
	r7 = *r3;
	label$5eb80ee_24_12:
	if( r4 ) goto label$5eb80ee_24_15;
	r8 = -1;
	goto label$5eb80ee_24_16;
	label$5eb80ee_24_15:
	r8 = *r4;
	label$5eb80ee_24_16:
	r10 = r0->needFlushTarget;
	if( !r10 ) goto label$5eb80ee_24_19;
	h3d_Engine_doFlushTarget(r0);
	label$5eb80ee_24_19:
	r11 = r0->driver;
	if( r11 == NULL ) hl_null_access();
	((void (*)(h3d__impl__Driver,int,int,int,int))r11->$type->vobj_proto[14])(r11,r5,r6,r7,r8);
	return;
}

bool h3d_Engine_render(h3d__Engine r0,vvirtual* r1) {
	bool r3;
	double r4, r5, r6, r7, r8;
	r3 = h3d_Engine_begin(r0);
	if( r3 ) goto label$5eb80ee_25_4;
	r3 = false;
	return r3;
	label$5eb80ee_25_4:
	if( r1 == NULL ) hl_null_access();
	if( hl_vfields(r1)[0] ) ((void (*)(vdynamic*,h3d__Engine))hl_vfields(r1)[0])(r1->value,r0); else {
		void *args[] = {r0};
		hl_dyn_call_obj(r1->value,&t$fun_d333c41,86600534/*render*/,args,NULL);
	}
	h3d_Engine_end(r0);
	r4 = hl_sys_time();
	r5 = r0->lastTime;
	r4 = r4 - r5;
	r5 = r0->lastTime;
	r5 = r5 + r4;
	r0->lastTime = r5;
	r6 = 0.;
	if( !(r6 < r4) ) goto label$5eb80ee_25_47;
	r5 = 1.;
	r5 = r5 / r4;
	r7 = r0->realFps;
	r8 = 2.;
	r7 = r7 * r8;
	if( !(r7 < r5) ) goto label$5eb80ee_25_26;
	r6 = r0->realFps;
	r7 = 2.;
	r6 = r6 * r7;
	r5 = r6;
	goto label$5eb80ee_25_34;
	label$5eb80ee_25_26:
	r7 = r0->realFps;
	r8 = 0.5;
	r7 = r7 * r8;
	if( !(r5 < r7) ) goto label$5eb80ee_25_34;
	r6 = r0->realFps;
	r7 = 0.5;
	r6 = r6 * r7;
	r5 = r6;
	label$5eb80ee_25_34:
	r7 = 0.5;
	r6 = r4 / r7;
	r8 = 0.29999999999999999;
	if( !(r8 < r6) ) goto label$5eb80ee_25_40;
	r7 = 0.29999999999999999;
	r6 = r7;
	label$5eb80ee_25_40:
	r7 = r0->realFps;
	r8 = 1.;
	r8 = r8 - r6;
	r7 = r7 * r8;
	r8 = r5 * r6;
	r7 = r7 + r8;
	r0->realFps = r7;
	label$5eb80ee_25_47:
	r3 = true;
	return r3;
}

void h3d_Engine_new(h3d__Engine r0) {
	haxe__ds__ObjectMap r2;
	venum *r14;
	bool r4;
	haxe__ds__IntMap r5;
	h3d__impl__GlDriver r17;
	hxd__Window r15;
	h3d__$Engine r13;
	h3d__Vector r6;
	double r16;
	vclosure *r1;
	int *r18;
	vdynamic *r12;
	double *r7, *r8, *r9, *r10;
	int r11;
	r1 = r0->onContextLost;
	if( r1 ) goto label$5eb80ee_26_4;
	r1 = hl_alloc_closure_ptr(&t$fun_9e7b219,h3d_Engine_onContextLost,r0);
	r0->onContextLost = r1;
	label$5eb80ee_26_4:
	r1 = r0->onReady;
	if( r1 ) goto label$5eb80ee_26_8;
	r1 = hl_alloc_closure_ptr(&t$fun_9e7b219,h3d_Engine_onReady,r0);
	r0->onReady = r1;
	label$5eb80ee_26_8:
	r1 = r0->onResized;
	if( r1 ) goto label$5eb80ee_26_12;
	r1 = hl_alloc_closure_ptr(&t$fun_9e7b219,h3d_Engine_onResized,r0);
	r0->onResized = r1;
	label$5eb80ee_26_12:
	r2 = (haxe__ds__ObjectMap)hl_alloc_obj(&t$haxe_ds_ObjectMap);
	haxe_ds_ObjectMap_new(r2);
	r0->resCache = r2;
	r4 = false;
	r0->ready = r4;
	r4 = false;
	r0->inRender = r4;
	r5 = (haxe__ds__IntMap)hl_alloc_obj(&t$haxe_ds_IntMap);
	haxe_ds_IntMap_new(r5);
	r0->textureColorCache = r5;
	r6 = (h3d__Vector)hl_alloc_obj(&t$h3d_Vector);
	r7 = NULL;
	r8 = NULL;
	r9 = NULL;
	r10 = NULL;
	h3d_Vector_new(r6,r7,r8,r9,r10);
	r0->tmpVector = r6;
	r11 = -16777216;
	r12 = hl_alloc_dynamic(&t$_i32);
	r12->v.i = r11;
	r0->backgroundColor = r12;
	r13 = (h3d__$Engine)g$_h3d_Engine;
	r4 = r13->SOFTWARE_DRIVER;
	r4 = !r4;
	r0->hardware = r4;
	r13 = (h3d__$Engine)g$_h3d_Engine;
	r11 = r13->ANTIALIASING;
	r0->antiAlias = r11;
	r4 = true;
	r0->autoResize = r4;
	r14 = (venum*)g$hxd_SystemValue_IsWindowed;
	r4 = hxd_System_getValue(r14);
	r4 = !r4;
	r4 = h3d_Engine_set_fullScreen(r0,r4);
	r15 = hxd_Window_getInstance();
	r0->window = r15;
	r16 = hxd_System_getDefaultFrameRate();
	r0->realFps = r16;
	r16 = hl_sys_time();
	r0->lastTime = r16;
	r15 = r0->window;
	if( r15 == NULL ) hl_null_access();
	r1 = hl_alloc_closure_ptr(&t$fun_9e7b219,h3d_Engine_onWindowResize,r0);
	hxd_Window_addResizeEvent(r15,r1);
	r17 = (h3d__impl__GlDriver)hl_alloc_obj(&t$h3d_impl_GlDriver);
	r11 = r0->antiAlias;
	r18 = &r11;
	h3d_impl_GlDriver_new(r17,r18);
	r0->driver = ((h3d__impl__Driver)r17);
	r13 = (h3d__$Engine)g$_h3d_Engine;
	r13->CURRENT = r0;
	return;
}

