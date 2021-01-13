﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <components/stage/LRConsole.h>
#include <h2d/Font.h>
#include <h2d/Console.h>
void h2d_Console_new(h2d__Console,h2d__Font,h2d__Object);
extern h2d__$Console g$_h2d_Console;
int h2d_Text_set_textColor(h2d__Text,int);
#include <hxd/Event.h>
#include <hxd/EventKind.h>
void components_stage_LRConsole_show(components__stage__LRConsole);
bool h2d_Object_set_visible(h2d__Object,bool);
extern String s$;
String h2d_TextInput_set_text(h2d__TextInput,String);
void h2d_TextInput_focus(h2d__TextInput);
#include <hl/ctx/2cbb3.h>
#include <hl/types/ArrayBytes_Int.h>
void hl_types_ArrayBytes_Int___expand(hl__types__ArrayBytes_Int,int);
String String_charAt(String,int);
void hl_types_ArrayObj___expand(hl__types__ArrayObj,int);
int String___compare(String,vdynamic*);
String String___add__(String,String);
#include <hl/types/ArrayDyn.h>
#include <h2d/ConsoleArg.h>
#include <haxe/Exception.h>
#include <_std/String.h>
String StringTools_trim(String);
vdynamic* String_charCodeAt(String,int);
extern hl_type t$_i32;
String String_substr(String,int,vdynamic*);
void h2d_Console_hide(h2d__Console);
int hl_types_ArrayObj_push(hl__types__ArrayObj,vdynamic*);
extern hl_type t$String;
#include <hl/natives.h>
hl__types__ArrayObj hl_types_ArrayObj_alloc(varray*);
hl__types__ArrayBytes_Int hl_types_ArrayBase_allocI32(vbyte*,int);
extern hl_type t$ctx_c92cbb3;
extern hl_type t$fun_5a2d535;
extern String s$7215ee9;
extern String s$5e732a1;
extern String s$Bad_formated_string;
void h2d_Console_log(h2d__Console,String,vdynamic*);
bool haxe_ds_StringMap_exists(haxe__ds__StringMap,String);
vdynamic* haxe_ds_StringMap_get(haxe__ds__StringMap,String);
extern hl_type t$vrt_a6bfc9e;
extern String s$Unknown_command_;
extern String s$b15835f;
extern hl_type t$hl_types_ArrayDyn;
void hl_types_ArrayDyn_new(hl__types__ArrayDyn);
extern hl_type t$hl_types_ArrayObj;
extern hl_type t$vrt_6b9bbd4;
extern hl_type t$nul_bool;
int hl_types_ArrayDyn_push(hl__types__ArrayDyn,vdynamic*);
extern String s$Missing_argument_;
extern hl_type t$h2d_ConsoleArg;
vdynamic* Std_parseInt(String);
extern String s$_should_be_Int_for_argument_;
double Std_parseFloat(String);
extern String s$_should_be_Float_for_argument_;
extern hl_type t$_f64;
extern String s$_should_be_Bool_for_argument_;
extern String s$f380c35;
extern String s$b99834b;
String hl_types_ArrayObj_join(hl__types__ArrayObj,String);
extern String s$_for_argument_;
extern hl_type t$_dyn;
vdynamic* Reflect_callMethod(vdynamic*,vdynamic*,hl__types__ArrayDyn);
haxe__Exception haxe_Exception_caught(vdynamic*);
extern $String g$_String;
bool Std_isOfType(vdynamic*,vdynamic*);
extern String s$ERROR_;

void components_stage_LRConsole_new(components__stage__LRConsole r0,h2d__Font r1,h2d__Object r2) {
	h2d__$Console r5;
	double r4;
	h2d__TextInput r7;
	int r6;
	h2d_Console_new(((h2d__Console)r0),r1,r2);
	r4 = 30.;
	r5 = (h2d__$Console)g$_h2d_Console;
	r5->HIDE_LOG_TIMEOUT = r4;
	r7 = r0->tf;
	if( r7 == NULL ) hl_null_access();
	r6 = -15658735;
	r6 = h2d_Text_set_textColor(((h2d__Text)r7),r6);
	return;
}

void components_stage_LRConsole_onEvent(components__stage__LRConsole r0,hxd__Event r1) {
	venum *r4;
	bool r6;
	h2d__Bitmap r7;
	int r3, r5;
	if( r1 == NULL ) hl_null_access();
	r4 = r1->kind;
	if( r4 == NULL ) hl_null_access();
	r3 = HL__ENUM_INDEX__(r4);
	r5 = 11;
	if( r3 != r5 ) goto label$a3ed764_2_14;
	r3 = r1->charCode;
	r5 = r0->shortKeyChar;
	if( r3 != r5 ) goto label$a3ed764_2_14;
	r7 = r0->bg;
	if( r7 == NULL ) hl_null_access();
	r6 = r7->visible;
	if( r6 ) goto label$a3ed764_2_14;
	components_stage_LRConsole_show(r0);
	label$a3ed764_2_14:
	return;
}

