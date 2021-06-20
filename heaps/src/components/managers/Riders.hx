package components.managers;

import hxlr.rider.RiderBase;
import hxlr.Constants;
import components.sledder.Bosh;
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
	}
	
	public function deleteAllRiders() {
		for (rider in riders) {
			rider.delete();
			riders.remove(rider.name);
		}
	}
	
	public function addNewRider(_start:Point, ?_name:String, ?_startFrame:Null<Int>, ?_endFrame:Null<Int>):RiderBase
	{
		
		var setName:String = _name == null ? Constants.names[riderCount % Constants.names.length] : _name;
		if (setName.length > 30) setName = setName.substr(0, 30);
		if (riders[setName] != null) {
			var occupiedSpace:Int = 0;
			while (riders[setName + occupiedSpace] != null) {
				++occupiedSpace;
			}
			Main.console.log('Rider name ${setName} already occupied, renaming to ${setName + occupiedSpace}');
			setName += "" + occupiedSpace;
		}
		var rider = new Bosh(_start.x, _start.y, setName, _startFrame, _endFrame);
		riders[setName] = rider;
		++riderCount;
		Main.simulation.recordGlobalSimState();
		return rider;
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
			rider.step();
		}
	}
	
	public function resetPositions() {
		for (rider in riders) {
			rider.reset();
		}
	}
	
	public function removeRider(_name:String) {
		
	}
	
}