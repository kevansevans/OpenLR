﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <components/lines/Undefined.h>
extern hl_type t$_i32;
void components_lines_LineBase_new(components__lines__LineBase,h2d__col__Point,h2d__col__Point,bool,vdynamic*);
void h2d_Graphics_clear(h2d__Graphics);
#include <hl/natives.h>
void h2d_Graphics_lineStyle(h2d__Graphics,double*,int*,double*);
void h2d_Graphics_flush(h2d__Graphics);
void h2d_Graphics_addVertex(h2d__Graphics,double,double,double,double,double,double,double*,double*);
void h2d_Graphics_drawCircle(h2d__Graphics,double,double,double,int*);

void components_lines_Undefined_new(components__lines__Undefined r0,h2d__col__Point r1,h2d__col__Point r2,bool r3,vdynamic* r4) {
	int r5;
	if( r4 ) goto label$1ffcb4c_1_3;
	r5 = 0;
	r4 = hl_alloc_dynamic(&t$_i32);
	r4->v.i = r5;
	label$1ffcb4c_1_3:
	components_lines_LineBase_new(((components__lines__LineBase)r0),r1,r2,r3,r4);
	return;
}

void components_lines_Undefined_render(components__lines__Undefined r0) {
	h2d__Graphics r2;
	bool r3;
	h2d__col__Point r5;
	double r4, r6, r8, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24, r25;
	int *r10;
	double *r9, *r11;
	int r7, r26, r27;
	r2 = r0->colorLayer;
	if( r2 == NULL ) hl_null_access();
	h2d_Graphics_clear(r2);
	r2 = r0->colorLayer;
	if( r2 == NULL ) hl_null_access();
	r3 = true;
	r2->posChanged = r3;
	r5 = r0->start;
	if( r5 == NULL ) hl_null_access();
	r4 = r5->x;
	r2->x = r4;
	r2 = r0->colorLayer;
	if( r2 == NULL ) hl_null_access();
	r3 = true;
	r2->posChanged = r3;
	r5 = r0->start;
	if( r5 == NULL ) hl_null_access();
	r4 = r5->y;
	r2->y = r4;
	r4 = r0->nx;
	r6 = 0.;
	if( !(r6 < r4) ) goto label$1ffcb4c_2_26;
	r4 = r0->nx;
	r7 = hl_math_ceil(r4);
	r4 = (double)r7;
	goto label$1ffcb4c_2_29;
	label$1ffcb4c_2_26:
	r4 = r0->nx;
	r7 = hl_math_floor(r4);
	r4 = (double)r7;
	label$1ffcb4c_2_29:
	r6 = r0->ny;
	r8 = 0.;
	if( !(r8 < r6) ) goto label$1ffcb4c_2_36;
	r6 = r0->ny;
	r7 = hl_math_ceil(r6);
	r6 = (double)r7;
	goto label$1ffcb4c_2_39;
	label$1ffcb4c_2_36:
	r6 = r0->ny;
	r7 = hl_math_floor(r6);
	r6 = (double)r7;
	label$1ffcb4c_2_39:
	r2 = r0->colorLayer;
	if( r2 == NULL ) hl_null_access();
	r7 = 2;
	r8 = (double)r7;
	r9 = &r8;
	r7 = 16711680;
	r10 = &r7;
	r11 = NULL;
	h2d_Graphics_lineStyle(r2,r9,r10,r11);
	r2 = r0->colorLayer;
	if( r2 == NULL ) hl_null_access();
	h2d_Graphics_flush(r2);
	r12 = 0.;
	r13 = 0.;
	r14 = r2->curR;
	r15 = r2->curG;
	r16 = r2->curB;
	r17 = r2->curA;
	r18 = 0.;
	r19 = r2->ma;
	r18 = r18 * r19;
	r19 = 0.;
	r20 = r2->mc;
	r19 = r19 * r20;
	r18 = r18 + r19;
	r19 = r2->mx;
	r18 = r18 + r19;
	r9 = &r18;
	r19 = 0.;
	r20 = r2->mb;
	r19 = r19 * r20;
	r20 = 0.;
	r21 = r2->md;
	r20 = r20 * r21;
	r19 = r19 + r20;
	r20 = r2->my;
	r19 = r19 + r20;
	r11 = &r19;
	h2d_Graphics_addVertex(r2,r12,r13,r14,r15,r16,r17,r9,r11);
	r2 = r0->colorLayer;
	r5 = r0->gfxEnd;
	if( r5 == NULL ) hl_null_access();
	r12 = r5->x;
	r5 = r0->gfxEnd;
	if( r5 == NULL ) hl_null_access();
	r13 = r5->y;
	if( r2 == NULL ) hl_null_access();
	r16 = r2->curR;
	r17 = r2->curG;
	r20 = r2->curB;
	r21 = r2->curA;
	r23 = r2->ma;
	r22 = r12 * r23;
	r24 = r2->mc;
	r23 = r13 * r24;
	r22 = r22 + r23;
	r23 = r2->mx;
	r22 = r22 + r23;
	r9 = &r22;
	r24 = r2->mb;
	r23 = r12 * r24;
	r25 = r2->md;
	r24 = r13 * r25;
	r23 = r23 + r24;
	r24 = r2->my;
	r23 = r23 + r24;
	r11 = &r23;
	h2d_Graphics_addVertex(r2,r12,r13,r16,r17,r20,r21,r9,r11);
	r2 = r0->colorLayer;
	if( r2 == NULL ) hl_null_access();
	r12 = 0.;
	r13 = 0.;
	r14 = r0->lineCapRadius;
	r26 = r0->lineCapSegment;
	r10 = &r26;
	h2d_Graphics_drawCircle(r2,r12,r13,r14,r10);
	r2 = r0->colorLayer;
	if( r2 == NULL ) hl_null_access();
	r5 = r0->gfxEnd;
	if( r5 == NULL ) hl_null_access();
	r12 = r5->x;
	r5 = r0->gfxEnd;
	if( r5 == NULL ) hl_null_access();
	r13 = r5->y;
	r14 = r0->lineCapRadius;
	r27 = r0->lineCapSegment;
	r10 = &r27;
	h2d_Graphics_drawCircle(r2,r12,r13,r14,r10);
	return;
}

