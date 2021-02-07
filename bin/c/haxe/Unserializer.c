﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <haxe/Unserializer.h>
extern hl_type t$hl_types_ArrayBytes_Int;
void hl_types_ArrayBytes_Int_new(hl__types__ArrayBytes_Int);
extern haxe__$Unserializer g$_haxe_Unserializer;
void hl_types_ArrayBytes_Int___expand(hl__types__ArrayBytes_Int,int);
#include <haxe/_Unserializer/DefaultResolver.h>
extern hl_type t$hl_types_ArrayObj;
void hl_types_ArrayObj_new(hl__types__ArrayObj);
extern hl_type t$hl_types_ArrayDyn;
void hl_types_ArrayDyn_new(hl__types__ArrayDyn);
extern hl_type t$haxe__Unserializer_DefaultResolver;
void haxe__Unserializer_DefaultResolver_new(haxe___Unserializer__DefaultResolver);
extern hl_type t$vrt_6c65511;
extern hl_type t$_i32;
String String_substr(String,int,vdynamic*);
double Std_parseFloat(String);
#include <_std/String.h>
extern String s$Invalid_object;
vdynamic* haxe_Exception_thrown(vdynamic*);
vdynamic* haxe_Unserializer_unserialize(haxe__Unserializer);
extern $String g$_String;
bool Std_isOfType(vdynamic*,vdynamic*);
extern String s$Invalid_object_key;
extern hl_type t$String;
extern hl_type t$_dyn;
void Reflect_setField(vdynamic*,String,vdynamic*);
extern String s$Invalid_enum_format;
vdynamic* Type_createEnum(hl__BaseType,String,hl__types__ArrayDyn);
int hl_types_ArrayDyn_push(hl__types__ArrayDyn,vdynamic*);
#include <haxe/ds/ObjectMap.h>
#include <haxe/ds/StringMap.h>
#include <_std/Math.h>
#include <haxe/ds/List.h>
#include <haxe/ds/IntMap.h>
#include <haxe/io/Bytes.h>
#include <_std/Date.h>
extern hl_type t$fun_ed91dde;
extern String s$Class_not_found_;
String String___add__(String,String);
extern hl_type t$fun_03ea481;
extern String s$Enum_not_found_;
vdynamic* Type_createEmptyInstance(hl__Class);
extern String s$Invalid_custom_data;
extern hl_type t$haxe_ds_ObjectMap;
void haxe_ds_ObjectMap_new(haxe__ds__ObjectMap);
void haxe_ds_ObjectMap_set(haxe__ds__ObjectMap,vdynamic*,vdynamic*);
extern String s$Invalid_string_reference;
int hl_types_ArrayDyn_get_length(hl__types__ArrayDyn);
extern hl_type t$haxe_ds_StringMap;
void haxe_ds_StringMap_new(haxe__ds__StringMap);
void haxe_ds_StringMap_set(haxe__ds__StringMap,String,vdynamic*);
extern hl_type t$_f64;
hl__types__ArrayObj Type_getEnumConstructs(hl__BaseType);
extern String s$Unknown_enum_index_;
extern String s$518ed29;
#include <hl/natives.h>
String String___alloc__(vbyte*,int);
extern $Math g$_Math;
extern hl_type t$haxe_ds_List;
void haxe_ds_List_new(haxe__ds__List);
void haxe_ds_List_add(haxe__ds__List,vdynamic*);
extern hl_type t$haxe_ds_IntMap;
void haxe_ds_IntMap_new(haxe__ds__IntMap);
void haxe_ds_IntMap_set(haxe__ds__IntMap,int,vdynamic*);
extern String s$Invalid_IntMap_format;
extern String s$Invalid_reference;
extern String s$Invalid_bytes_length;
haxe__io__Bytes haxe_io_Bytes_alloc(int);
void haxe_io_Bytes_set(haxe__io__Bytes,int,int);
Date Date_fromString(String);
Date Date_fromTime(double);
extern String s$Invalid_string_length;
int hl_types_ArrayObj_push(hl__types__ArrayObj,vdynamic*);
extern String s$Invalid_char_;
String String_charAt(String,int);
extern String s$_at_position_;
extern hl_type t$haxe_Unserializer;

hl__types__ArrayBytes_Int haxe_Unserializer_initCodes() {
	String r4;
	hl__types__ArrayBytes_Int r0;
	haxe__$Unserializer r5;
	vbyte *r8, *r9;
	int r2, r3, r6, r7, r10, r11;
	r0 = (hl__types__ArrayBytes_Int)hl_alloc_obj(&t$hl_types_ArrayBytes_Int);
	hl_types_ArrayBytes_Int_new(r0);
	r2 = 0;
	r5 = (haxe__$Unserializer)g$_haxe_Unserializer;
	r4 = r5->BASE64;
	if( r4 == NULL ) hl_null_access();
	r3 = r4->length;
	label$2789538_1_7:
	if( r2 >= r3 ) goto label$2789538_1_27;
	r6 = r2;
	++r2;
	r5 = (haxe__$Unserializer)g$_haxe_Unserializer;
	r4 = r5->BASE64;
	if( r4 == NULL ) hl_null_access();
	r8 = r4->bytes;
	if( r0 == NULL ) hl_null_access();
	r10 = 1;
	r7 = r6 << r10;
	r7 = *(unsigned short*)(r8 + r7);
	r11 = r0->length;
	if( ((unsigned)r7) < ((unsigned)r11) ) goto label$2789538_1_22;
	hl_types_ArrayBytes_Int___expand(r0,r7);
	label$2789538_1_22:
	r9 = r0->bytes;
	r11 = 2;
	r11 = r7 << r11;
	*(int*)(r9 + r11) = r6;
	goto label$2789538_1_7;
	label$2789538_1_27:
	return r0;
}

