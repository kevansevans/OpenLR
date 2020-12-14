package components.physics;
import components.physics.RidePoint;
import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class Stick 
{
	public var a:RidePoint;
	public var b:RidePoint;
	public var restLength:Float;
	public function new(_a:RidePoint, _b:RidePoint) 
	{
		a = _a;
		b = _b;
		restLength = Math.sqrt(Math.pow(_a.pos.x - b.pos.x, 2) + Math.pow(a.pos.y - b.pos.y, 2));
	}
	
	public function satisfy(?_crashed:Bool):Bool
	{
		var dist = Math.sqrt(Math.pow(a.pos.x - b.pos.x, 2) + Math.pow(a.pos.y - b.pos.y, 2));
		var ratio = (dist - restLength) / dist * 0.5;
		
		a.pos.x -= (a.pos.x - b.pos.x) * ratio;
		a.pos.y -= (a.pos.y - b.pos.y) * ratio;
		b.pos.x += (a.pos.x - b.pos.x) * ratio;
		b.pos.y += (a.pos.y - b.pos.y) * ratio;
		
		return _crashed;
	}
}