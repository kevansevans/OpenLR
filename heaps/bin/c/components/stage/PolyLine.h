﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_components__stage__PolyLine
#define INC_components__stage__PolyLine
typedef struct _components__stage__$PolyLine *components__stage__$PolyLine;
typedef struct _components__stage__PolyLine *components__stage__PolyLine;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <h3d/prim/Polygon.h>
#include <h3d/prim/MeshPrimitive.h>
#include <h3d/prim/Primitive.h>
#include <h3d/Buffer.h>
#include <h3d/Indexes.h>
#include <haxe/ds/IntMap.h>
#include <hl/types/ArrayObj.h>
#include <hl/types/ArrayBytes_hl_UI16.h>


struct _components__stage__$PolyLine {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
};
struct _components__stage__PolyLine {
	hl_type *$type;
	h3d__Buffer buffer;
	h3d__Indexes indexes;
	int refCount;
	vvirtual* f$3;
	haxe__ds__IntMap bufferCache;
	haxe__ds__IntMap layouts;
	hl__types__ArrayObj points;
	hl__types__ArrayObj normals;
	hl__types__ArrayObj tangents;
	hl__types__ArrayObj uvs;
	hl__types__ArrayBytes_hl_UI16 idx;
	hl__types__ArrayObj colors;
	hl__types__ArrayObj locpoints;
};
#endif
