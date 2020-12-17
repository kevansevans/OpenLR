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
	
	public var riderCount:Int = 0;
	
	public function new() 
	{
		riders = new Map();
		
		var defaultRider:RiderBase = new Bosh();
		riders[defaultRider.name] = defaultRider;
		
		++riderCount;
	}
	
	public function deleteAllRiders() {
		for (rider in riders) rider.delete();
	}
	
	public function addNewRider(_name:String, _start:Point)
	{
		var setName:String = _name;
		if (riders[setName] != null) {
			var occupiedSpace:Int = 0;
			while (riders[setName + occupiedSpace] != null) {
				++occupiedSpace;
			}
			Main.console.log('Rider name ${setName} already occupied, renaming to ${setName + occupiedSpace}');
			setName += "" + occupiedSpace;
		}
		riders[setName] = new Bosh(_start.x, _start.y, setName);
		++riderCount;
		Main.simulation.recordGlobalSimState();
	}
	
	public function renameRider(_old:String, _new:String) {
		if (riders[_old] == null) {
			Main.console.log('Rider ${_old} does not exist', 0xFF0000);
			return;
		}
		
		var setName:String = _new;
		if (riders[setName] != null) {
			var occupiedSpace:Int = 0;
			while (riders[setName + occupiedSpace] != null) {
				++occupiedSpace;
			}
			Main.console.log('Rider name ${setName} already occupied, renaming to ${setName + occupiedSpace}');
			setName += "" + occupiedSpace;
		}
		var rider = riders[_old];
		riders.remove(_old);
		rider.name = setName;
		riders[setName] = rider;
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