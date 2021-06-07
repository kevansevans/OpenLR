package hxlr.enums;

/**
 * @author Kaelan
 */
enum abstract LineType(Int) from Int to Int 
{
	var NULL:Int = -1;
	var FLOOR:Int = 0;
	var ACCEL:Int = 1;
	var SCENE:Int = 2;
}