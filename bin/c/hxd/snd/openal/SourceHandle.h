﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_hxd__snd__openal__SourceHandle
#define INC_hxd__snd__openal__SourceHandle
typedef struct _hxd__snd__openal__$SourceHandle *hxd__snd__openal__$SourceHandle;
typedef struct _hxd__snd__openal__SourceHandle *hxd__snd__openal__SourceHandle;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <hl/types/ArrayBytes_Int.h>
#include <haxe/ds/ObjectMap.h>


struct _hxd__snd__openal__$SourceHandle {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
};
struct _hxd__snd__openal__SourceHandle {
	hl_type *$type;
	int inst;
	int sampleOffset;
	bool playing;
	int nextAuxiliarySend;
	hl__types__ArrayBytes_Int freeAuxiliarySends;
	haxe__ds__ObjectMap effectToAuxiliarySend;
};
#endif
