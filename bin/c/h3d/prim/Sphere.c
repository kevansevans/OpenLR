﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <h3d/prim/Sphere.h>
#include <_std/Math.h>
#include <h3d/col/Point.h>
extern $Math g$_Math;
extern hl_type t$h3d_col_Point;
#include <hl/natives.h>
hl__types__ArrayObj hl_types_ArrayObj_alloc(varray*);
extern hl_type t$hl_types_ArrayBytes_hl_UI16;
void hl_types_ArrayBytes_hl_UI16_new(hl__types__ArrayBytes_hl_UI16);
void hl_types_ArrayBytes_hl_UI16___expand(hl__types__ArrayBytes_hl_UI16,int);
void h3d_col_Point_new(h3d__col__Point,double*,double*,double*);
int hl_types_ArrayObj_push(hl__types__ArrayObj,vdynamic*);
int hl_types_ArrayBytes_hl_UI16_push(hl__types__ArrayBytes_hl_UI16,unsigned short);
void h3d_prim_Polygon_new(h3d__prim__Polygon,hl__types__ArrayObj,hl__types__ArrayBytes_hl_UI16);

void h3d_prim_Sphere_new(h3d__prim__Sphere r0,double* r1,int* r2,int* r3) {
	hl__types__ArrayObj r12;
	hl_type *r14;
	hl__types__ArrayBytes_hl_UI16 r15, r18;
	$Math r9;
	unsigned short r19;
	h3d__col__Point r35;
	double r4, r7, r10, r25, r26, r27, r31, r32, r33, r36, r37, r39;
	double *r38, *r40;
	vbyte *r21;
	varray *r13;
	int r5, r6, r8, r16, r17, r20, r22, r23, r24, r28, r29, r30, r34, r41, r42, r43, r44, r45;
	if( r1 ) goto label$38f8a4c_1_3;
	r4 = 1.;
	goto label$38f8a4c_1_4;
	label$38f8a4c_1_3:
	r4 = *r1;
	label$38f8a4c_1_4:
	if( r2 ) goto label$38f8a4c_1_7;
	r5 = 8;
	goto label$38f8a4c_1_8;
	label$38f8a4c_1_7:
	r5 = *r2;
	label$38f8a4c_1_8:
	if( r3 ) goto label$38f8a4c_1_11;
	r6 = 6;
	goto label$38f8a4c_1_12;
	label$38f8a4c_1_11:
	r6 = *r3;
	label$38f8a4c_1_12:
	r0->ray = r4;
	r0->segsH = r6;
	r0->segsW = r5;
	r9 = ($Math)g$_Math;
	r7 = r9->PI;
	r10 = 2.;
	r7 = r7 * r10;
	r10 = (double)r5;
	r7 = r7 / r10;
	r14 = &t$h3d_col_Point;
	r8 = 0;
	r13 = hl_alloc_array(r14,r8);
	r12 = hl_types_ArrayObj_alloc(r13);
	r8 = 0;
	r15 = (hl__types__ArrayBytes_hl_UI16)hl_alloc_obj(&t$hl_types_ArrayBytes_hl_UI16);
	hl_types_ArrayBytes_hl_UI16_new(r15);
	r17 = 0;
	if( r17 >= r8 ) goto label$38f8a4c_1_44;
	r17 = r15->length;
	if( r17 >= r8 ) goto label$38f8a4c_1_44;
	r17 = 1;
	r16 = r8 - r17;
	r17 = 0;
	r19 = (int)r17;
	r17 = (int)r19;
	r20 = r15->length;
	if( ((unsigned)r16) < ((unsigned)r20) ) goto label$38f8a4c_1_40;
	hl_types_ArrayBytes_hl_UI16___expand(r15,r16);
	label$38f8a4c_1_40:
	r21 = r15->bytes;
	r20 = 1;
	r20 = r16 << r20;
	*(unsigned short*)(r21 + r20) = (unsigned short)r17;
	label$38f8a4c_1_44:
	r18 = r15;
	r16 = 1;
	r20 = 1;
	r17 = r5 + r20;
	r20 = 0;
	r23 = 1;
	r22 = r6 + r23;
	label$38f8a4c_1_51:
	if( r20 >= r22 ) goto label$38f8a4c_1_89;
	r23 = r20;
	++r20;
	r10 = (double)r23;
	r25 = (double)r6;
	r10 = r10 / r25;
	r9 = ($Math)g$_Math;
	r25 = r9->PI;
	r10 = r10 * r25;
	r25 = hl_math_sin(r10);
	r26 = hl_math_cos(r10);
	r27 = 0.;
	r24 = 0;
	r29 = 1;
	r28 = r5 + r29;
	label$38f8a4c_1_67:
	if( r24 >= r28 ) goto label$38f8a4c_1_88;
	++r24;
	r32 = hl_math_cos(r27);
	r31 = r25 * r32;
	r33 = hl_math_sin(r27);
	r32 = r25 * r33;
	if( r12 == NULL ) hl_null_access();
	r30 = r12->length;
	r35 = (h3d__col__Point)hl_alloc_obj(&t$h3d_col_Point);
	r33 = r31 * r4;
	r1 = &r33;
	r36 = r32 * r4;
	r38 = &r36;
	r37 = r26 * r4;
	r40 = &r37;
	h3d_col_Point_new(r35,r1,r38,r40);
	r34 = hl_types_ArrayObj_push(r12,((vdynamic*)r35));
	r39 = r27 + r7;
	r27 = r39;
	goto label$38f8a4c_1_67;
	label$38f8a4c_1_88:
	goto label$38f8a4c_1_51;
	label$38f8a4c_1_89:
	r20 = 0;
	r22 = r6;
	label$38f8a4c_1_91:
	if( r20 >= r22 ) goto label$38f8a4c_1_146;
	r23 = r20;
	++r20;
	r24 = 0;
	r28 = r5;
	label$38f8a4c_1_97:
	if( r24 >= r28 ) goto label$38f8a4c_1_145;
	r29 = r24;
	++r24;
	r34 = 1;
	r30 = r29 + r34;
	r42 = 1;
	r41 = r5 + r42;
	r34 = r23 * r41;
	r30 = r30 + r34;
	r43 = 1;
	r42 = r5 + r43;
	r41 = r23 * r42;
	r34 = r29 + r41;
	r43 = 1;
	r42 = r23 + r43;
	r44 = 1;
	r43 = r5 + r44;
	r42 = r42 * r43;
	r41 = r29 + r42;
	r43 = 1;
	r42 = r29 + r43;
	r44 = 1;
	r43 = r23 + r44;
	r45 = 1;
	r44 = r5 + r45;
	r43 = r43 * r44;
	r42 = r42 + r43;
	r44 = 0;
	if( r23 == r44 ) goto label$38f8a4c_1_134;
	if( r18 == NULL ) hl_null_access();
	r19 = (int)r30;
	r43 = hl_types_ArrayBytes_hl_UI16_push(r18,r19);
	r19 = (int)r34;
	r43 = hl_types_ArrayBytes_hl_UI16_push(r18,r19);
	r19 = (int)r42;
	r43 = hl_types_ArrayBytes_hl_UI16_push(r18,r19);
	label$38f8a4c_1_134:
	r45 = 1;
	r44 = r6 - r45;
	if( r23 == r44 ) goto label$38f8a4c_1_144;
	if( r18 == NULL ) hl_null_access();
	r19 = (int)r34;
	r43 = hl_types_ArrayBytes_hl_UI16_push(r18,r19);
	r19 = (int)r41;
	r43 = hl_types_ArrayBytes_hl_UI16_push(r18,r19);
	r19 = (int)r42;
	r43 = hl_types_ArrayBytes_hl_UI16_push(r18,r19);
	label$38f8a4c_1_144:
	goto label$38f8a4c_1_97;
	label$38f8a4c_1_145:
	goto label$38f8a4c_1_91;
	label$38f8a4c_1_146:
	h3d_prim_Polygon_new(((h3d__prim__Polygon)r0),r12,r18);
	return;
}

