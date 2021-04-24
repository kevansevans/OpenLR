﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_hxlr__lines__Floor
#define INC_hxlr__lines__Floor
typedef struct _hxlr__lines__$Floor *hxlr__lines__$Floor;
typedef struct _hxlr__lines__Floor *hxlr__lines__Floor;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <hxlr/lines/LineBase.h>
#include <hxlr/math/geom/Line.h>
#include <h2d/col/Point.h>
#include <hl/types/ArrayObj.h>


struct _hxlr__lines__$Floor {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
};
struct _hxlr__lines__Floor {
	hl_type *$type;
	h2d__col__Point start;
	h2d__col__Point end;
	vdynamic* id;
	int type;
	bool tangible;
	hl__types__ArrayObj keyList;
	h2d__col__Point gfxEnd;
	bool shifted;
	double dx;
	double dy;
	double C;
	double distance;
	double invSqrDistance;
	double invDistance;
	double nx;
	double ny;
	int zone;
	int limType;
	double limStart;
	double limEnd;
	double limValue;
};
#endif

