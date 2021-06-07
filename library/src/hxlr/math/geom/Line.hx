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
		var o1 = orientation(start, end, _line.start);
		var o2 = orientation(start, end, _line.end);
		var o3 = orientation(_line.start, _line.end, start);
		var o4 = orientation(_line.start, _line.end, end);
		
		if (o1 != o2 && o3 != o4) return true;
		
		return false;
	}
	
	function orientation(_p:Point, _q:Point, _r:Point):Int
	{
		var value = (_q.y - _p.y) * (_r.x - _q.x) - (_q.x - _p.x) * (_r.y - _q.y);
		if (value == 0) return 0;
		return value > 0 ? 1 : 2;
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
		var theta = Math.atan2(dy, dx);
		return theta;
	}
	
	function get_slope():Slope 
	{
		if (start.x == end.x) return INFINITE;
		if (start.y == end.y) return NONE;
		
		var yslope = (end.y - start.y) / (end.x - start.x);
		var xslope = (end.x - start.x) / (end.y - start.y);
		
		return VALUE(yslope, xslope);
	}
	
	public function set_angle(value:Float):Float 
	{
		return angle;
	}
}