void haxe_Unserializer_new(haxe__Unserializer r0,String r1) {
	vvirtual *r6, *r8;
	hl__types__ArrayObj r3;
	haxe___Unserializer__DefaultResolver r9;
	haxe__$Unserializer r7;
	hl__types__ArrayDyn r5;
	int r2;
	r0->buf = r1;
	if( r1 == NULL ) hl_null_access();
	r2 = r1->length;
	r0->length = r2;
	r2 = 0;
	r0->pos = r2;
	r3 = (hl__types__ArrayObj)hl_alloc_obj(&t$hl_types_ArrayObj);
	hl_types_ArrayObj_new(r3);
	r0->scache = r3;
	r5 = (hl__types__ArrayDyn)hl_alloc_obj(&t$hl_types_ArrayDyn);
	hl_types_ArrayDyn_new(r5);
	r0->cache = r5;
	r7 = (haxe__$Unserializer)g$_haxe_Unserializer;
	r6 = r7->DEFAULT_RESOLVER;
	if( r6 ) goto label$2789538_2_21;
	r9 = (haxe___Unserializer__DefaultResolver)hl_alloc_obj(&t$haxe__Unserializer_DefaultResolver);
	haxe__Unserializer_DefaultResolver_new(r9);
	r8 = hl_to_virtual(&t$vrt_6c65511,(vdynamic*)r9);
	r6 = r8;
	r7 = (haxe__$Unserializer)g$_haxe_Unserializer;
	r7->DEFAULT_RESOLVER = r8;
	label$2789538_2_21:
	r0->resolver = r6;
	return;
}

int haxe_Unserializer_readDigits(haxe__Unserializer r0) {
	String r7;
	bool r2, r4;
	vbyte *r6;
	int r1, r3, r5, r8, r9, r10, r11;
	r1 = 0;
	r2 = false;
	r3 = r0->pos;
	label$2789538_3_3:
	r4 = true;
	if( !r4 ) goto label$2789538_3_42;
	r5 = r0->pos;
	r7 = r0->buf;
	if( r7 == NULL ) hl_null_access();
	r6 = r7->bytes;
	r9 = 1;
	r8 = r5 << r9;
	r8 = *(unsigned short*)(r6 + r8);
	r10 = 0;
	if( r8 != r10 ) goto label$2789538_3_16;
	goto label$2789538_3_42;
	label$2789538_3_16:
	r10 = 45;
	if( r8 != r10 ) goto label$2789538_3_27;
	r9 = r0->pos;
	if( r9 == r3 ) goto label$2789538_3_21;
	goto label$2789538_3_42;
	label$2789538_3_21:
	r4 = true;
	r2 = r4;
	r9 = r0->pos;
	++r9;
	r0->pos = r9;
	goto label$2789538_3_3;
	label$2789538_3_27:
	r10 = 48;
	if( r8 < r10 ) goto label$2789538_3_31;
	r10 = 57;
	if( r10 >= r8 ) goto label$2789538_3_32;
	label$2789538_3_31:
	goto label$2789538_3_42;
	label$2789538_3_32:
	r10 = 10;
	r9 = r1 * r10;
	r11 = 48;
	r10 = r8 - r11;
	r9 = r9 + r10;
	r1 = r9;
	r9 = r0->pos;
	++r9;
	r0->pos = r9;
	goto label$2789538_3_3;
	label$2789538_3_42:
	if( !r2 ) goto label$2789538_3_46;
	r8 = -1;
	r5 = r1 * r8;
	r1 = r5;
	label$2789538_3_46:
	return r1;
}

double haxe_Unserializer_readFloat(haxe__Unserializer r0) {
	String r5;
	bool r2;
	double r9;
	vdynamic *r10;
	vbyte *r4;
	int r1, r3, r6, r7, r8;
	r1 = r0->pos;
	label$2789538_4_1:
	r2 = true;
	if( !r2 ) goto label$2789538_4_28;
	r3 = r0->pos;
	r5 = r0->buf;
	if( r5 == NULL ) hl_null_access();
	r4 = r5->bytes;
	r7 = 1;
	r6 = r3 << r7;
	r6 = *(unsigned short*)(r4 + r6);
	r8 = 0;
	if( r6 != r8 ) goto label$2789538_4_14;
	goto label$2789538_4_28;
	label$2789538_4_14:
	r8 = 43;
	if( r6 < r8 ) goto label$2789538_4_18;
	r8 = 58;
	if( r6 < r8 ) goto label$2789538_4_22;
	label$2789538_4_18:
	r8 = 101;
	if( r6 == r8 ) goto label$2789538_4_22;
	r8 = 69;
	if( r6 != r8 ) goto label$2789538_4_26;
	label$2789538_4_22:
	r7 = r0->pos;
	++r7;
	r0->pos = r7;
	goto label$2789538_4_27;
	label$2789538_4_26:
	goto label$2789538_4_28;
	label$2789538_4_27:
	goto label$2789538_4_1;
	label$2789538_4_28:
	r5 = r0->buf;
	if( r5 == NULL ) hl_null_access();
	r6 = r0->pos;
	r6 = r6 - r1;
	r10 = hl_alloc_dynamic(&t$_i32);
	r10->v.i = r6;
	r5 = String_substr(r5,r1,r10);
	r9 = Std_parseFloat(r5);
	return r9;
}

void haxe_Unserializer_unserializeObject(haxe__Unserializer r0,vdynamic* r1) {
	$String r11;
	String r7;
	bool r2;
	vdynamic *r6, *r10;
	vbyte *r8;
	int r4, r5, r9;
	label$2789538_5_0:
	r2 = true;
	if( !r2 ) goto label$2789538_5_30;
	r4 = r0->pos;
	r5 = r0->length;
	if( r4 < r5 ) goto label$2789538_5_9;
	r7 = (String)s$Invalid_object;
	r6 = haxe_Exception_thrown(((vdynamic*)r7));
	hl_throw((vdynamic*)r6);
	label$2789538_5_9:
	r4 = r0->pos;
	r7 = r0->buf;
	if( r7 == NULL ) hl_null_access();
	r8 = r7->bytes;
	r9 = 1;
	r5 = r4 << r9;
	r5 = *(unsigned short*)(r8 + r5);
	r9 = 103;
	if( r5 != r9 ) goto label$2789538_5_19;
	goto label$2789538_5_30;
	label$2789538_5_19:
	r6 = haxe_Unserializer_unserialize(r0);
	r11 = ($String)g$_String;
	r2 = Std_isOfType(r6,((vdynamic*)r11));
	if( r2 ) goto label$2789538_5_26;
	r7 = (String)s$Invalid_object_key;
	r10 = haxe_Exception_thrown(((vdynamic*)r7));
	hl_throw((vdynamic*)r10);
	label$2789538_5_26:
	r10 = haxe_Unserializer_unserialize(r0);
	r7 = (String)hl_dyn_castp(&r6,&t$_dyn,&t$String);
	Reflect_setField(r1,r7,r10);
	goto label$2789538_5_0;
	label$2789538_5_30:
	r4 = r0->pos;
	++r4;
	r0->pos = r4;
	return;
}