void components_stage_LRConsole_show(components__stage__LRConsole r0) {
	String r3;
	bool r1;
	h2d__HtmlText r8;
	h2d__Bitmap r2;
	h2d__TextInput r4, r7;
	int r6;
	r2 = r0->bg;
	if( r2 == NULL ) hl_null_access();
	r1 = true;
	r1 = h2d_Object_set_visible(((h2d__Object)r2),r1);
	r4 = r0->tf;
	if( r4 == NULL ) hl_null_access();
	r3 = (String)s$;
	r3 = h2d_TextInput_set_text(r4,r3);
	r4 = r0->tf;
	if( r4 == NULL ) hl_null_access();
	h2d_TextInput_focus(r4);
	r4 = r0->tf;
	if( r4 == NULL ) hl_null_access();
	r7 = r0->tf;
	if( r7 == NULL ) hl_null_access();
	r3 = r7->text;
	if( r3 == NULL ) hl_null_access();
	r6 = r3->length;
	r4->cursorIndex = r6;
	r2 = r0->bg;
	if( r2 == NULL ) hl_null_access();
	r1 = true;
	r1 = h2d_Object_set_visible(((h2d__Object)r2),r1);
	r8 = r0->logTxt;
	if( r8 == NULL ) hl_null_access();
	r1 = true;
	r1 = h2d_Object_set_visible(((h2d__Object)r8),r1);
	return;
}

String components_stage_LRConsole_handleCommand__$1(venum* r0,String r1) {
	String r2, r8, r14;
	hl__types__ArrayObj r9;
	hl__types__ArrayBytes_Int r4;
	vdynamic *r13;
	varray *r12;
	vbyte *r7;
	int r5, r6, r10, r11;
	r2 = (String)s$;
	label$a3ed764_4_1:
	r4 = ((Enumt$ctx_c92cbb3*)r0)->p2;
	if( r4 == NULL ) hl_null_access();
	r5 = 0;
	r6 = r4->length;
	if( ((unsigned)r5) < ((unsigned)r6) ) goto label$a3ed764_4_9;
	r5 = 0;
	goto label$a3ed764_4_13;
	label$a3ed764_4_9:
	r7 = r4->bytes;
	r6 = 2;
	r6 = r5 << r6;
	r5 = *(int*)(r7 + r6);
	label$a3ed764_4_13:
	r8 = ((Enumt$ctx_c92cbb3*)r0)->p0;
	if( r8 == NULL ) hl_null_access();
	r6 = r8->length;
	if( r5 >= r6 ) goto label$a3ed764_4_77;
	r9 = ((Enumt$ctx_c92cbb3*)r0)->p1;
	if( r9 == NULL ) hl_null_access();
	r5 = 0;
	r8 = ((Enumt$ctx_c92cbb3*)r0)->p0;
	if( r8 == NULL ) hl_null_access();
	r4 = ((Enumt$ctx_c92cbb3*)r0)->p2;
	if( r4 == NULL ) hl_null_access();
	r6 = 0;
	r10 = r4->length;
	if( ((unsigned)r6) < ((unsigned)r10) ) goto label$a3ed764_4_28;
	hl_types_ArrayBytes_Int___expand(r4,r6);
	label$a3ed764_4_28:
	r7 = r4->bytes;
	r10 = 2;
	r10 = r6 << r10;
	r11 = *(int*)(r7 + r10);
	++r11;
	*(int*)(r7 + r10) = r11;
	r8 = String_charAt(r8,r11);
	r6 = r9->length;
	if( ((unsigned)r5) < ((unsigned)r6) ) goto label$a3ed764_4_38;
	hl_types_ArrayObj___expand(r9,r5);
	label$a3ed764_4_38:
	r12 = r9->array;
	((String*)(r12 + 1))[r5] = r8;
	r9 = ((Enumt$ctx_c92cbb3*)r0)->p1;
	if( r9 == NULL ) hl_null_access();
	r5 = 0;
	r6 = r9->length;
	if( ((unsigned)r5) < ((unsigned)r6) ) goto label$a3ed764_4_47;
	r8 = NULL;
	goto label$a3ed764_4_50;
	label$a3ed764_4_47:
	r12 = r9->array;
	r13 = ((vdynamic**)(r12 + 1))[r5];
	r8 = (String)r13;
	label$a3ed764_4_50:
	if( r8 != r1 && (!r8 || !r1 || String___compare(r8,(vdynamic*)r1) != 0) ) goto label$a3ed764_4_64;
	r4 = ((Enumt$ctx_c92cbb3*)r0)->p2;
	if( r4 == NULL ) hl_null_access();
	r5 = 0;
	r6 = r4->length;
	if( ((unsigned)r5) < ((unsigned)r6) ) goto label$a3ed764_4_57;
	hl_types_ArrayBytes_Int___expand(r4,r5);
	label$a3ed764_4_57:
	r7 = r4->bytes;
	r6 = 2;
	r6 = r5 << r6;
	r10 = *(int*)(r7 + r6);
	++r10;
	*(int*)(r7 + r6) = r10;
	return r2;
	label$a3ed764_4_64:
	r9 = ((Enumt$ctx_c92cbb3*)r0)->p1;
	if( r9 == NULL ) hl_null_access();
	r5 = 0;
	r6 = r9->length;
	if( ((unsigned)r5) < ((unsigned)r6) ) goto label$a3ed764_4_71;
	r14 = NULL;
	goto label$a3ed764_4_74;
	label$a3ed764_4_71:
	r12 = r9->array;
	r13 = ((vdynamic**)(r12 + 1))[r5];
	r14 = (String)r13;
	label$a3ed764_4_74:
	r8 = String___add__(r2,r14);
	r2 = r8;
	goto label$a3ed764_4_1;
	label$a3ed764_4_77:
	r8 = NULL;
	return r8;
}

