package hxlr;

import hxlr.rider.RiderStruct;
import hxlr.enums.StickType;

/**
 * ...
 * @author Kaelan
 */
class Constants 
{

	public static var minLineSize:Int = 10;
	public static var minSnapDistance:Int = 10;
	
	public static var x_gravity:Float = 0;
	public static var y_gravity:Float = 0.175;
	public static var x_velocity:Float = 0.4;
	public static var y_velocity:Float = 0;
	
	//use haxe.Json.stringify() to turn into JSON.
	public static function defaultRider():RiderStruct
	{
		var rider:RiderStruct = {
			scale : 0.5,
			x_grav : x_gravity,
			y_grav : y_gravity,
			x_vel : x_velocity,
			y_vel : y_velocity,
			camera : 4,
			contactPoints : [
				{x: 0, y: 0, fr: 0.8},		//Second	0
				{x: 0, y: 10, fr: 0},		//Tail		1
				{x: 30, y: 10, fr: 0},		//Nose		2
				{x: 35, y: 0, fr: 0},		//String	3
				{x: 10, y: 0, fr: 0.8},		//Butt		4
				{x: 10, y: -11, fr: 0.8},	//Shoulder	5
				{x: 23, y: -10, fr: 0.1},	//Hand A	6
				{x: 23, y: -10, fr: 0.1},	//Hand B	7
				{x: 20, y: 10, fr: 0},		//Foot A	8
				{x: 20, y: 10, fr: 0}		//Foot B	9
			],
			scarfPoints : [
				{x: 7, y: -10, fr: 0.9},
				{x: 3, y: -10, fr: 0.9},
				{x: 0, y: -10, fr: 0.9},
				{x: -4, y: -10, fr: 0.9},
				{x: -7, y: -10, fr: 0.9},
				{x: -11, y: -10, fr: 0.9}
			],
			bones : [
				{a: 0, b: 1, type: StickType.STANDARD, crashable: false},	//Second to Tail
				{a: 1, b: 2, type: StickType.STANDARD, crashable: false},	//Tail to Nose
				{a: 2, b: 3, type: StickType.STANDARD, crashable: false},	//Nose to String
				{a: 3, b: 0, type: StickType.STANDARD, crashable: false},	//String to Second
				{a: 0, b: 2, type: StickType.STANDARD, crashable: false},	//Second to nose
				{a: 3, b: 1, type: StickType.STANDARD, crashable: false},	//String to Tail
				
				{a: 0, b: 4, type: StickType.STANDARD, crashable: true},	//Second to Butt
				{a: 1, b: 4, type: StickType.STANDARD, crashable: true},	//Tail to Butt
				{a: 2, b: 4, type: StickType.STANDARD, crashable: true},	//Nose to Butt
				
				{a: 5, b: 4, type: StickType.STANDARD, crashable: false},	//Shoulder to butt
				{a: 5, b: 6, type: StickType.STANDARD, crashable: false},	//Shoulder to Hand A
				{a: 5, b: 7, type: StickType.STANDARD, crashable: false},	//Shoulder to Hand B
				{a: 4, b: 8, type: StickType.STANDARD, crashable: false},	//Butt to Foot A
				{a: 4, b: 9, type: StickType.STANDARD, crashable: false},	//But too Foot B
				{a: 5, b: 7, type: StickType.STANDARD, crashable: false},	//Shoulder to Hand A duplicate
				
				{a: 5, b: 0, type: StickType.STANDARD, crashable: true},	//Shoulder to Second
				{a: 3, b: 6, type: StickType.STANDARD, crashable: true},	//String to Hand A
				{a: 3, b: 7, type: StickType.STANDARD, crashable: true},	//String to Hand B
				{a: 8, b: 2, type: StickType.STANDARD, crashable: true},	//Foot A to Nose
				{a: 9, b: 2, type: StickType.STANDARD, crashable: true},	//Foot B to Nose
				
				{a: 5, b: 8, type: StickType.REPELL, crashable: false},		//Shoulder to Foot A
				{a: 5, b: 9, type: StickType.REPELL, crashable: false},		//Shoulder to Foot B
			],
			limits : [
				{
					point_a : 3,
					point_b : 0,
					point_c : 1,
					point_d : 0,
					threshold : 0,
					lessThan : true
				},
			],
			scarfAnchor : 5,
			colors : [
				0xD20202, //First five are reserved for the "neck" graphic
				0xFFFFFF,
				0xD20202,
				0xFFFFFF,
				0xD20202,
				0xFFFFFF, // First Scarf Point
				0xD20202,
				0xFFFFFF,
				0xD20202,
				0xFFFFFF,
				0xD20202
			]
		};
		return rider;
	}
	
	public function new() 
	{
		
	}
	
}