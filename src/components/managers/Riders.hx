package components.managers;
import components.physics.BindStick;
import components.sledder.Bosh;
import components.sledder.RiderBase;
import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class Riders 
{
	public var riders:Map<String, RiderBase>;
	
	public function new() 
	{
		riders = new Map();
		
		var defaultRider:RiderBase = new Bosh();
		riders[defaultRider.name] = defaultRider;
	}
	
	public function stepRiders() {
		for (rider in riders) {
			rider.iterate();
			for (iteration in 0...6) {
				rider.constrainBones();
				rider.collision();
			}
		}
	}
	
	public function resetPositions() {
		BindStick.crash = false;
		for (rider in riders) {
			rider.reset();
		}
	}
	
}