﻿// Generated by HLC 4.1.4 (HL v5)
#ifndef INC_components__lines__LineGraphics
#define INC_components__lines__LineGraphics
typedef struct _components__lines__$LineGraphics *components__lines__$LineGraphics;
typedef struct _components__lines__LineGraphics *components__lines__LineGraphics;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <h2d/GraphicsContent.h>
#include <h3d/prim/Primitive.h>
#include <h3d/Buffer.h>
#include <h3d/Indexes.h>
#include <hl/types/ArrayBytes_hl_F32.h>
#include <hl/types/ArrayBytes_hl_UI16.h>
#include <hl/types/ArrayObj.h>


struct _components__lines__$LineGraphics {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
};
struct _components__lines__LineGraphics {
	hl_type *$type;
	h3d__Buffer buffer;
	h3d__Indexes indexes;
	int refCount;
	vvirtual* f$3;
	hl__types__ArrayBytes_hl_F32 tmp;
	hl__types__ArrayBytes_hl_UI16 index;
	hl__types__ArrayObj buffers;
	bool bufferDirty;
	bool indexDirty;
};
#endif
