﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <hxd/fs/FileInput.h>
#include <haxe/io/Bytes.h>

void hxd_fs_FileInput_new(hxd__fs__FileInput r0,hxd__fs__FileEntry r1) {
	r0->f = r1;
	if( r1 == NULL ) hl_null_access();
	((void (*)(hxd__fs__FileEntry))r1->$type->vobj_proto[1])(r1);
	return;
}

void hxd_fs_FileInput_skip(hxd__fs__FileInput r0,int r1) {
	hxd__fs__FileEntry r3;
	r3 = r0->f;
	if( r3 == NULL ) hl_null_access();
	((void (*)(hxd__fs__FileEntry,int))r3->$type->vobj_proto[2])(r3,r1);
	return;
}

int hxd_fs_FileInput_readByte(hxd__fs__FileInput r0) {
	hxd__fs__FileEntry r2;
	int r1;
	r2 = r0->f;
	if( r2 == NULL ) hl_null_access();
	r1 = ((int (*)(hxd__fs__FileEntry))r2->$type->vobj_proto[3])(r2);
	return r1;
}

int hxd_fs_FileInput_readBytes(hxd__fs__FileInput r0,haxe__io__Bytes r1,int r2,int r3) {
	hxd__fs__FileEntry r5;
	r5 = r0->f;
	if( r5 == NULL ) hl_null_access();
	((void (*)(hxd__fs__FileEntry,haxe__io__Bytes,int,int))r5->$type->vobj_proto[4])(r5,r1,r2,r3);
	return r3;
}

void hxd_fs_FileInput_close(hxd__fs__FileInput r0) {
	hxd__fs__FileEntry r2;
	r2 = r0->f;
	if( r2 == NULL ) hl_null_access();
	((void (*)(hxd__fs__FileEntry))r2->$type->vobj_proto[5])(r2);
	return;
}
