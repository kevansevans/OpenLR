﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <hxlr/rider/AirPoint.h>
void hxlr_rider_ContactPoint_new(hxlr__rider__ContactPoint,double*,double*,double*);
extern hl_type t$h2d_col_Point;
void h2d_col_Point_new(h2d__col__Point,double*,double*);

void hxlr_rider_AirPoint_new(hxlr__rider__AirPoint r0,double r1,double r2,double r3) {
	double r5, r7;
	double *r6, *r8, *r9;
	r5 = r1;
	r6 = &r5;
	r7 = r2;
	r8 = &r7;
	r9 = NULL;
	hxlr_rider_ContactPoint_new(((hxlr__rider__ContactPoint)r0),r6,r8,r9);
	r0->friction = r3;
	return;
}

void hxlr_rider_AirPoint_iterate(hxlr__rider__AirPoint r0,h2d__col__Point r1) {
	h2d__col__Point r2, r4, r6, r8, r11;
	double r5, r7, r12, r13, r14;
	double *r9, *r10;
	if( r1 ) goto label$b233109_2_3;
	r2 = r0->gravity;
	goto label$b233109_2_4;
	label$b233109_2_3:
	r2 = r1;
	label$b233109_2_4:
	r4 = r0->dir;
	if( r4 == NULL ) hl_null_access();
	r6 = r0->pos;
	if( r6 == NULL ) hl_null_access();
	r5 = r6->x;
	r6 = r0->vel;
	if( r6 == NULL ) hl_null_access();
	r7 = r6->x;
	r5 = r5 - r7;
	r7 = r0->friction;
	r5 = r5 * r7;
	if( r2 == NULL ) hl_null_access();
	r7 = r2->x;
	r5 = r5 + r7;
	r4->x = r5;
	r4 = r0->dir;
	if( r4 == NULL ) hl_null_access();
	r6 = r0->pos;
	if( r6 == NULL ) hl_null_access();
	r5 = r6->y;
	r6 = r0->vel;
	if( r6 == NULL ) hl_null_access();
	r7 = r6->y;
	r5 = r5 - r7;
	r7 = r0->friction;
	r5 = r5 * r7;
	r7 = r2->y;
	r5 = r5 + r7;
	r4->y = r5;
	r4 = r0->pos;
	r6 = (h2d__col__Point)hl_alloc_obj(&t$h2d_col_Point);
	if( r4 == NULL ) hl_null_access();
	r5 = r4->x;
	r9 = &r5;
	r7 = r4->y;
	r10 = &r7;
	h2d_col_Point_new(r6,r9,r10);
	r0->vel = r6;
	r6 = r0->pos;
	r8 = r0->dir;
	r11 = (h2d__col__Point)hl_alloc_obj(&t$h2d_col_Point);
	if( r6 == NULL ) hl_null_access();
	r12 = r6->x;
	if( r8 == NULL ) hl_null_access();
	r13 = r8->x;
	r12 = r12 + r13;
	r9 = &r12;
	r13 = r6->y;
	r14 = r8->y;
	r13 = r13 + r14;
	r10 = &r13;
	h2d_col_Point_new(r11,r9,r10);
	r0->pos = r11;
	return;
}

