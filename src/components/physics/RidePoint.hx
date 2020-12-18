package components.physics;

import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class RidePoint 
{
	public var pos:Point;
	public var dir:Point;
	public var vel:Point;
	
	public var friction:Float;
	
	public var grav:Point = null;
	
	public function new(_x:Float = 0.0, _y:Float = 0.0, _fric:Float = 0.0) 
	{
		pos = new Point(_x, _y);
		dir = new Point();
		vel = new Point();
		
		friction = _fric;
	}
	
	public function step(?_grav:Point)
	{
		var g = _grav == null ? grav : _grav;
		
		dir.x = pos.x - vel.x + g.x;
		dir.y = pos.y - vel.y + g.y;
		
		vel.x = pos.x;
		vel.y = pos.y;
		
		pos = pos.add(dir);
	}
	
	public function saveState():PointState
	{
		var state:PointState = {
			position : pos.clone(),
			velocity : vel.clone()
		}
		return state;
	}
	
	public function restoreState(_state:PointState) {
		pos = _state.position.clone();
		vel = _state.velocity.clone();
	}
	
}

typedef PointState = {
	var position:Point;
	var velocity:Point;
}