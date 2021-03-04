package hxlr.components;

import hxlr.components.ContactPoint;
import hxlr.math.LRPoint;

/**
 * ...
 * @author Kaelan
 */
class AirPoint extends ContactPoint
{

	public var airFriction:Float;
	
	public function new(_x:Float, _y:Float, _af:Float) 
	{
		
		super(_x, _y);
		
		airFriction = _af;
		
	}
	
	override public function iterate(?_gravity:LRPoint) 
	{
		
		var g = _gravity == null ? gravity : _gravity;
		
		dir.x = (pos.x - vel.x) * airFriction + g.x;
		dir.y = (pos.y - vel.y) * airFriction + g.y;
		
		vel = pos.clone();
		
		pos = pos.add(dir);
		
	}
	
}