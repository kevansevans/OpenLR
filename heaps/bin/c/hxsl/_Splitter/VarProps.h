﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_hxsl___Splitter__VarProps
#define INC_hxsl___Splitter__VarProps
typedef struct _hxsl___Splitter__$VarProps *hxsl___Splitter__$VarProps;
typedef struct _hxsl___Splitter__VarProps *hxsl___Splitter__VarProps;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <hxsl/VarKind.h>
#include <hl/types/ArrayObj.h>
#include <hxsl/Type.h>


struct _hxsl___Splitter__$VarProps {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
};
struct _hxsl___Splitter__VarProps {
	hl_type *$type;
	vvirtual* v;
	int read;
	int write;
	bool local;
	bool requireInit;
};
#endif
