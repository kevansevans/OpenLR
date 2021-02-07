﻿// Generated by HLC 4.1.5 (HL v5)
#ifndef INC_components__physics__ScarfStick
#define INC_components__physics__ScarfStick
typedef struct _components__physics__$ScarfStick *components__physics__$ScarfStick;
typedef struct _components__physics__ScarfStick *components__physics__ScarfStick;
#include <hl/Class.h>
#include <hl/BaseType.h>
#include <_std/String.h>
#include <components/physics/Stick.h>
#include <components/physics/RidePoint.h>
#include <components/physics/StickType.h>
#include <components/sledder/RiderBase.h>


struct _components__physics__$ScarfStick {
	hl_type *$type;
	hl_type* __type__;
	vdynamic* __meta__;
	varray* __implementedBy__;
	String __name__;
	vdynamic* __constructor__;
};
struct _components__physics__ScarfStick {
	hl_type *$type;
	components__physics__RidePoint a;
	components__physics__RidePoint b;
	double restLength;
	bool enabled;
	bool breakable;
	bool broken;
	bool crashable;
	double endurance;
	vclosure* constrain;
	venum* type;
	components__sledder__RiderBase rider;
};
#endif
