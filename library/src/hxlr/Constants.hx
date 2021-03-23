package hxlr;

import hxlr.rider.RiderStruct;
import hxlr.enums.StickType;

/**
 * ...
 * @author Kaelan
 */
class Constants 
{

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
			contactPoints : [
				{x: 0, y: 0, fr: 0.8},
				{x: 0, y: 10, fr: 0},
				{x: 30, y: 10, fr: 0},
				{x: 35, y: 0, fr: 0},
				{x: 10, y: 0, fr: 0.8},
				{x: 10, y: -11, fr: 0.8},
				{x: 23, y: -10, fr: 0.1},
				{x: 23, y: -10, fr: 0.1},
				{x: 20, y: 10, fr: 0},
				{x: 20, y: 10, fr: 0}
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
				{a: 0, b: 1, type: StickType.STANDARD, crashable: false},
				{a: 1, b: 2, type: StickType.STANDARD, crashable: false},
				{a: 2, b: 3, type: StickType.STANDARD, crashable: false},
				{a: 3, b: 0, type: StickType.STANDARD, crashable: false},
				{a: 0, b: 2, type: StickType.STANDARD, crashable: false},
				{a: 3, b: 1, type: StickType.STANDARD, crashable: false},
				
				{a: 0, b: 4, type: StickType.STANDARD, crashable: true},
				{a: 1, b: 4, type: StickType.STANDARD, crashable: true},
				{a: 2, b: 4, type: StickType.STANDARD, crashable: true},
				
				{a: 5, b: 4, type: StickType.STANDARD, crashable: false},
				{a: 5, b: 6, type: StickType.STANDARD, crashable: false},
				{a: 5, b: 7, type: StickType.STANDARD, crashable: false},
				{a: 4, b: 8, type: StickType.STANDARD, crashable: false},
				{a: 4, b: 9, type: StickType.STANDARD, crashable: false},
				{a: 5, b: 7, type: StickType.STANDARD, crashable: false},
				
				{a: 5, b: 0, type: StickType.STANDARD, crashable: true},
				{a: 3, b: 6, type: StickType.STANDARD, crashable: true},
				{a: 3, b: 7, type: StickType.STANDARD, crashable: true},
				{a: 8, b: 2, type: StickType.STANDARD, crashable: true},
				{a: 9, b: 2, type: StickType.STANDARD, crashable: true},
				
				{a: 5, b: 8, type: StickType.REPELL, crashable: false},
				{a: 5, b: 9, type: StickType.REPELL, crashable: false},
			],
			scarfAnchor : 5,
			colors : [
				0xD20202,
				0xFFFFFF,
				0xD20202,
				0xFFFFFF,
				0xD20202,
				0xFFFFFF,
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