﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_format__mp3__Reader
#define INC_format__mp3__Reader
typedef struct _format__mp3__$Reader *format__mp3__$Reader;
typedef struct _format__mp3__Reader *format__mp3__Reader;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <haxe/io/Input.h>
#include <format/tools/BitsInput.h>
#include <haxe/io/Bytes.h>


struct _format__mp3__$Reader {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
};
struct _format__mp3__Reader {
	hl_type *$type;
	haxe__io__Input i;
	format__tools__BitsInput bits;
	int samples;
	int sampleSize;
	bool any_read;
	haxe__io__Bytes id3v2_data;
	int id3v2_version;
	int id3v2_flags;
};
#endif
