package components.physics;

/**
 * ...
 * @author Kaelan
 */
class ScarfStick extends Stick 
{

	public function new(_a:RidePoint, _b:RidePoint) 
	{
		super(_a, _b);
	}
	
	override public function satisfy(?_crashed:Bool):Bool 
	{
		var xDist = a.pos.x - b.pos.x;
		var yDist = a.pos.y - b.pos.y;
		var dist = Math.sqrt(Math.pow(xDist, 2) + Math.pow(yDist, 2));
		var adjust = dist == 0 ? 0 : (dist - restLength) / dist * 0.5;
		var xAdjust = xDist * adjust;
		var yAdjust = yDist * adjust;
		
		b.pos.x = b.pos.x + xAdjust;
		b.pos.y = b.pos.y + yAdjust;
		
		return _crashed;
	}
	
}