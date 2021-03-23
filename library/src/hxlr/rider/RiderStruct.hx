package hxlr.rider;

import hxlr.enums.StickType;
import hxlr.math.Point;
import hxlr.rider.ContactPoint;

/**
 * @author Kaelan
 */
typedef RiderStruct =
{
	var scale:Float;
	var contactPoints:Array<AnchorPoint>;
	var scarfPoints:Array<AnchorPoint>;
	var scarfAnchor:Int;
	var bones:Array<BoneStruct>;
	var colors:Array<Int>;
	var x_grav:Float;
	var y_grav:Float;
	var x_vel:Float;
	var y_vel:Float;
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