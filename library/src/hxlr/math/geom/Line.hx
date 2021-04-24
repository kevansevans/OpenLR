package hxlr.math.geom;

import hxlr.math.geom.Point;

/**
 * ...
 * @author Kaelan
 */
class Line 
{
	public var start:Point;
	public var end:Point;
	
	public var length(get, set):Float;
	public var angle(get, set):Float;
	
	public function new(_start:Point, _end:Point) 
	{
		start = _start;
		end = _end;
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
	}
	
	function set_angle(value:Float):Float 
	{
		return angle;
	}
}