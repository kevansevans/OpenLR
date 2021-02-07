﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_hxd__fs__DummyConvert
#define INC_hxd__fs__DummyConvert
typedef struct _hxd__fs__$DummyConvert *hxd__fs__$DummyConvert;
typedef struct _hxd__fs__DummyConvert *hxd__fs__DummyConvert;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <hl/types/ArrayBytes_Int.h>
#include <hxd/fs/Convert.h>
#include <hl/types/ArrayObj.h>
#include <haxe/io/Bytes.h>


struct _hxd__fs__$DummyConvert {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
	hl__types__ArrayBytes_Int _;
};
struct _hxd__fs__DummyConvert {
	hl_type *$type;
	hl__types__ArrayObj sourceExts;
	String destExt;
	int version;
	vdynamic* params;
	String srcPath;
	String dstPath;
	String originalFilename;
	haxe__io__Bytes srcBytes;
};
#endif
