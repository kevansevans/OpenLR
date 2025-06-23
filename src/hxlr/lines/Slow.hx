package hxlr.lines;

import hxlr.math.geom.Point;
import hxlr.rider.ContactPoint;

/**
 * ...
 * @author Kaelan
 */
class Slow extends LineObject 
{
	public var slowby:Float = 0.3;
	
	public function new(_start:Point, _end:Point, _shift:Bool=false, ?_lim:Int=0) 
	{
		super(_start, _end, _shift, _lim);
		
		type = SLOW;
		
		tangible = true;
	}
	
	override public function collide(_point:ContactPoint):Bool
	{
		var xDist = _point.pos.x - start.x;
		var yDist = _point.pos.y - start.y;
		var vDist = nx * xDist + ny * yDist;					//How far perpendicularily the point is away from the line
		var hDist = (xDist * dx + yDist * dy) * invSqrDistance; //How far along parallel the point is along the line
		
		//is the point moving "towards" the line?
		if (_point.dir.x * nx + _point.dir.y * ny > 0)
		{
			//is the point within the line's range?
			if (vDist > 0 && vDist < zone && hDist >= limStart && hDist <= limEnd) {
				
				//Move the point onto the line
				_point.pos.x = _point.pos.x - vDist * nx;
				_point.pos.y = _point.pos.y - vDist * ny;
				
				//Change it's speed to reflect it "colliding" and decelerate
				_point.vel.x = _point.vel.x - slowby * ny * accConst * (_point.vel.x > _point.pos.x ? 1 : -1);
				_point.vel.y = _point.vel.y + slowby * nx * accConst * (_point.vel.y > _point.pos.y ? -1 : 1);
				
				return true;
			}
		}
		
		return false;
	}
	
}