﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <hxlr/Constants.h>
extern hl_type t$vrt_1fee3e8;
extern hxlr__$Constants g$_hxlr_Constants;
extern hl_type t$_i32;
extern hl_type t$vrt_a46e643;
#include <hl/natives.h>
hl__types__ArrayObj hl_types_ArrayObj_alloc(varray*);
extern hl_type t$hl_types_ArrayObj;
extern hl_type t$vrt_c7fcfb4;
extern String s$STANDARD;
extern hl_type t$String;
extern hl_type t$_bool;
extern String s$REPELL;
extern hl_type t$vrt_c85b526;
hl__types__ArrayBytes_Int hl_types_ArrayBase_allocI32(vbyte*,int);
extern hl_type t$hl_types_ArrayBytes_Int;

vvirtual* hxlr_Constants_defaultRider() {
	String r9;
	hl__types__ArrayObj r4;
	vvirtual *r0, *r7, *r8, *r11;
	hl_type *r6;
	bool r10;
	hl__types__ArrayBytes_Int r12;
	hxlr__$Constants r2;
	double r1;
	vbyte *r13;
	varray *r5;
	int r3, r14, r15;
	r0 = hl_alloc_virtual(&t$vrt_1fee3e8);
	r1 = 0.5;
	if( hl_vfields(r0)[5] ) *(double*)(hl_vfields(r0)[5]) = (double)r1; else hl_dyn_setd(r0->value,416206873/*scale*/,r1);
	r2 = (hxlr__$Constants)g$_hxlr_Constants;
	r1 = r2->x_gravity;
	if( hl_vfields(r0)[8] ) *(double*)(hl_vfields(r0)[8]) = (double)r1; else hl_dyn_setd(r0->value,-229623737/*x_grav*/,r1);
	r2 = (hxlr__$Constants)g$_hxlr_Constants;
	r1 = r2->y_gravity;
	if( hl_vfields(r0)[10] ) *(double*)(hl_vfields(r0)[10]) = (double)r1; else hl_dyn_setd(r0->value,413898160/*y_grav*/,r1);
	r2 = (hxlr__$Constants)g$_hxlr_Constants;
	r1 = r2->x_velocity;
	if( hl_vfields(r0)[9] ) *(double*)(hl_vfields(r0)[9]) = (double)r1; else hl_dyn_setd(r0->value,389727456/*x_vel*/,r1);
	r2 = (hxlr__$Constants)g$_hxlr_Constants;
	r1 = r2->y_velocity;
	if( hl_vfields(r0)[11] ) *(double*)(hl_vfields(r0)[11]) = (double)r1; else hl_dyn_setd(r0->value,-358524841/*y_vel*/,r1);
	r3 = 4;
	if( hl_vfields(r0)[1] ) *(int*)(hl_vfields(r0)[1]) = (int)r3; else hl_dyn_seti(r0->value,-141802085/*camera*/,&t$_i32,r3);
	r6 = &t$vrt_a46e643;
	r3 = 10;
	r5 = hl_alloc_array(r6,r3);
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.80000000000000004;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 0;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = 10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 1;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 30;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = 10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 2;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 35;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 3;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 10;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.80000000000000004;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 4;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 10;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = -11;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.80000000000000004;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 5;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 23;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = -10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.10000000000000001;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 6;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 23;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = -10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.10000000000000001;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 7;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 20;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = 10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 8;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 20;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = 10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 9;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r4 = hl_types_ArrayObj_alloc(r5);
	if( hl_vfields(r0)[3] ) *(hl__types__ArrayObj*)(hl_vfields(r0)[3]) = (hl__types__ArrayObj)r4; else hl_dyn_setp(r0->value,205043939/*contactPoints*/,&t$hl_types_ArrayObj,r4);
	r6 = &t$vrt_a46e643;
	r3 = 6;
	r5 = hl_alloc_array(r6,r3);
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 7;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = -10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.90000000000000002;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 0;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 3;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = -10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.90000000000000002;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 1;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = 0;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = -10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.90000000000000002;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 2;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = -4;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = -10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.90000000000000002;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 3;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = -7;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = -10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.90000000000000002;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 4;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r7 = hl_alloc_virtual(&t$vrt_a46e643);
	r3 = -11;
	r1 = (double)r3;
	if( hl_vfields(r7)[1] ) *(double*)(hl_vfields(r7)[1]) = (double)r1; else hl_dyn_setd(r7->value,120/*x*/,r1);
	r3 = -10;
	r1 = (double)r3;
	if( hl_vfields(r7)[2] ) *(double*)(hl_vfields(r7)[2]) = (double)r1; else hl_dyn_setd(r7->value,121/*y*/,r1);
	r1 = 0.90000000000000002;
	if( hl_vfields(r7)[0] ) *(double*)(hl_vfields(r7)[0]) = (double)r1; else hl_dyn_setd(r7->value,22860/*fr*/,r1);
	r3 = 5;
	((vvirtual**)(r5 + 1))[r3] = r7;
	r4 = hl_types_ArrayObj_alloc(r5);
	if( hl_vfields(r0)[7] ) *(hl__types__ArrayObj*)(hl_vfields(r0)[7]) = (hl__types__ArrayObj)r4; else hl_dyn_setp(r0->value,66452823/*scarfPoints*/,&t$hl_types_ArrayObj,r4);
	r6 = &t$vrt_c7fcfb4;
	r3 = 22;
	r5 = hl_alloc_array(r6,r3);
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 0;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 1;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 0;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 1;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 2;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 1;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 2;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 3;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 2;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 3;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 0;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 3;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 0;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 2;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 4;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 3;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 1;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 5;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 0;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 4;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = true;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 6;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 1;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 4;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = true;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 7;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 2;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 4;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = true;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 8;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 5;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 4;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 9;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 5;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 6;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 10;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 5;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 7;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 11;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 4;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 8;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 12;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 4;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 9;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 13;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 5;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 7;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 14;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 5;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 0;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = true;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 15;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 3;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 6;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = true;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 16;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 3;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 7;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = true;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 17;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 8;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 2;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = true;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 18;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 9;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 2;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$STANDARD;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = true;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 19;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 5;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 8;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$REPELL;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 20;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r8 = hl_alloc_virtual(&t$vrt_c7fcfb4);
	r3 = 5;
	if( hl_vfields(r8)[0] ) *(int*)(hl_vfields(r8)[0]) = (int)r3; else hl_dyn_seti(r8->value,97/*a*/,&t$_i32,r3);
	r3 = 9;
	if( hl_vfields(r8)[1] ) *(int*)(hl_vfields(r8)[1]) = (int)r3; else hl_dyn_seti(r8->value,98/*b*/,&t$_i32,r3);
	r9 = (String)s$REPELL;
	if( hl_vfields(r8)[3] ) *(String*)(hl_vfields(r8)[3]) = (String)r9; else hl_dyn_setp(r8->value,218690500/*type*/,&t$String,r9);
	r10 = false;
	if( hl_vfields(r8)[2] ) *(bool*)(hl_vfields(r8)[2]) = (bool)r10; else hl_dyn_seti(r8->value,-359420671/*crashable*/,&t$_bool,r10);
	r3 = 21;
	((vvirtual**)(r5 + 1))[r3] = r8;
	r4 = hl_types_ArrayObj_alloc(r5);
	if( hl_vfields(r0)[0] ) *(hl__types__ArrayObj*)(hl_vfields(r0)[0]) = (hl__types__ArrayObj)r4; else hl_dyn_setp(r0->value,-151562331/*bones*/,&t$hl_types_ArrayObj,r4);
	r6 = &t$vrt_c85b526;
	r3 = 1;
	r5 = hl_alloc_array(r6,r3);
	r11 = hl_alloc_virtual(&t$vrt_c85b526);
	r3 = 3;
	if( hl_vfields(r11)[1] ) *(int*)(hl_vfields(r11)[1]) = (int)r3; else hl_dyn_seti(r11->value,287423612/*point_a*/,&t$_i32,r3);
	r3 = 0;
	if( hl_vfields(r11)[2] ) *(int*)(hl_vfields(r11)[2]) = (int)r3; else hl_dyn_seti(r11->value,287423613/*point_b*/,&t$_i32,r3);
	r3 = 1;
	if( hl_vfields(r11)[3] ) *(int*)(hl_vfields(r11)[3]) = (int)r3; else hl_dyn_seti(r11->value,287423614/*point_c*/,&t$_i32,r3);
	r3 = 0;
	if( hl_vfields(r11)[4] ) *(int*)(hl_vfields(r11)[4]) = (int)r3; else hl_dyn_seti(r11->value,287423615/*point_d*/,&t$_i32,r3);
	r3 = 0;
	if( hl_vfields(r11)[5] ) *(int*)(hl_vfields(r11)[5]) = (int)r3; else hl_dyn_seti(r11->value,346276912/*threshold*/,&t$_i32,r3);
	r10 = true;
	if( hl_vfields(r11)[0] ) *(bool*)(hl_vfields(r11)[0]) = (bool)r10; else hl_dyn_seti(r11->value,-214671526/*lessThan*/,&t$_bool,r10);
	r3 = 0;
	((vvirtual**)(r5 + 1))[r3] = r11;
	r4 = hl_types_ArrayObj_alloc(r5);
	if( hl_vfields(r0)[4] ) *(hl__types__ArrayObj*)(hl_vfields(r0)[4]) = (hl__types__ArrayObj)r4; else hl_dyn_setp(r0->value,-335924008/*limits*/,&t$hl_types_ArrayObj,r4);
	r3 = 5;
	if( hl_vfields(r0)[6] ) *(int*)(hl_vfields(r0)[6]) = (int)r3; else hl_dyn_seti(r0->value,-315022443/*scarfAnchor*/,&t$_i32,r3);
	r3 = 44;
	r13 = hl_alloc_bytes(r3);
	r3 = 0;
	r14 = 13763074;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 16777215;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 13763074;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 16777215;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 13763074;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 16777215;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 13763074;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 16777215;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 13763074;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 16777215;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r14 = 13763074;
	r15 = 2;
	r15 = r3 << r15;
	*(int*)(r13 + r15) = r14;
	++r3;
	r3 = 11;
	r12 = hl_types_ArrayBase_allocI32(r13,r3);
	if( hl_vfields(r0)[2] ) *(hl__types__ArrayBytes_Int*)(hl_vfields(r0)[2]) = (hl__types__ArrayBytes_Int)r12; else hl_dyn_setp(r0->value,-427375317/*colors*/,&t$hl_types_ArrayBytes_Int,r12);
	return r0;
}