vdynamic* haxe_Unserializer_unserializeEnum(haxe__Unserializer r0,hl__BaseType r1,String r2) {
	String r7;
	hl__types__ArrayDyn r11;
	vdynamic *r9;
	vbyte *r6;
	int r3, r4, r8, r10;
	r3 = r0->pos;
	r4 = r3;
	++r3;
	r0->pos = r3;
	r7 = r0->buf;
	if( r7 == NULL ) hl_null_access();
	r6 = r7->bytes;
	r8 = 1;
	r4 = r4 << r8;
	r4 = *(unsigned short*)(r6 + r4);
	r8 = 58;
	if( r4 == r8 ) goto label$2789538_6_15;
	r7 = (String)s$Invalid_enum_format;
	r9 = haxe_Exception_thrown(((vdynamic*)r7));
	hl_throw((vdynamic*)r9);
	label$2789538_6_15:
	r4 = haxe_Unserializer_readDigits(r0);
	r10 = 0;
	if( r4 != r10 ) goto label$2789538_6_21;
	r11 = NULL;
	r9 = Type_createEnum(r1,r2,r11);
	return r9;
	label$2789538_6_21:
	r11 = (hl__types__ArrayDyn)hl_alloc_obj(&t$hl_types_ArrayDyn);
	hl_types_ArrayDyn_new(r11);
	label$2789538_6_23:
	r8 = r4;
	--r4;
	r10 = 0;
	if( r10 >= r8 ) goto label$2789538_6_32;
	if( r11 == NULL ) hl_null_access();
	r9 = haxe_Unserializer_unserialize(r0);
	r8 = hl_types_ArrayDyn_push(r11,r9);
	goto label$2789538_6_23;
	label$2789538_6_32:
	r9 = Type_createEnum(r1,r2,r11);
	return r9;
}

