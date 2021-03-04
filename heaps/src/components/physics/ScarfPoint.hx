package components.physics;

import hxlr.math.LRPoint;
import hxlr.components.ContactPoint;

/**
 * ...
 * @author Kaelan
 */
class ScarfPoint extends ContactPoint
{
	public var airFriction:Float;
	public function new(_x:Float=0.0, _y:Float=0.0, _af:Float = 0.9) 
	{
		super(_x, _y);
		
		airFriction = _af;
		
	}
	
	override public function iterate(?_gravity:LRPoint):Void 
	{
		
		var g = _gravity == null ? gravity : _gravity;
		
		dir.x = (pos.x - vel.x) * airFriction + g.x;
		dir.y = (pos.y - vel.y) * airFriction + g.y;
		
		vel.x = pos.x;
		vel.y = pos.y;
		
		pos = pos.add(dir);
		
	}
	
}