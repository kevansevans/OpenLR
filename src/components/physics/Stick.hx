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
		var xDist = a.pos.x - b.pos.x;
		var yDist = a.pos.y - b.pos.y;
		var dist = Math.sqrt(xDist * xDist + yDist * yDist);
		
		var adjust:Null<Float> = null;
		if (dist == 0) adjust = 0;
		else adjust = (dist - restLength) / dist * 0.5;
		
		var xAdjust = xDist * adjust;
		var yAdjust = yDist * adjust;
		
		a.pos.x = a.pos.x - xAdjust;
		a.pos.y = a.pos.y - yAdjust;
		b.pos.x = b.pos.x + xAdjust;
		b.pos.y = b.pos.y + yAdjust;
		
		return _crashed;
	}
}