package hxlr.rider;

import hxlr.math.geom.Point;

/**
 * ...
 * @author Kaelan
 */
class ContactPoint
{
	
	public var pos:Point;
	public var vel:Point;
	public var dir:Point;
	
	public var gravity:Point;
	
	public var friction:Float;
	
	public function new(_x:Float = 0.0, _y:Float = 0.0, _friction:Float = 0.0)
	{
		pos = new Point(_x, _y);
		dir = new Point();
		vel = new Point();
		
		friction = _friction;
	}
	
	public function iterate(?_gravity:Point) {
		
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
			velocity : vel,
			friction : friction
		}
		return object;
	}
	
	public function deserialize(_object:PointContainer) {
		pos = _object.position;
		vel = _object.velocity;
		friction = _object.friction;
	}
	
}

typedef PointContainer = {
	var position:Point;
	var velocity:Point;
	var friction:Float;
}