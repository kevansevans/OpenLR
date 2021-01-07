package components.physics;
import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class ScarfPoint extends RidePoint 
{
	public var airFriction:Float;
	public function new(_x:Float=0.0, _y:Float=0.0, _af:Float = 0.9) 
	{
		super(_x, _y);
		
		airFriction = _af;
		
	}
	
	override public function step(?_grav:Point):Void 
	{
		
		var g = _grav == null ? grav : _grav;
		
		dir.x = (pos.x - vel.x) * airFriction + g.x;
		dir.y = (pos.y - vel.y) * airFriction + g.y;
		
		vel.x = pos.x;
		vel.y = pos.y;
		
		pos = pos.add(dir);
		
	}
	
}