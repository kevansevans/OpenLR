package components.physics;

/**
 * ...
 * @author Kaelan
 */
class BindStick extends Stick 
{
	var endurance:Float;
	public static var crash:Bool = false;
	public function new(_a:RidePoint, _b:RidePoint, _endurance:Float) 
	{
		super(_a, _b);
		endurance = _endurance * restLength * 0.5;
	}
	override public function satisfy(?_crashed:Bool):Bool
	{
		var xDist = a.pos.x - b.pos.x;
		var yDist = a.pos.y - b.pos.y;
		var dist = Math.sqrt(Math.pow(xDist, 2) + Math.pow(yDist, 2));
		var adjust = dist == 0 ? 0 : (dist - restLength) / dist * 0.5;
		
		if (adjust > endurance || _crashed) {
			return true;
		}
		
		var xAdjust = xDist * adjust;
		var yAdjust = yDist * adjust;
		
		a.pos.x = a.pos.x - xAdjust;
		a.pos.y = a.pos.y - yAdjust;
		b.pos.x = b.pos.x + xAdjust;
		b.pos.y = b.pos.y + yAdjust;
		
		return _crashed;
	}
}