package hxlr.rider;

import hxlr.enums.StickType;

/**
 * @author Kaelan
 */
typedef RiderStruct =
{
	var scale:Float;
	var contactPoints:Array<AnchorPoint>;
	var scarfPoints:Array<AnchorPoint>;
	var scarfAnchor:Int;
	var camera:Int;
	var bones:Array<BoneStruct>;
	var limits:Array<FakieLimit>;
	var colors:Array<Int>;
	var x_grav:Float;
	var y_grav:Float;
	var x_vel:Float;
	var y_vel:Float;
}

typedef FakieLimit = {
	var point_a:Int;
	var point_b:Int;
	var point_c:Int;
	var point_d:Int;
	var threshold:Int;
	var lessThan:Bool;
}

typedef AnchorPoint = {
	var x:Float;
	var y:Float;
	var fr:Float;
}

typedef BoneStruct = {
	var a:Int;
	var b:Int;
	var type:StickType;
	var crashable:Bool;
}
typedef Scarf = {
	var anchor:Int;
	var length:Int;
	var freqA:Int;
	var freqB:Int;
}