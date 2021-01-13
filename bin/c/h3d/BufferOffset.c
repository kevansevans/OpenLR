﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
#include <h3d/BufferOffset.h>
void h3d_Buffer_dispose(h3d__Buffer);

void h3d_BufferOffset_new(h3d__BufferOffset r0,h3d__Buffer r1,int r2) {
	r0->buffer = r1;
	r0->offset = r2;
	return;
}

void h3d_BufferOffset_dispose(h3d__BufferOffset r0) {
	h3d__BufferOffset r3;
	h3d__Buffer r2;
	r2 = r0->buffer;
	if( !r2 ) goto label$5d20424_2_7;
	r2 = r0->buffer;
	if( r2 == NULL ) hl_null_access();
	h3d_Buffer_dispose(r2);
	r2 = NULL;
	r0->buffer = r2;
	label$5d20424_2_7:
	r3 = NULL;
	r0->next = r3;
	return;
}

