package components.physics;

/**
 * ...
 * @author Kaelan
 */
class RepellStick extends Stick 
{

	public function new(_a:RidePoint, _b:RidePoint) 
	{
		super(_a, _b);
	}
	
	override public function satisfy(?_crashed:Bool):Bool
	{
		var dist = Math.sqrt(Math.pow(a.pos.x - b.pos.x, 2) + Math.pow(a.pos.y - b.pos.y, 2));
		
		if (dist < restLength) {
			var ratio = dist == 0 ? 0 : (dist - restLength) / dist * 0.5;
			a.pos.x -= (a.pos.x - b.pos.x) * ratio;
			a.pos.y -= (a.pos.y - b.pos.y) * ratio;
			b.pos.x += (a.pos.x - b.pos.x) * ratio;
			b.pos.y += (a.pos.y - b.pos.y) * ratio;
		}
		
		return _crashed;
	}
}