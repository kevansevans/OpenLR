package hxlr.rider;

import hxlr.rider.ContactPoint;
import hxlr.math.geom.Point;

/**
 * ...
 * @author Kaelan
 */
class AirPoint extends ContactPoint
{
	
	public function new(_x:Float, _y:Float, _af:Float) 
	{
		
		super(_x, _y);
		
		friction = _af;
		
	}
	
	override public function iterate(?_gravity:Point) 
	{
		
		var g = _gravity == null ? gravity : _gravity;
		
		dir.x = (pos.x - vel.x) * friction + g.x;
		dir.y = (pos.y - vel.y) * friction + g.y;
		
		vel = pos.clone();
		
		pos = pos.add(dir);
		
	}
	
}