vdynamic* haxe_Unserializer_unserialize(haxe__Unserializer r0) {
	vdynobj *r32;
	hl__BaseType r13;
	String r5, r11, r12, r28;
	haxe__ds__ObjectMap r18;
	hl__Class r9;
	Date r63;
	haxe__ds__StringMap r26;
	hl__types__ArrayObj r21;
	vvirtual *r10;
	haxe__io__Bytes r41;
	bool r19, r55, r56, r57, r58, r59, r60, r61, r62;
	haxe__ds__IntMap r33;
	hl__types__ArrayBytes_Int r36, r38;
	$Math r30;
	haxe__$Unserializer r37;
	haxe__ds__List r31;
	double r27;
	hl__types__ArrayDyn r14, r23;
	int *r29;
	vdynamic *r8, *r15, *r20, *r64;
	varray *r22;
	vbyte *r4, *r6, *r16, *r34, *r44, *r50, *r53;
	int r1, r2, r7, r17, r24, r25, r35, r39, r40, r42, r43, r45, r46, r47, r48, r49, r51, r52, r54;
	r1 = r0->pos;
	r2 = r1;
	++r1;
	r0->pos = r1;
	r5 = r0->buf;
	if( r5 == NULL ) hl_null_access();
	r4 = r5->bytes;
	r7 = 1;
	r2 = r2 << r7;
	r2 = *(unsigned short*)(r4 + r2);
	switch(r2) {
		default:
		case 0:
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
		case 10:
		case 11:
		case 12:
		case 13:
		case 14:
		case 15:
		case 16:
		case 17:
		case 18:
		case 19:
		case 20:
		case 21:
		case 22:
		case 23:
		case 24:
		case 25:
		case 26:
		case 27:
		case 28:
		case 29:
		case 30:
		case 31:
		case 32:
		case 33:
		case 34:
		case 35:
		case 36:
		case 37:
		case 38:
		case 39:
		case 40:
		case 41:
		case 42:
		case 43:
		case 44:
		case 45:
		case 46:
		case 47:
		case 48:
		case 49:
		case 50:
		case 51:
		case 52:
		case 53:
		case 54:
		case 55:
		case 56:
		case 57:
		case 58:
		case 59:
		case 60:
		case 61:
		case 62:
		case 63:
		case 64:
		case 68:
		case 69:
		case 70:
		case 71:
		case 72:
		case 73:
		case 74:
		case 75:
		case 76:
		case 78:
		case 79:
		case 80:
		case 81:
		case 83:
		case 84:
		case 85:
		case 86:
		case 87:
		case 88:
		case 89:
		case 90:
		case 91:
		case 92:
		case 93:
		case 94:
		case 95:
		case 96:
		case 101:
		case 103:
		case 104:
		case 117:
			goto label$2789538_7_782;
		case 65:
			r8 = haxe_Unserializer_unserialize(r0);
			r5 = (String)hl_dyn_castp(&r8,&t$_dyn,&t$String);
			r10 = r0->resolver;
			if( r10 == NULL ) hl_null_access();
			if( hl_vfields(r10)[0] ) r9 = ((hl__Class (*)(vdynamic*,String))hl_vfields(r10)[0])(r10->value,r5); else {
				void *args[] = {r5};
				r9 = (hl__Class)hl_dyn_call_obj(r10->value,&t$fun_ed91dde,-522339299/*resolveClass*/,args,NULL);
			}
			if( r9 ) goto label$2789538_7_22;
			r11 = (String)s$Class_not_found_;
			r11 = String___add__(r11,r5);
			r8 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r8);
			label$2789538_7_22:
			return ((vdynamic*)r9);
		case 66:
			r8 = haxe_Unserializer_unserialize(r0);
			r5 = (String)hl_dyn_castp(&r8,&t$_dyn,&t$String);
			r10 = r0->resolver;
			if( r10 == NULL ) hl_null_access();
			if( hl_vfields(r10)[1] ) r13 = ((hl__BaseType (*)(vdynamic*,String))hl_vfields(r10)[1])(r10->value,r5); else {
				void *args[] = {r5};
				r13 = (hl__BaseType)hl_dyn_call_obj(r10->value,&t$fun_03ea481,-28209272/*resolveEnum*/,args,NULL);
			}
			if( r13 ) goto label$2789538_7_33;
			r11 = (String)s$Enum_not_found_;
			r11 = String___add__(r11,r5);
			r8 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r8);
			label$2789538_7_33:
			return ((vdynamic*)r13);
		case 67:
			r8 = haxe_Unserializer_unserialize(r0);
			r5 = (String)hl_dyn_castp(&r8,&t$_dyn,&t$String);
			r10 = r0->resolver;
			if( r10 == NULL ) hl_null_access();
			if( hl_vfields(r10)[0] ) r9 = ((hl__Class (*)(vdynamic*,String))hl_vfields(r10)[0])(r10->value,r5); else {
				void *args[] = {r5};
				r9 = (hl__Class)hl_dyn_call_obj(r10->value,&t$fun_ed91dde,-522339299/*resolveClass*/,args,NULL);
			}
			if( r9 ) goto label$2789538_7_44;
			r11 = (String)s$Class_not_found_;
			r11 = String___add__(r11,r5);
			r8 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r8);
			label$2789538_7_44:
			r8 = Type_createEmptyInstance(r9);
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r2 = hl_types_ArrayDyn_push(r14,r8);
			if( r8 == NULL ) hl_null_access();
			r15 = (vdynamic*)hl_dyn_getp((vdynamic*)r8,-424027736/*hxUnserialize*/,&t$_dyn);
			if( r15 == NULL ) hl_null_access();
			{
				vdynamic *args[] = {(vdynamic*)r0};
				r15 = (vdynamic*)hl_dyn_call((vclosure*)r15,args,1);
			}
			r2 = r0->pos;
			r7 = r2;
			++r2;
			r0->pos = r2;
			r11 = r0->buf;
			if( r11 == NULL ) hl_null_access();
			r6 = r11->bytes;
			r17 = 1;
			r7 = r7 << r17;
			r7 = *(unsigned short*)(r6 + r7);
			r17 = 103;
			if( r7 == r17 ) goto label$2789538_7_67;
			r11 = (String)s$Invalid_custom_data;
			r15 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r15);
			label$2789538_7_67:
			return r8;
		case 77:
			r18 = (haxe__ds__ObjectMap)hl_alloc_obj(&t$haxe_ds_ObjectMap);
			haxe_ds_ObjectMap_new(r18);
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r2 = hl_types_ArrayDyn_push(r14,((vdynamic*)r18));
			r5 = r0->buf;
			label$2789538_7_74:
			r19 = true;
			if( !r19 ) goto label$2789538_7_92;
			r2 = r0->pos;
			r11 = r0->buf;
			if( r11 == NULL ) hl_null_access();
			r6 = r11->bytes;
			r17 = 1;
			r7 = r2 << r17;
			r7 = *(unsigned short*)(r6 + r7);
			r17 = 104;
			if( r7 != r17 ) goto label$2789538_7_87;
			goto label$2789538_7_92;
			label$2789538_7_87:
			r8 = haxe_Unserializer_unserialize(r0);
			if( r18 == NULL ) hl_null_access();
			r20 = haxe_Unserializer_unserialize(r0);
			haxe_ds_ObjectMap_set(r18,r8,r20);
			goto label$2789538_7_74;
			label$2789538_7_92:
			r2 = r0->pos;
			++r2;
			r0->pos = r2;
			return ((vdynamic*)r18);
		case 82:
			r2 = haxe_Unserializer_readDigits(r0);
			r17 = 0;
			if( r2 < r17 ) goto label$2789538_7_103;
			r21 = r0->scache;
			if( r21 == NULL ) hl_null_access();
			r17 = r21->length;
			if( r2 < r17 ) goto label$2789538_7_106;
			label$2789538_7_103:
			r5 = (String)s$Invalid_string_reference;
			r8 = haxe_Exception_thrown(((vdynamic*)r5));
			hl_throw((vdynamic*)r8);
			label$2789538_7_106:
			r21 = r0->scache;
			if( r21 == NULL ) hl_null_access();
			r17 = r21->length;
			if( ((unsigned)r2) < ((unsigned)r17) ) goto label$2789538_7_112;
			r5 = NULL;
			goto label$2789538_7_115;
			label$2789538_7_112:
			r22 = r21->array;
			r8 = ((vdynamic**)(r22 + 1))[r2];
			r5 = (String)r8;
			label$2789538_7_115:
			return ((vdynamic*)r5);
		case 97:
			r5 = r0->buf;
			r14 = (hl__types__ArrayDyn)hl_alloc_obj(&t$hl_types_ArrayDyn);
			hl_types_ArrayDyn_new(r14);
			r23 = r0->cache;
			if( r23 == NULL ) hl_null_access();
			r2 = hl_types_ArrayDyn_push(r23,((vdynamic*)r14));
			label$2789538_7_122:
			r19 = true;
			if( !r19 ) goto label$2789538_7_156;
			r2 = r0->pos;
			r11 = r0->buf;
			if( r11 == NULL ) hl_null_access();
			r6 = r11->bytes;
			r17 = 1;
			r7 = r2 << r17;
			r7 = *(unsigned short*)(r6 + r7);
			r24 = 104;
			if( r7 != r24 ) goto label$2789538_7_138;
			r17 = r0->pos;
			++r17;
			r0->pos = r17;
			goto label$2789538_7_156;
			label$2789538_7_138:
			r24 = 117;
			if( r7 != r24 ) goto label$2789538_7_152;
			r17 = r0->pos;
			++r17;
			r0->pos = r17;
			r17 = haxe_Unserializer_readDigits(r0);
			if( r14 == NULL ) hl_null_access();
			r24 = hl_types_ArrayDyn_get_length(r14);
			r24 = r24 + r17;
			r25 = 1;
			r24 = r24 - r25;
			r8 = NULL;
			((void (*)(hl__types__ArrayDyn,int,vdynamic*))r14->$type->vobj_proto[1])(r14,r24,r8);
			goto label$2789538_7_155;
			label$2789538_7_152:
			if( r14 == NULL ) hl_null_access();
			r8 = haxe_Unserializer_unserialize(r0);
			r17 = hl_types_ArrayDyn_push(r14,r8);
			label$2789538_7_155:
			goto label$2789538_7_122;
			label$2789538_7_156:
			return ((vdynamic*)r14);
		case 98:
			r26 = (haxe__ds__StringMap)hl_alloc_obj(&t$haxe_ds_StringMap);
			haxe_ds_StringMap_new(r26);
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r2 = hl_types_ArrayDyn_push(r14,((vdynamic*)r26));
			r5 = r0->buf;
			label$2789538_7_163:
			r19 = true;
			if( !r19 ) goto label$2789538_7_182;
			r2 = r0->pos;
			r11 = r0->buf;
			if( r11 == NULL ) hl_null_access();
			r6 = r11->bytes;
			r17 = 1;
			r7 = r2 << r17;
			r7 = *(unsigned short*)(r6 + r7);
			r17 = 104;
			if( r7 != r17 ) goto label$2789538_7_176;
			goto label$2789538_7_182;
			label$2789538_7_176:
			r8 = haxe_Unserializer_unserialize(r0);
			r11 = (String)hl_dyn_castp(&r8,&t$_dyn,&t$String);
			if( r26 == NULL ) hl_null_access();
			r8 = haxe_Unserializer_unserialize(r0);
			haxe_ds_StringMap_set(r26,r11,r8);
			goto label$2789538_7_163;
			label$2789538_7_182:
			r2 = r0->pos;
			++r2;
			r0->pos = r2;
			return ((vdynamic*)r26);
		case 99:
			r8 = haxe_Unserializer_unserialize(r0);
			r5 = (String)hl_dyn_castp(&r8,&t$_dyn,&t$String);
			r10 = r0->resolver;
			if( r10 == NULL ) hl_null_access();
			if( hl_vfields(r10)[0] ) r9 = ((hl__Class (*)(vdynamic*,String))hl_vfields(r10)[0])(r10->value,r5); else {
				void *args[] = {r5};
				r9 = (hl__Class)hl_dyn_call_obj(r10->value,&t$fun_ed91dde,-522339299/*resolveClass*/,args,NULL);
			}
			if( r9 ) goto label$2789538_7_196;
			r11 = (String)s$Class_not_found_;
			r11 = String___add__(r11,r5);
			r8 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r8);
			label$2789538_7_196:
			r8 = Type_createEmptyInstance(r9);
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r2 = hl_types_ArrayDyn_push(r14,r8);
			haxe_Unserializer_unserializeObject(r0,r8);
			return r8;
		case 100:
			r27 = haxe_Unserializer_readFloat(r0);
			r8 = hl_alloc_dynamic(&t$_f64);
			r8->v.d = r27;
			return r8;
		case 102:
			r19 = false;
			r8 = hl_alloc_dynbool(r19);
			return r8;
		case 105:
			r2 = haxe_Unserializer_readDigits(r0);
			r8 = hl_alloc_dynamic(&t$_i32);
			r8->v.i = r2;
			return r8;
		case 106:
			r8 = haxe_Unserializer_unserialize(r0);
			r5 = (String)hl_dyn_castp(&r8,&t$_dyn,&t$String);
			r10 = r0->resolver;
			if( r10 == NULL ) hl_null_access();
			if( hl_vfields(r10)[1] ) r13 = ((hl__BaseType (*)(vdynamic*,String))hl_vfields(r10)[1])(r10->value,r5); else {
				void *args[] = {r5};
				r13 = (hl__BaseType)hl_dyn_call_obj(r10->value,&t$fun_03ea481,-28209272/*resolveEnum*/,args,NULL);
			}
			if( r13 ) goto label$2789538_7_221;
			r11 = (String)s$Enum_not_found_;
			r11 = String___add__(r11,r5);
			r8 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r8);
			label$2789538_7_221:
			r2 = r0->pos;
			++r2;
			r0->pos = r2;
			r2 = haxe_Unserializer_readDigits(r0);
			r21 = Type_getEnumConstructs(r13);
			if( r21 == NULL ) hl_null_access();
			r17 = r21->length;
			if( ((unsigned)r2) < ((unsigned)r17) ) goto label$2789538_7_231;
			r11 = NULL;
			goto label$2789538_7_234;
			label$2789538_7_231:
			r22 = r21->array;
			r8 = ((vdynamic**)(r22 + 1))[r2];
			r11 = (String)r8;
			label$2789538_7_234:
			if( r11 ) goto label$2789538_7_246;
			r12 = (String)s$Unknown_enum_index_;
			r12 = String___add__(r12,r5);
			r28 = (String)s$518ed29;
			r12 = String___add__(r12,r28);
			r7 = r2;
			r29 = &r7;
			r6 = hl_itos(r7,r29);
			r28 = String___alloc__(r6,r7);
			r12 = String___add__(r12,r28);
			r8 = haxe_Exception_thrown(((vdynamic*)r12));
			hl_throw((vdynamic*)r8);
			label$2789538_7_246:
			r8 = haxe_Unserializer_unserializeEnum(r0,r13,r11);
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r7 = hl_types_ArrayDyn_push(r14,r8);
			return r8;
		case 107:
			r30 = ($Math)g$_Math;
			r27 = r30->NaN;
			r8 = hl_alloc_dynamic(&t$_f64);
			r8->v.d = r27;
			return r8;
		case 108:
			r31 = (haxe__ds__List)hl_alloc_obj(&t$haxe_ds_List);
			haxe_ds_List_new(r31);
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r2 = hl_types_ArrayDyn_push(r14,((vdynamic*)r31));
			r5 = r0->buf;
			label$2789538_7_261:
			r19 = true;
			if( !r19 ) goto label$2789538_7_278;
			r2 = r0->pos;
			r11 = r0->buf;
			if( r11 == NULL ) hl_null_access();
			r6 = r11->bytes;
			r17 = 1;
			r7 = r2 << r17;
			r7 = *(unsigned short*)(r6 + r7);
			r17 = 104;
			if( r7 != r17 ) goto label$2789538_7_274;
			goto label$2789538_7_278;
			label$2789538_7_274:
			if( r31 == NULL ) hl_null_access();
			r8 = haxe_Unserializer_unserialize(r0);
			haxe_ds_List_add(r31,r8);
			goto label$2789538_7_261;
			label$2789538_7_278:
			r2 = r0->pos;
			++r2;
			r0->pos = r2;
			return ((vdynamic*)r31);
		case 109:
			r30 = ($Math)g$_Math;
			r27 = r30->NEGATIVE_INFINITY;
			r8 = hl_alloc_dynamic(&t$_f64);
			r8->v.d = r27;
			return r8;
		case 110:
			r8 = NULL;
			return r8;
		case 111:
			r32 = hl_alloc_dynobj();
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r2 = hl_types_ArrayDyn_push(r14,((vdynamic*)r32));
			haxe_Unserializer_unserializeObject(r0,((vdynamic*)r32));
			return ((vdynamic*)r32);
		case 112:
			r30 = ($Math)g$_Math;
			r27 = r30->POSITIVE_INFINITY;
			r8 = hl_alloc_dynamic(&t$_f64);
			r8->v.d = r27;
			return r8;
		case 113:
			r33 = (haxe__ds__IntMap)hl_alloc_obj(&t$haxe_ds_IntMap);
			haxe_ds_IntMap_new(r33);
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r2 = hl_types_ArrayDyn_push(r14,((vdynamic*)r33));
			r5 = r0->buf;
			r2 = r0->pos;
			r7 = r2;
			++r2;
			r0->pos = r2;
			r11 = r0->buf;
			if( r11 == NULL ) hl_null_access();
			r6 = r11->bytes;
			r17 = 1;
			r7 = r7 << r17;
			r7 = *(unsigned short*)(r6 + r7);
			label$2789538_7_314:
			r24 = 58;
			if( r7 != r24 ) goto label$2789538_7_333;
			r17 = haxe_Unserializer_readDigits(r0);
			if( r33 == NULL ) hl_null_access();
			r8 = haxe_Unserializer_unserialize(r0);
			haxe_ds_IntMap_set(r33,r17,r8);
			r24 = r0->pos;
			r25 = r24;
			++r24;
			r0->pos = r24;
			r11 = r0->buf;
			if( r11 == NULL ) hl_null_access();
			r16 = r11->bytes;
			r35 = 1;
			r25 = r25 << r35;
			r25 = *(unsigned short*)(r16 + r25);
			r7 = r25;
			goto label$2789538_7_314;
			label$2789538_7_333:
			r24 = 104;
			if( r7 == r24 ) goto label$2789538_7_338;
			r11 = (String)s$Invalid_IntMap_format;
			r8 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r8);
			label$2789538_7_338:
			return ((vdynamic*)r33);
		case 114:
			r2 = haxe_Unserializer_readDigits(r0);
			r17 = 0;
			if( r2 < r17 ) goto label$2789538_7_346;
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r17 = hl_types_ArrayDyn_get_length(r14);
			if( r2 < r17 ) goto label$2789538_7_349;
			label$2789538_7_346:
			r5 = (String)s$Invalid_reference;
			r8 = haxe_Exception_thrown(((vdynamic*)r5));
			hl_throw((vdynamic*)r8);
			label$2789538_7_349:
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r8 = ((vdynamic* (*)(hl__types__ArrayDyn,int))r14->$type->vobj_proto[0])(r14,r2);
			return r8;
		case 115:
			r2 = haxe_Unserializer_readDigits(r0);
			r5 = r0->buf;
			r7 = r0->pos;
			r17 = r7;
			++r7;
			r0->pos = r7;
			r11 = r0->buf;
			if( r11 == NULL ) hl_null_access();
			r6 = r11->bytes;
			r24 = 1;
			r17 = r17 << r24;
			r17 = *(unsigned short*)(r6 + r17);
			r24 = 58;
			if( r17 != r24 ) goto label$2789538_7_371;
			r17 = r0->length;
			r24 = r0->pos;
			r17 = r17 - r24;
			if( r17 >= r2 ) goto label$2789538_7_374;
			label$2789538_7_371:
			r11 = (String)s$Invalid_bytes_length;
			r8 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r8);
			label$2789538_7_374:
			r37 = (haxe__$Unserializer)g$_haxe_Unserializer;
			r36 = r37->CODES;
			if( r36 ) goto label$2789538_7_381;
			r38 = haxe_Unserializer_initCodes();
			r36 = r38;
			r37 = (haxe__$Unserializer)g$_haxe_Unserializer;
			r37->CODES = r38;
			label$2789538_7_381:
			r17 = r0->pos;
			r25 = 3;
			r24 = r2 & r25;
			r35 = 2;
			r25 = r2 >> r35;
			r35 = 3;
			r25 = r25 * r35;
			r39 = 2;
			if( r24 < r39 ) goto label$2789538_7_393;
			r39 = 1;
			r35 = r24 - r39;
			goto label$2789538_7_394;
			label$2789538_7_393:
			r35 = 0;
			label$2789538_7_394:
			r25 = r25 + r35;
			r39 = r2 - r24;
			r35 = r17 + r39;
			r41 = haxe_io_Bytes_alloc(r25);
			r39 = 0;
			label$2789538_7_399:
			if( r17 >= r35 ) goto label$2789538_7_483;
			r40 = r17;
			++r17;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			if( r36 == NULL ) hl_null_access();
			r43 = 1;
			r42 = r40 << r43;
			r42 = *(unsigned short*)(r16 + r42);
			r43 = r36->length;
			if( ((unsigned)r42) < ((unsigned)r43) ) goto label$2789538_7_413;
			r42 = 0;
			goto label$2789538_7_417;
			label$2789538_7_413:
			r34 = r36->bytes;
			r43 = 2;
			r43 = r42 << r43;
			r42 = *(int*)(r34 + r43);
			label$2789538_7_417:
			r43 = r17;
			++r17;
			r34 = r5->bytes;
			r46 = 1;
			r45 = r43 << r46;
			r45 = *(unsigned short*)(r34 + r45);
			r46 = r36->length;
			if( ((unsigned)r45) < ((unsigned)r46) ) goto label$2789538_7_427;
			r45 = 0;
			goto label$2789538_7_431;
			label$2789538_7_427:
			r44 = r36->bytes;
			r46 = 2;
			r46 = r45 << r46;
			r45 = *(int*)(r44 + r46);
			label$2789538_7_431:
			if( r41 == NULL ) hl_null_access();
			r46 = r39;
			++r39;
			r48 = 2;
			r47 = r42 << r48;
			r49 = 4;
			r48 = r45 >> r49;
			r47 = r47 | r48;
			haxe_io_Bytes_set(r41,r46,r47);
			r46 = r17;
			++r17;
			r44 = r5->bytes;
			r48 = 1;
			r47 = r46 << r48;
			r47 = *(unsigned short*)(r44 + r47);
			r48 = r36->length;
			if( ((unsigned)r47) < ((unsigned)r48) ) goto label$2789538_7_450;
			r47 = 0;
			goto label$2789538_7_454;
			label$2789538_7_450:
			r50 = r36->bytes;
			r48 = 2;
			r48 = r47 << r48;
			r47 = *(int*)(r50 + r48);
			label$2789538_7_454:
			r48 = r39;
			++r39;
			r51 = 4;
			r49 = r45 << r51;
			r52 = 2;
			r51 = r47 >> r52;
			r49 = r49 | r51;
			haxe_io_Bytes_set(r41,r48,r49);
			r48 = r17;
			++r17;
			r50 = r5->bytes;
			r51 = 1;
			r49 = r48 << r51;
			r49 = *(unsigned short*)(r50 + r49);
			r51 = r36->length;
			if( ((unsigned)r49) < ((unsigned)r51) ) goto label$2789538_7_472;
			r49 = 0;
			goto label$2789538_7_476;
			label$2789538_7_472:
			r53 = r36->bytes;
			r51 = 2;
			r51 = r49 << r51;
			r49 = *(int*)(r53 + r51);
			label$2789538_7_476:
			r51 = r39;
			++r39;
			r54 = 6;
			r52 = r47 << r54;
			r52 = r52 | r49;
			haxe_io_Bytes_set(r41,r51,r52);
			goto label$2789538_7_399;
			label$2789538_7_483:
			r42 = 2;
			if( r24 < r42 ) goto label$2789538_7_548;
			r40 = r17;
			++r17;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			if( r36 == NULL ) hl_null_access();
			r43 = 1;
			r42 = r40 << r43;
			r42 = *(unsigned short*)(r16 + r42);
			r43 = r36->length;
			if( ((unsigned)r42) < ((unsigned)r43) ) goto label$2789538_7_497;
			r42 = 0;
			goto label$2789538_7_501;
			label$2789538_7_497:
			r34 = r36->bytes;
			r43 = 2;
			r43 = r42 << r43;
			r42 = *(int*)(r34 + r43);
			label$2789538_7_501:
			r43 = r17;
			++r17;
			r34 = r5->bytes;
			r46 = 1;
			r45 = r43 << r46;
			r45 = *(unsigned short*)(r34 + r45);
			r46 = r36->length;
			if( ((unsigned)r45) < ((unsigned)r46) ) goto label$2789538_7_511;
			r45 = 0;
			goto label$2789538_7_515;
			label$2789538_7_511:
			r44 = r36->bytes;
			r46 = 2;
			r46 = r45 << r46;
			r45 = *(int*)(r44 + r46);
			label$2789538_7_515:
			if( r41 == NULL ) hl_null_access();
			r46 = r39;
			++r39;
			r48 = 2;
			r47 = r42 << r48;
			r49 = 4;
			r48 = r45 >> r49;
			r47 = r47 | r48;
			haxe_io_Bytes_set(r41,r46,r47);
			r47 = 3;
			if( r24 != r47 ) goto label$2789538_7_548;
			r46 = r17;
			++r17;
			r44 = r5->bytes;
			r48 = 1;
			r47 = r46 << r48;
			r47 = *(unsigned short*)(r44 + r47);
			r48 = r36->length;
			if( ((unsigned)r47) < ((unsigned)r48) ) goto label$2789538_7_536;
			r47 = 0;
			goto label$2789538_7_540;
			label$2789538_7_536:
			r50 = r36->bytes;
			r48 = 2;
			r48 = r47 << r48;
			r47 = *(int*)(r50 + r48);
			label$2789538_7_540:
			r48 = r39;
			++r39;
			r51 = 4;
			r49 = r45 << r51;
			r52 = 2;
			r51 = r47 >> r52;
			r49 = r49 | r51;
			haxe_io_Bytes_set(r41,r48,r49);
			label$2789538_7_548:
			r40 = r0->pos;
			r40 = r40 + r2;
			r0->pos = r40;
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r40 = hl_types_ArrayDyn_push(r14,((vdynamic*)r41));
			return ((vdynamic*)r41);
		case 116:
			r19 = true;
			r8 = hl_alloc_dynbool(r19);
			return r8;
		case 118:
			r2 = r0->pos;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r6 = r5->bytes;
			r17 = 1;
			r7 = r2 << r17;
			r7 = *(unsigned short*)(r6 + r7);
			r17 = 48;
			if( r7 < r17 ) goto label$2789538_7_580;
			r7 = r0->pos;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			r24 = 1;
			r17 = r7 << r24;
			r17 = *(unsigned short*)(r16 + r17);
			r24 = 57;
			if( r17 <= r24 ) goto label$2789538_7_578;
			r55 = false;
			goto label$2789538_7_579;
			label$2789538_7_578:
			r55 = true;
			label$2789538_7_579:
			goto label$2789538_7_581;
			label$2789538_7_580:
			r55 = false;
			label$2789538_7_581:
			if( !r55 ) goto label$2789538_7_597;
			r7 = r0->pos;
			r17 = 1;
			r7 = r7 + r17;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			r24 = 1;
			r17 = r7 << r24;
			r17 = *(unsigned short*)(r16 + r17);
			r24 = 48;
			if( r17 >= r24 ) goto label$2789538_7_595;
			r56 = false;
			goto label$2789538_7_596;
			label$2789538_7_595:
			r56 = true;
			label$2789538_7_596:
			goto label$2789538_7_598;
			label$2789538_7_597:
			r56 = false;
			label$2789538_7_598:
			if( !r56 ) goto label$2789538_7_614;
			r7 = r0->pos;
			r17 = 1;
			r7 = r7 + r17;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			r24 = 1;
			r17 = r7 << r24;
			r17 = *(unsigned short*)(r16 + r17);
			r24 = 57;
			if( r17 <= r24 ) goto label$2789538_7_612;
			r57 = false;
			goto label$2789538_7_613;
			label$2789538_7_612:
			r57 = true;
			label$2789538_7_613:
			goto label$2789538_7_615;
			label$2789538_7_614:
			r57 = false;
			label$2789538_7_615:
			if( !r57 ) goto label$2789538_7_631;
			r7 = r0->pos;
			r17 = 2;
			r7 = r7 + r17;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			r24 = 1;
			r17 = r7 << r24;
			r17 = *(unsigned short*)(r16 + r17);
			r24 = 48;
			if( r17 >= r24 ) goto label$2789538_7_629;
			r58 = false;
			goto label$2789538_7_630;
			label$2789538_7_629:
			r58 = true;
			label$2789538_7_630:
			goto label$2789538_7_632;
			label$2789538_7_631:
			r58 = false;
			label$2789538_7_632:
			if( !r58 ) goto label$2789538_7_648;
			r7 = r0->pos;
			r17 = 2;
			r7 = r7 + r17;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			r24 = 1;
			r17 = r7 << r24;
			r17 = *(unsigned short*)(r16 + r17);
			r24 = 57;
			if( r17 <= r24 ) goto label$2789538_7_646;
			r59 = false;
			goto label$2789538_7_647;
			label$2789538_7_646:
			r59 = true;
			label$2789538_7_647:
			goto label$2789538_7_649;
			label$2789538_7_648:
			r59 = false;
			label$2789538_7_649:
			if( !r59 ) goto label$2789538_7_665;
			r7 = r0->pos;
			r17 = 3;
			r7 = r7 + r17;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			r24 = 1;
			r17 = r7 << r24;
			r17 = *(unsigned short*)(r16 + r17);
			r24 = 48;
			if( r17 >= r24 ) goto label$2789538_7_663;
			r60 = false;
			goto label$2789538_7_664;
			label$2789538_7_663:
			r60 = true;
			label$2789538_7_664:
			goto label$2789538_7_666;
			label$2789538_7_665:
			r60 = false;
			label$2789538_7_666:
			if( !r60 ) goto label$2789538_7_682;
			r7 = r0->pos;
			r17 = 3;
			r7 = r7 + r17;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			r24 = 1;
			r17 = r7 << r24;
			r17 = *(unsigned short*)(r16 + r17);
			r24 = 57;
			if( r17 <= r24 ) goto label$2789538_7_680;
			r61 = false;
			goto label$2789538_7_681;
			label$2789538_7_680:
			r61 = true;
			label$2789538_7_681:
			goto label$2789538_7_683;
			label$2789538_7_682:
			r61 = false;
			label$2789538_7_683:
			if( !r61 ) goto label$2789538_7_699;
			r7 = r0->pos;
			r17 = 4;
			r7 = r7 + r17;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			r24 = 1;
			r17 = r7 << r24;
			r17 = *(unsigned short*)(r16 + r17);
			r24 = 45;
			if( r17 == r24 ) goto label$2789538_7_697;
			r62 = false;
			goto label$2789538_7_698;
			label$2789538_7_697:
			r62 = true;
			label$2789538_7_698:
			goto label$2789538_7_700;
			label$2789538_7_699:
			r62 = false;
			label$2789538_7_700:
			if( !r62 ) goto label$2789538_7_713;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r7 = r0->pos;
			r17 = 19;
			r64 = hl_alloc_dynamic(&t$_i32);
			r64->v.i = r17;
			r5 = String_substr(r5,r7,r64);
			r63 = Date_fromString(r5);
			r7 = r0->pos;
			r17 = 19;
			r7 = r7 + r17;
			r0->pos = r7;
			goto label$2789538_7_715;
			label$2789538_7_713:
			r27 = haxe_Unserializer_readFloat(r0);
			r63 = Date_fromTime(r27);
			label$2789538_7_715:
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r7 = hl_types_ArrayDyn_push(r14,((vdynamic*)r63));
			return ((vdynamic*)r63);
		case 119:
			r8 = haxe_Unserializer_unserialize(r0);
			r5 = (String)hl_dyn_castp(&r8,&t$_dyn,&t$String);
			r10 = r0->resolver;
			if( r10 == NULL ) hl_null_access();
			if( hl_vfields(r10)[1] ) r13 = ((hl__BaseType (*)(vdynamic*,String))hl_vfields(r10)[1])(r10->value,r5); else {
				void *args[] = {r5};
				r13 = (hl__BaseType)hl_dyn_call_obj(r10->value,&t$fun_03ea481,-28209272/*resolveEnum*/,args,NULL);
			}
			if( r13 ) goto label$2789538_7_729;
			r11 = (String)s$Enum_not_found_;
			r11 = String___add__(r11,r5);
			r8 = haxe_Exception_thrown(((vdynamic*)r11));
			hl_throw((vdynamic*)r8);
			label$2789538_7_729:
			r8 = haxe_Unserializer_unserialize(r0);
			r11 = (String)hl_dyn_castp(&r8,&t$_dyn,&t$String);
			r8 = haxe_Unserializer_unserializeEnum(r0,r13,r11);
			r14 = r0->cache;
			if( r14 == NULL ) hl_null_access();
			r2 = hl_types_ArrayDyn_push(r14,r8);
			return r8;
		case 120:
			r8 = haxe_Unserializer_unserialize(r0);
			r8 = haxe_Exception_thrown(r8);
			hl_throw((vdynamic*)r8);
		case 121:
			r2 = haxe_Unserializer_readDigits(r0);
			r7 = r0->pos;
			r17 = r7;
			++r7;
			r0->pos = r7;
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r6 = r5->bytes;
			r24 = 1;
			r17 = r17 << r24;
			r17 = *(unsigned short*)(r6 + r17);
			r24 = 58;
			if( r17 != r24 ) goto label$2789538_7_756;
			r17 = r0->length;
			r24 = r0->pos;
			r17 = r17 - r24;
			if( r17 >= r2 ) goto label$2789538_7_759;
			label$2789538_7_756:
			r5 = (String)s$Invalid_string_length;
			r8 = haxe_Exception_thrown(((vdynamic*)r5));
			hl_throw((vdynamic*)r8);
			label$2789538_7_759:
			r5 = r0->buf;
			if( r5 == NULL ) hl_null_access();
			r17 = r0->pos;
			r64 = hl_alloc_dynamic(&t$_i32);
			r64->v.i = r2;
			r5 = String_substr(r5,r17,r64);
			r17 = r0->pos;
			r17 = r17 + r2;
			r0->pos = r17;
			r17 = 0;
			if( r5 == NULL ) hl_null_access();
			r16 = r5->bytes;
			r29 = &r17;
			r34 = hl_url_decode(r16,r29);
			r11 = (String)hl_alloc_obj(&t$String);
			r11->bytes = r34;
			r11->length = r17;
			r21 = r0->scache;
			if( r21 == NULL ) hl_null_access();
			r24 = hl_types_ArrayObj_push(r21,((vdynamic*)r11));
			return ((vdynamic*)r11);
		case 122:
			r2 = 0;
			r8 = hl_alloc_dynamic(&t$_i32);
			r8->v.i = r2;
			return r8;
	}
	label$2789538_7_782:
	r1 = r0->pos;
	--r1;
	r0->pos = r1;
	r5 = (String)s$Invalid_char_;
	r11 = r0->buf;
	if( r11 == NULL ) hl_null_access();
	r1 = r0->pos;
	r11 = String_charAt(r11,r1);
	r5 = String___add__(r5,r11);
	r11 = (String)s$_at_position_;
	r5 = String___add__(r5,r11);
	r1 = r0->pos;
	r29 = &r1;
	r4 = hl_itos(r1,r29);
	r11 = String___alloc__(r4,r1);
	r5 = String___add__(r5,r11);
	r8 = haxe_Exception_thrown(((vdynamic*)r5));
	hl_throw((vdynamic*)r8);
}

vdynamic* haxe_Unserializer_run(String r0) {
	haxe__Unserializer r2;
	vdynamic *r1;
	r2 = (haxe__Unserializer)hl_alloc_obj(&t$haxe_Unserializer);
	haxe_Unserializer_new(r2,r0);
	r1 = haxe_Unserializer_unserialize(r2);
	return r1;
}