void components_stage_LRConsole_handleCommand(components__stage__LRConsole r0,String r1) {
	$String r39;
	String r2, r7, r22, r24, r32;
	vvirtual *r27, *r30;
	haxe__ds__StringMap r26;
	hl__types__ArrayObj r9, r13, r20;
	venum *r19, *r33;
	hl_type *r11;
	bool r25, r36;
	hl__types__ArrayBytes_Int r14;
	double r34;
	hl__types__ArrayDyn r28;
	vclosure *r18;
	haxe__Exception r38;
	vdynamic *r4, *r6, *r8, *r31, *r37;
	vbyte *r15, *r21;
	varray *r10;
	int r5, r12, r16, r17, r23, r29, r35;
	hl_trap_ctx trap$0;
	r2 = StringTools_trim(r1);
	r1 = r2;
	if( r2 == NULL ) hl_null_access();
	r5 = 0;
	r4 = String_charCodeAt(r2,r5);
	r5 = r0->shortKeyChar;
	r6 = hl_alloc_dynamic(&t$_i32);
	r6->v.i = r5;
	if( r4 != r6 && (!r4 || !r6 || (r4->v.i != r6->v.i)) ) goto label$a3ed764_5_12;
	r5 = 1;
	r4 = NULL;
	r2 = String_substr(r2,r5,r4);
	r1 = r2;
	label$a3ed764_5_12:
	r7 = (String)s$;
	if( r2 != r7 && (!r2 || !r7 || String___compare(r2,(vdynamic*)r7) != 0) ) goto label$a3ed764_5_16;
	h2d_Console_hide(((h2d__Console)r0));
	return;
	label$a3ed764_5_16:
	r9 = r0->logs;
	if( r9 == NULL ) hl_null_access();
	r5 = hl_types_ArrayObj_push(r9,((vdynamic*)r2));
	r5 = -1;
	r0->logIndex = r5;
	r5 = 12582912;
	r11 = &t$String;
	r12 = 0;
	r10 = hl_alloc_array(r11,r12);
	r9 = hl_types_ArrayObj_alloc(r10);
	r11 = &t$String;
	r12 = 1;
	r10 = hl_alloc_array(r11,r12);
	r2 = (String)s$;
	r12 = 0;
	((String*)(r10 + 1))[r12] = r2;
	r13 = hl_types_ArrayObj_alloc(r10);
	r12 = 4;
	r15 = hl_alloc_bytes(r12);
	r12 = 0;
	r16 = 0;
	r17 = 2;
	r17 = r12 << r17;
	*(int*)(r15 + r17) = r16;
	++r12;
	r12 = 1;
	r14 = hl_types_ArrayBase_allocI32(r15,r12);
	r19 = hl_alloc_enum(&t$ctx_c92cbb3,0);
	((Enumt$ctx_c92cbb3*)r19)->p0 = (String)r1;
	((Enumt$ctx_c92cbb3*)r19)->p1 = (hl__types__ArrayObj)r13;
	((Enumt$ctx_c92cbb3*)r19)->p2 = (hl__types__ArrayBytes_Int)r14;
	r18 = hl_alloc_closure_ptr(&t$fun_5a2d535,components_stage_LRConsole_handleCommand__$1,r19);
	r2 = (String)s$;
	label$a3ed764_5_49:
	if( r14 == NULL ) hl_null_access();
	r12 = 0;
	r16 = r14->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_56;
	r12 = 0;
	goto label$a3ed764_5_60;
	label$a3ed764_5_56:
	r15 = r14->bytes;
	r16 = 2;
	r16 = r12 << r16;
	r12 = *(int*)(r15 + r16);
	label$a3ed764_5_60:
	if( r1 == NULL ) hl_null_access();
	r16 = r1->length;
	if( r12 >= r16 ) goto label$a3ed764_5_308;
	if( r13 == NULL ) hl_null_access();
	r12 = 0;
	r16 = 0;
	r17 = r14->length;
	if( ((unsigned)r16) < ((unsigned)r17) ) goto label$a3ed764_5_70;
	r16 = 0;
	goto label$a3ed764_5_74;
	label$a3ed764_5_70:
	r15 = r14->bytes;
	r17 = 2;
	r17 = r16 << r17;
	r16 = *(int*)(r15 + r17);
	label$a3ed764_5_74:
	r7 = String_charAt(r1,r16);
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_78;
	hl_types_ArrayObj___expand(r13,r12);
	label$a3ed764_5_78:
	r10 = r13->array;
	((String*)(r10 + 1))[r12] = r7;
	r12 = 0;
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_85;
	r7 = NULL;
	goto label$a3ed764_5_88;
	label$a3ed764_5_85:
	r10 = r13->array;
	r8 = ((vdynamic**)(r10 + 1))[r12];
	r7 = (String)r8;
	label$a3ed764_5_88:
	if( !r7 ) goto label$a3ed764_5_97;
	r12 = r7->length;
	r16 = 1;
	if( r12 != r16 ) goto label$a3ed764_5_97;
	r15 = r7->bytes;
	r21 = (vbyte*)USTR("\t");
	r12 = hl_string_compare(r15,r21,r12);
	r16 = 0;
	if( r12 == r16 ) goto label$a3ed764_5_135;
	label$a3ed764_5_97:
	if( !r7 ) goto label$a3ed764_5_106;
	r12 = r7->length;
	r16 = 1;
	if( r12 != r16 ) goto label$a3ed764_5_106;
	r15 = r7->bytes;
	r21 = (vbyte*)USTR(" ");
	r12 = hl_string_compare(r15,r21,r12);
	r16 = 0;
	if( r12 == r16 ) goto label$a3ed764_5_135;
	label$a3ed764_5_106:
	if( !r7 ) goto label$a3ed764_5_115;
	r12 = r7->length;
	r16 = 1;
	if( r12 != r16 ) goto label$a3ed764_5_115;
	r15 = r7->bytes;
	r21 = (vbyte*)USTR("\"");
	r12 = hl_string_compare(r15,r21,r12);
	r16 = 0;
	if( r12 == r16 ) goto label$a3ed764_5_209;
	label$a3ed764_5_115:
	if( !r7 ) goto label$a3ed764_5_124;
	r12 = r7->length;
	r16 = 1;
	if( r12 != r16 ) goto label$a3ed764_5_124;
	r15 = r7->bytes;
	r21 = (vbyte*)USTR("'");
	r12 = hl_string_compare(r15,r21,r12);
	r16 = 0;
	if( r12 == r16 ) goto label$a3ed764_5_209;
	label$a3ed764_5_124:
	r12 = 0;
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_129;
	r22 = NULL;
	goto label$a3ed764_5_132;
	label$a3ed764_5_129:
	r10 = r13->array;
	r8 = ((vdynamic**)(r10 + 1))[r12];
	r22 = (String)r8;
	label$a3ed764_5_132:
	r7 = String___add__(r2,r22);
	r2 = r7;
	goto label$a3ed764_5_297;
	label$a3ed764_5_135:
	r12 = 0;
	r16 = 0;
	r17 = r14->length;
	if( ((unsigned)r16) < ((unsigned)r17) ) goto label$a3ed764_5_141;
	r16 = 0;
	goto label$a3ed764_5_145;
	label$a3ed764_5_141:
	r15 = r14->bytes;
	r17 = 2;
	r17 = r16 << r17;
	r16 = *(int*)(r15 + r17);
	label$a3ed764_5_145:
	r7 = String_charAt(r1,r16);
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_149;
	hl_types_ArrayObj___expand(r13,r12);
	label$a3ed764_5_149:
	r10 = r13->array;
	((String*)(r10 + 1))[r12] = r7;
	label$a3ed764_5_151:
	if( r13 == NULL ) hl_null_access();
	r12 = 0;
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_158;
	r7 = NULL;
	goto label$a3ed764_5_161;
	label$a3ed764_5_158:
	r10 = r13->array;
	r8 = ((vdynamic**)(r10 + 1))[r12];
	r7 = (String)r8;
	label$a3ed764_5_161:
	r22 = (String)s$7215ee9;
	if( r7 == r22 || (r7 && r22 && String___compare(r7,(vdynamic*)r22) == 0) ) goto label$a3ed764_5_173;
	r12 = 0;
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_168;
	r7 = NULL;
	goto label$a3ed764_5_171;
	label$a3ed764_5_168:
	r10 = r13->array;
	r8 = ((vdynamic**)(r10 + 1))[r12];
	r7 = (String)r8;
	label$a3ed764_5_171:
	r22 = (String)s$5e732a1;
	if( r7 != r22 && (!r7 || !r22 || String___compare(r7,(vdynamic*)r22) != 0) ) goto label$a3ed764_5_193;
	label$a3ed764_5_173:
	r12 = 0;
	if( r1 == NULL ) hl_null_access();
	if( r14 == NULL ) hl_null_access();
	r16 = 0;
	r17 = r14->length;
	if( ((unsigned)r16) < ((unsigned)r17) ) goto label$a3ed764_5_180;
	hl_types_ArrayBytes_Int___expand(r14,r16);
	label$a3ed764_5_180:
	r15 = r14->bytes;
	r17 = 2;
	r17 = r16 << r17;
	r23 = *(int*)(r15 + r17);
	++r23;
	*(int*)(r15 + r17) = r23;
	r7 = String_charAt(r1,r23);
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_190;
	hl_types_ArrayObj___expand(r13,r12);
	label$a3ed764_5_190:
	r10 = r13->array;
	((String*)(r10 + 1))[r12] = r7;
	goto label$a3ed764_5_151;
	label$a3ed764_5_193:
	if( r14 == NULL ) hl_null_access();
	r12 = 0;
	r16 = r14->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_198;
	hl_types_ArrayBytes_Int___expand(r14,r12);
	label$a3ed764_5_198:
	r15 = r14->bytes;
	r16 = 2;
	r16 = r12 << r16;
	r17 = *(int*)(r15 + r16);
	--r17;
	*(int*)(r15 + r16) = r17;
	if( r9 == NULL ) hl_null_access();
	r12 = hl_types_ArrayObj_push(r9,((vdynamic*)r2));
	r7 = (String)s$;
	r2 = r7;
	goto label$a3ed764_5_297;
	label$a3ed764_5_209:
	if( r18 == NULL ) hl_null_access();
	r12 = 0;
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_215;
	r7 = NULL;
	goto label$a3ed764_5_218;
	label$a3ed764_5_215:
	r10 = r13->array;
	r8 = ((vdynamic**)(r10 + 1))[r12];
	r7 = (String)r8;
	label$a3ed764_5_218:
	r7 = r18->hasValue ? ((String (*)(vdynamic*,String))r18->fun)((vdynamic*)r18->value,r7) : ((String (*)(String))r18->fun)(r7);
	if( r7 ) goto label$a3ed764_5_224;
	r22 = (String)s$Bad_formated_string;
	r4 = hl_alloc_dynamic(&t$_i32);
	r4->v.i = r5;
	h2d_Console_log(((h2d__Console)r0),r22,r4);
	return;
	label$a3ed764_5_224:
	if( r9 == NULL ) hl_null_access();
	r12 = hl_types_ArrayObj_push(r9,((vdynamic*)r7));
	r22 = (String)s$;
	r2 = r22;
	r12 = 0;
	r16 = 0;
	r17 = r14->length;
	if( ((unsigned)r16) < ((unsigned)r17) ) goto label$a3ed764_5_234;
	r16 = 0;
	goto label$a3ed764_5_238;
	label$a3ed764_5_234:
	r15 = r14->bytes;
	r17 = 2;
	r17 = r16 << r17;
	r16 = *(int*)(r15 + r17);
	label$a3ed764_5_238:
	r22 = String_charAt(r1,r16);
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_242;
	hl_types_ArrayObj___expand(r13,r12);
	label$a3ed764_5_242:
	r10 = r13->array;
	((String*)(r10 + 1))[r12] = r22;
	label$a3ed764_5_244:
	if( r13 == NULL ) hl_null_access();
	r12 = 0;
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_251;
	r22 = NULL;
	goto label$a3ed764_5_254;
	label$a3ed764_5_251:
	r10 = r13->array;
	r8 = ((vdynamic**)(r10 + 1))[r12];
	r22 = (String)r8;
	label$a3ed764_5_254:
	r24 = (String)s$7215ee9;
	if( r22 == r24 || (r22 && r24 && String___compare(r22,(vdynamic*)r24) == 0) ) goto label$a3ed764_5_266;
	r12 = 0;
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_261;
	r22 = NULL;
	goto label$a3ed764_5_264;
	label$a3ed764_5_261:
	r10 = r13->array;
	r8 = ((vdynamic**)(r10 + 1))[r12];
	r22 = (String)r8;
	label$a3ed764_5_264:
	r24 = (String)s$5e732a1;
	if( r22 != r24 && (!r22 || !r24 || String___compare(r22,(vdynamic*)r24) != 0) ) goto label$a3ed764_5_286;
	label$a3ed764_5_266:
	r12 = 0;
	if( r1 == NULL ) hl_null_access();
	if( r14 == NULL ) hl_null_access();
	r16 = 0;
	r17 = r14->length;
	if( ((unsigned)r16) < ((unsigned)r17) ) goto label$a3ed764_5_273;
	hl_types_ArrayBytes_Int___expand(r14,r16);
	label$a3ed764_5_273:
	r15 = r14->bytes;
	r17 = 2;
	r17 = r16 << r17;
	r23 = *(int*)(r15 + r17);
	++r23;
	*(int*)(r15 + r17) = r23;
	r22 = String_charAt(r1,r23);
	r16 = r13->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_283;
	hl_types_ArrayObj___expand(r13,r12);
	label$a3ed764_5_283:
	r10 = r13->array;
	((String*)(r10 + 1))[r12] = r22;
	goto label$a3ed764_5_244;
	label$a3ed764_5_286:
	if( r14 == NULL ) hl_null_access();
	r12 = 0;
	r16 = r14->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_291;
	hl_types_ArrayBytes_Int___expand(r14,r12);
	label$a3ed764_5_291:
	r15 = r14->bytes;
	r16 = 2;
	r16 = r12 << r16;
	r17 = *(int*)(r15 + r16);
	--r17;
	*(int*)(r15 + r16) = r17;
	label$a3ed764_5_297:
	r12 = 0;
	r16 = r14->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_301;
	hl_types_ArrayBytes_Int___expand(r14,r12);
	label$a3ed764_5_301:
	r15 = r14->bytes;
	r16 = 2;
	r16 = r12 << r16;
	r17 = *(int*)(r15 + r16);
	++r17;
	*(int*)(r15 + r16) = r17;
	goto label$a3ed764_5_49;
	label$a3ed764_5_308:
	if( r9 == NULL ) hl_null_access();
	r12 = hl_types_ArrayObj_push(r9,((vdynamic*)r2));
	r12 = 0;
	r16 = r9->length;
	if( ((unsigned)r12) < ((unsigned)r16) ) goto label$a3ed764_5_315;
	r7 = NULL;
	goto label$a3ed764_5_318;
	label$a3ed764_5_315:
	r10 = r9->array;
	r8 = ((vdynamic**)(r10 + 1))[r12];
	r7 = (String)r8;
	label$a3ed764_5_318:
	r26 = r0->aliases;
	if( r26 == NULL ) hl_null_access();
	r25 = haxe_ds_StringMap_exists(r26,r7);
	if( !r25 ) goto label$a3ed764_5_327;
	r26 = r0->aliases;
	if( r26 == NULL ) hl_null_access();
	r8 = haxe_ds_StringMap_get(r26,r7);
	r22 = (String)r8;
	r7 = r22;
	label$a3ed764_5_327:
	r26 = r0->commands;
	if( r26 == NULL ) hl_null_access();
	r8 = haxe_ds_StringMap_get(r26,r7);
	r27 = hl_to_virtual(&t$vrt_a6bfc9e,(vdynamic*)r8);
	if( r27 ) goto label$a3ed764_5_339;
	r22 = (String)s$Unknown_command_;
	r22 = String___add__(r22,r7);
	r24 = (String)s$b15835f;
	r22 = String___add__(r22,r24);
	r4 = hl_alloc_dynamic(&t$_i32);
	r4->v.i = r5;
	h2d_Console_log(((h2d__Console)r0),r22,r4);
	return;
	label$a3ed764_5_339:
	r28 = (hl__types__ArrayDyn)hl_alloc_obj(&t$hl_types_ArrayDyn);
	hl_types_ArrayDyn_new(r28);
	r12 = 0;
	if( r27 == NULL ) hl_null_access();
	r20 = hl_vfields(r27)[0] ? (*(hl__types__ArrayObj*)(hl_vfields(r27)[0])) : (hl__types__ArrayObj)hl_dyn_getp(r27->value,7638631/*args*/,&t$hl_types_ArrayObj);
	if( r20 == NULL ) hl_null_access();
	r16 = r20->length;
	label$a3ed764_5_346:
	if( r12 >= r16 ) goto label$a3ed764_5_539;
	r17 = r12;
	++r12;
	if( r27 == NULL ) hl_null_access();
	r20 = hl_vfields(r27)[0] ? (*(hl__types__ArrayObj*)(hl_vfields(r27)[0])) : (hl__types__ArrayObj)hl_dyn_getp(r27->value,7638631/*args*/,&t$hl_types_ArrayObj);
	if( r20 == NULL ) hl_null_access();
	r29 = r20->length;
	if( ((unsigned)r17) < ((unsigned)r29) ) goto label$a3ed764_5_357;
	r30 = NULL;
	goto label$a3ed764_5_360;
	label$a3ed764_5_357:
	r10 = r20->array;
	r8 = ((vdynamic**)(r10 + 1))[r17];
	r30 = hl_to_virtual(&t$vrt_6b9bbd4,(vdynamic*)r8);
	label$a3ed764_5_360:
	if( r9 == NULL ) hl_null_access();
	r29 = 1;
	r23 = r17 + r29;
	r29 = r9->length;
	if( ((unsigned)r23) < ((unsigned)r29) ) goto label$a3ed764_5_367;
	r22 = NULL;
	goto label$a3ed764_5_370;
	label$a3ed764_5_367:
	r10 = r9->array;
	r8 = ((vdynamic**)(r10 + 1))[r23];
	r22 = (String)r8;
	label$a3ed764_5_370:
	if( r22 ) goto label$a3ed764_5_385;
	if( r30 == NULL ) hl_null_access();
	r31 = hl_vfields(r30)[1] ? (*(vdynamic**)(hl_vfields(r30)[1])) : (vdynamic*)hl_dyn_getp(r30->value,5545011/*opt*/,&t$nul_bool);
	r25 = r31 ? r31->v.b : 0;
	if( !r25 ) goto label$a3ed764_5_379;
	if( r28 == NULL ) hl_null_access();
	r8 = NULL;
	r23 = hl_types_ArrayDyn_push(r28,r8);
	goto label$a3ed764_5_346;
	label$a3ed764_5_379:
	r24 = (String)s$Missing_argument_;
	r32 = hl_vfields(r30)[0] ? (*(String*)(hl_vfields(r30)[0])) : (String)hl_dyn_getp(r30->value,150958933/*name*/,&t$String);
	r24 = String___add__(r24,r32);
	r4 = hl_alloc_dynamic(&t$_i32);
	r4->v.i = r5;
	h2d_Console_log(((h2d__Console)r0),r24,r4);
	return;
	label$a3ed764_5_385:
	if( r30 == NULL ) hl_null_access();
	r33 = hl_vfields(r30)[2] ? (*(venum**)(hl_vfields(r30)[2])) : (venum*)hl_dyn_getp(r30->value,116/*t*/,&t$h2d_ConsoleArg);
	if( r33 == NULL ) hl_null_access();
	r23 = HL__ENUM_INDEX__(r33);
	switch(r23) {
		default:
			goto label$a3ed764_5_538;
		case 0:
			r4 = Std_parseInt(r22);
			if( r4 ) goto label$a3ed764_5_402;
			r24 = (String)s$;
			r24 = String___add__(r24,r22);
			r32 = (String)s$_should_be_Int_for_argument_;
			r24 = String___add__(r24,r32);
			r32 = hl_vfields(r30)[0] ? (*(String*)(hl_vfields(r30)[0])) : (String)hl_dyn_getp(r30->value,150958933/*name*/,&t$String);
			r24 = String___add__(r24,r32);
			r6 = hl_alloc_dynamic(&t$_i32);
			r6->v.i = r5;
			h2d_Console_log(((h2d__Console)r0),r24,r6);
			return;
			label$a3ed764_5_402:
			if( r28 == NULL ) hl_null_access();
			r23 = hl_types_ArrayDyn_push(r28,((vdynamic*)r4));
			goto label$a3ed764_5_538;
		case 1:
			r34 = Std_parseFloat(r22);
			r25 = hl_math_isnan(r34);
			if( !r25 ) goto label$a3ed764_5_417;
			r24 = (String)s$;
			r24 = String___add__(r24,r22);
			r32 = (String)s$_should_be_Float_for_argument_;
			r24 = String___add__(r24,r32);
			r32 = hl_vfields(r30)[0] ? (*(String*)(hl_vfields(r30)[0])) : (String)hl_dyn_getp(r30->value,150958933/*name*/,&t$String);
			r24 = String___add__(r24,r32);
			r4 = hl_alloc_dynamic(&t$_i32);
			r4->v.i = r5;
			h2d_Console_log(((h2d__Console)r0),r24,r4);
			return;
			label$a3ed764_5_417:
			if( r28 == NULL ) hl_null_access();
			r8 = hl_alloc_dynamic(&t$_f64);
			r8->v.d = r34;
			r23 = hl_types_ArrayDyn_push(r28,r8);
			goto label$a3ed764_5_538;
		case 2:
			if( r28 == NULL ) hl_null_access();
			r20 = hl_vfields(r27)[0] ? (*(hl__types__ArrayObj*)(hl_vfields(r27)[0])) : (hl__types__ArrayObj)hl_dyn_getp(r27->value,7638631/*args*/,&t$hl_types_ArrayObj);
			if( r20 == NULL ) hl_null_access();
			r23 = r20->length;
			r29 = 1;
			if( r23 != r29 ) goto label$a3ed764_5_443;
			if( r1 == NULL ) hl_null_access();
			r23 = 0;
			r29 = r9->length;
			if( ((unsigned)r23) < ((unsigned)r29) ) goto label$a3ed764_5_433;
			r32 = NULL;
			goto label$a3ed764_5_436;
			label$a3ed764_5_433:
			r10 = r9->array;
			r8 = ((vdynamic**)(r10 + 1))[r23];
			r32 = (String)r8;
			label$a3ed764_5_436:
			if( r32 == NULL ) hl_null_access();
			r23 = r32->length;
			r4 = NULL;
			r24 = String_substr(r1,r23,r4);
			r24 = StringTools_trim(r24);
			r8 = ((vdynamic*)r24);
			goto label$a3ed764_5_444;
			label$a3ed764_5_443:
			r8 = ((vdynamic*)r22);
			label$a3ed764_5_444:
			r23 = hl_types_ArrayDyn_push(r28,r8);
			goto label$a3ed764_5_538;
		case 3:
			if( !r22 ) goto label$a3ed764_5_455;
			r23 = r22->length;
			r29 = 1;
			if( r23 != r29 ) goto label$a3ed764_5_455;
			r15 = r22->bytes;
			r21 = (vbyte*)USTR("1");
			r23 = hl_string_compare(r15,r21,r23);
			r29 = 0;
			if( r23 == r29 ) goto label$a3ed764_5_491;
			label$a3ed764_5_455:
			if( !r22 ) goto label$a3ed764_5_464;
			r23 = r22->length;
			r29 = 4;
			if( r23 != r29 ) goto label$a3ed764_5_464;
			r15 = r22->bytes;
			r21 = (vbyte*)USTR("true");
			r23 = hl_string_compare(r15,r21,r23);
			r29 = 0;
			if( r23 == r29 ) goto label$a3ed764_5_491;
			label$a3ed764_5_464:
			if( !r22 ) goto label$a3ed764_5_473;
			r23 = r22->length;
			r29 = 1;
			if( r23 != r29 ) goto label$a3ed764_5_473;
			r15 = r22->bytes;
			r21 = (vbyte*)USTR("0");
			r23 = hl_string_compare(r15,r21,r23);
			r29 = 0;
			if( r23 == r29 ) goto label$a3ed764_5_496;
			label$a3ed764_5_473:
			if( !r22 ) goto label$a3ed764_5_482;
			r23 = r22->length;
			r29 = 5;
			if( r23 != r29 ) goto label$a3ed764_5_482;
			r15 = r22->bytes;
			r21 = (vbyte*)USTR("false");
			r23 = hl_string_compare(r15,r21,r23);
			r29 = 0;
			if( r23 == r29 ) goto label$a3ed764_5_496;
			label$a3ed764_5_482:
			r24 = (String)s$;
			r24 = String___add__(r24,r22);
			r32 = (String)s$_should_be_Bool_for_argument_;
			r24 = String___add__(r24,r32);
			r32 = hl_vfields(r30)[0] ? (*(String*)(hl_vfields(r30)[0])) : (String)hl_dyn_getp(r30->value,150958933/*name*/,&t$String);
			r24 = String___add__(r24,r32);
			r4 = hl_alloc_dynamic(&t$_i32);
			r4->v.i = r5;
			h2d_Console_log(((h2d__Console)r0),r24,r4);
			return;
			label$a3ed764_5_491:
			if( r28 == NULL ) hl_null_access();
			r25 = true;
			r8 = hl_alloc_dynbool(r25);
			r23 = hl_types_ArrayDyn_push(r28,r8);
			goto label$a3ed764_5_500;
			label$a3ed764_5_496:
			if( r28 == NULL ) hl_null_access();
			r25 = false;
			r8 = hl_alloc_dynbool(r25);
			r23 = hl_types_ArrayDyn_push(r28,r8);
			label$a3ed764_5_500:
			goto label$a3ed764_5_538;
		case 4:
			r20 = ((h2d_ConsoleArg_AEnum*)r33)->p0;
			r25 = false;
			r23 = 0;
			label$a3ed764_5_504:
			if( r20 == NULL ) hl_null_access();
			r35 = r20->length;
			if( r23 >= r35 ) goto label$a3ed764_5_522;
			r35 = r20->length;
			if( ((unsigned)r23) < ((unsigned)r35) ) goto label$a3ed764_5_512;
			r24 = NULL;
			goto label$a3ed764_5_515;
			label$a3ed764_5_512:
			r10 = r20->array;
			r8 = ((vdynamic**)(r10 + 1))[r23];
			r24 = (String)r8;
			label$a3ed764_5_515:
			++r23;
			if( r22 != r24 && (!r22 || !r24 || String___compare(r22,(vdynamic*)r24) != 0) ) goto label$a3ed764_5_521;
			r36 = true;
			r25 = r36;
			if( r28 == NULL ) hl_null_access();
			r29 = hl_types_ArrayDyn_push(r28,((vdynamic*)r24));
			label$a3ed764_5_521:
			goto label$a3ed764_5_504;
			label$a3ed764_5_522:
			if( r25 ) goto label$a3ed764_5_538;
			r24 = (String)s$;
			r24 = String___add__(r24,r22);
			r32 = (String)s$f380c35;
			r24 = String___add__(r24,r32);
			r32 = (String)s$b99834b;
			r32 = hl_types_ArrayObj_join(r20,r32);
			r24 = String___add__(r24,r32);
			r32 = (String)s$_for_argument_;
			r24 = String___add__(r24,r32);
			if( r30 == NULL ) hl_null_access();
			r32 = hl_vfields(r30)[0] ? (*(String*)(hl_vfields(r30)[0])) : (String)hl_dyn_getp(r30->value,150958933/*name*/,&t$String);
			r24 = String___add__(r24,r32);
			r4 = hl_alloc_dynamic(&t$_i32);
			r4->v.i = r5;
			h2d_Console_log(((h2d__Console)r0),r24,r4);
			return;
	}
	label$a3ed764_5_538:
	goto label$a3ed764_5_346;
	label$a3ed764_5_539:
	hl_trap(trap$0,r8,label$a3ed764_5_546);
	r8 = NULL;
	if( r27 == NULL ) hl_null_access();
	r37 = hl_vfields(r27)[1] ? (*(vdynamic**)(hl_vfields(r27)[1])) : (vdynamic*)hl_dyn_getp(r27->value,18576142/*callb*/,&t$_dyn);
	r8 = Reflect_callMethod(r8,r37,r28);
	hl_endtrap(trap$0);
	goto label$a3ed764_5_560;
	label$a3ed764_5_546:
	r37 = NULL;
	r38 = haxe_Exception_caught(r8);
	if( r38 == NULL ) hl_null_access();
	r37 = ((vdynamic* (*)(haxe__Exception))r38->$type->vobj_proto[0])(r38);
	r39 = ($String)g$_String;
	r25 = Std_isOfType(r37,((vdynamic*)r39));
	if( !r25 ) goto label$a3ed764_5_559;
	r22 = (String)hl_dyn_castp(&r37,&t$_dyn,&t$String);
	r24 = (String)s$ERROR_;
	r24 = String___add__(r24,r22);
	r4 = hl_alloc_dynamic(&t$_i32);
	r4->v.i = r5;
	h2d_Console_log(((h2d__Console)r0),r24,r4);
	goto label$a3ed764_5_560;
	label$a3ed764_5_559:
	hl_throw((vdynamic*)r8);
	label$a3ed764_5_560:
	return;
}

