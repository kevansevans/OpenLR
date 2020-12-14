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
		var dist = Math.sqrt(Math.pow(a.pos.x - b.pos.x, 2) + Math.pow(a.pos.y - b.pos.y, 2));
		var ratio = (dist - restLength) / dist * 0.5;
		
		if (ratio > endurance || _crashed) {
			crash = true;
			return true;
		}
		
		a.pos.x -= (a.pos.x - b.pos.x) * ratio;
		a.pos.y -= (a.pos.y - b.pos.y) * ratio;
		b.pos.x += (a.pos.x - b.pos.x) * ratio;
		b.pos.y += (a.pos.y - b.pos.y) * ratio;
		
		return false;
	}
}