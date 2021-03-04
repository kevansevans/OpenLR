package hxlr.components;

import hxlr.math.LRPoint;

/**
 * ...
 * @author Kaelan
 */
class ContactPoint
{
	
	public var pos:LRPoint;
	public var vel:LRPoint;
	public var dir:LRPoint;
	
	public var gravity:LRPoint;
	
	public var  friction:Float;
	
	public function new(_x:Float = 0.0, _y:Float = 0.0, _friction:Float = 0.0) 
	{
		pos = new LRPoint(_x, _y);
		dir = new LRPoint();
		vel = new LRPoint();
		
		friction = _friction;
	}
	
	public function iterate(?_gravity:LRPoint) {
		
		var g = _gravity == null ? gravity : _gravity;
		
		dir.x = pos.x - vel.x + g.x;
		dir.y = pos.y - vel.y + g.y;
		
		vel = pos.clone();
		
		pos = pos.add(dir);
		
	}
	
	public function serialize():PointContainer
	{
		var object:PointContainer = {
			position : pos,
			velocity : vel
		}
		return object;
	}
	
	public function deserialize(_object:PointContainer) {
		pos = _object.position;
		vel = _object.velocity;
	}
	
}

typedef PointContainer = {
	var position:LRPoint;
	var velocity:LRPoint;
}