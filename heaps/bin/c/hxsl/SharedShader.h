﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_hxsl__SharedShader
#define INC_hxsl__SharedShader
typedef struct _hxsl__$SharedShader *hxsl__$SharedShader;
typedef struct _hxsl__SharedShader *hxsl__SharedShader;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <hl/types/ArrayObj.h>
#include <hxsl/ShaderConst.h>
#include <haxe/ds/IntMap.h>


struct _hxsl__$SharedShader {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
	bool UNROLL_LOOPS;
};
struct _hxsl__SharedShader {
	hl_type *$type;
	vvirtual* data;
	hl__types__ArrayObj globals;
	hxsl__ShaderConst consts;
	haxe__ds__IntMap instanceCache;
	int paramsCount;
};
#endif
