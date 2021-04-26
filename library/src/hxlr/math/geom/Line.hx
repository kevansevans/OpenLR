package hxlr.math.geom;

import hxlr.math.geom.Point;

/**
 * ...
 * @author Kaelan
 */

enum Slope 
{
	VALUE(y:Float, x:Float);
	INFINITE;
	NONE;
}

enum Side 
{
	LEFT;
	RIGHT;
}
 
class Line 
{
	public var start:Point;
	public var end:Point;
	
	public var length(get, set):Float;
	public var angle(get, set):Float;
	public var slope(get, null):Slope;
	
	public function new(_start:Point, _end:Point) 
	{
		start = _start;
		end = _end;
	}
	
	public function getSide(_point:Point):Side
	{
		var dx:Float = _point.x - start.x;
		var dy:Float = _point.y - start.y;
		
		if ((dx * (end.y - start.y)) - (dy * (end.x - start.x)) < 0) return RIGHT;
		return LEFT;
	}
	
	public function intersects(_line:Line):Bool
	{
		return false;
	}
	
	function get_length():Float 
	{
		return Math.sqrt(Math.pow(end.x - start.x, 2) + Math.pow(end.y - start.y, 2));
	}
	
	function set_length(value:Float):Float 
	{
		
		end.x = start.x + (value * Math.cos(angle));
		end.y = start.y + (value * Math.sin(angle));
		return length;
	}
	
	function get_angle():Float 
	{
		var dx = end.x - start.x;
		var dy = end.y - start.y;
		var theta = Math.atan(dy / dx);
		return theta * (180 / Math.PI);
	function get_slope():Slope 
	{
		if (start.x == end.x) return INFINITE;
		if (start.y == end.y) return NONE;
		
		var yslope = (end.y - start.y) / (end.x - start.x);
		var xslope = (end.x - start.x) / (end.y - start.y);
		
		return VALUE(yslope, xslope);
	}
	
	function set_angle(value:Float):Float 
	{
		return angle;
	}
}