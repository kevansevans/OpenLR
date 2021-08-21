package hxlr.lines;

import hxlr.rider.ContactPoint;
import hxlr.math.geom.Point;

/**
 * ...
 * @author Kaelan
 */
class Accel extends LineObject 
{
	var accx:Float;
	var accy:Float;
	
	public function new(_start:Point, _end:Point, _shift:Bool = false, _limMode:Int = 0) 
	{
		super(_start, _end, _shift, _limMode);
		
		type = ACCEL;
		
		tangible = true;
	}
	
	override function calculateConstants():Void 
	{
		super.calculateConstants();
		
		accx = ny * (accConst * multiplier) * (shifted ? 1 : -1);
		accy = nx * (accConst * multiplier) * (shifted ? -1 : 1);
	}
	
	override public function collide(_point:ContactPoint):Void 
	{
		//crappy decompiler code
		var _loc5 = _point.pos.x - start.x;
		var _loc6 = _point.pos.y - start.y;
		var _loc4 = nx * _loc5 + ny * _loc6;
		var _loc7 = (_loc5 * dx + _loc6 * dy) * invSqrDistance;
		if (_point.dir.x * nx + _point.dir.y * ny > 0)
		{
			if (_loc4 > 0 && _loc4 < zone && _loc7 >= limStart && _loc7 <= limEnd) {
				_point.pos.x = _point.pos.x - _loc4 * nx;
				_point.pos.y = _point.pos.y - _loc4 * ny;
				_point.vel.x = _point.vel.x + ny * _point.friction * _loc4 * (_point.vel.x < _point.pos.x ? 1 : -1) + accx;
				_point.vel.y = _point.vel.y - nx * _point.friction * _loc4 * (_point.vel.y < _point.pos.y ? -1 : 1) + accy;
			}
		}
	}
	
	override function get_multiplier():Int 
	{
		return multiplier;
	}
	
	override function set_multiplier(value:Int):Int 
	{
		multiplier = value;
		calculateConstants();
		return value;
	}
}