﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_hxlr__math__geom__Line
#define INC_hxlr__math__geom__Line
typedef struct _hxlr__math__geom__$Line *hxlr__math__geom__$Line;
typedef struct _hxlr__math__geom__Line *hxlr__math__geom__Line;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <h2d/col/Point.h>


struct _hxlr__math__geom__$Line {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
};
struct _hxlr__math__geom__Line {
	hl_type *$type;
	h2d__col__Point start;
	h2d__col__Point end;
};
#endif

