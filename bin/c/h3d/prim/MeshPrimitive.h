﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_h3d__prim__MeshPrimitive
#define INC_h3d__prim__MeshPrimitive
typedef struct _h3d__prim__$MeshPrimitive *h3d__prim__$MeshPrimitive;
typedef struct _h3d__prim__MeshPrimitive *h3d__prim__MeshPrimitive;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <h3d/prim/Primitive.h>
#include <h3d/Buffer.h>
#include <h3d/Indexes.h>
#include <haxe/ds/IntMap.h>


struct _h3d__prim__$MeshPrimitive {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
};
struct _h3d__prim__MeshPrimitive {
	hl_type *$type;
	h3d__Buffer buffer;
	h3d__Indexes indexes;
	int refCount;
	vvirtual* f$3;
	haxe__ds__IntMap bufferCache;
	haxe__ds__IntMap layouts;
};
#endif

