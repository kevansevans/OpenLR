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
		var xDist = _point.pos.x - start.x;
		var yDist = _point.pos.y - start.y;
		var vDist = nx * xDist + ny * yDist; 					//How far perpendicularily the point is away from the line
		var hDist = (xDist * dx + yDist * dy) * invSqrDistance; //How far along parallel the point is along the line
		
		//is the point moving "towards" the line?
		if (_point.dir.x * nx + _point.dir.y * ny > 0)
		{
			//is the point within the line's range?
			if (vDist > 0 && vDist < zone && hDist >= limStart && hDist <= limEnd) {
				
				//Move the point onto the line
				_point.pos.x = _point.pos.x - vDist * nx;
				_point.pos.y = _point.pos.y - vDist * ny;
				
				//Change it's speed to reflect it "colliding"
				_point.vel.x = _point.vel.x + ny * _point.friction * vDist * (_point.vel.x < _point.pos.x ? 1 : -1);
				_point.vel.y = _point.vel.y - nx * _point.friction * vDist * (_point.vel.y < _point.pos.y ? -1 : 1);
				
				//"accelerate" the line
				_point.vel.x += accx;
				_point.vel.y += accy;
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