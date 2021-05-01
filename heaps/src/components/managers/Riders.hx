package components.managers;

import hxlr.rider.RiderBase;

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
		
		#if !embeded_track
		var defaultRider:RiderBase = new Bosh();
		riders[defaultRider.name] = defaultRider;
		
		++riderCount;
		#end
	}
	
	public function deleteAllRiders() {
		//for (rider in riders) rider.delete();
	}
	
	public function addNewRider(_name:String, _start:Point, ?_startFrame:Null<Int>, ?_endFrame:Null<Int>)
	{
		var setName:String = _name;
		if (setName.length > 30) setName = setName.substr(0, 30);
		if (riders[setName] != null) {
			var occupiedSpace:Int = 0;
			while (riders[setName + occupiedSpace] != null) {
				++occupiedSpace;
			}
			Main.console.log('Rider name ${setName} already occupied, renaming to ${setName + occupiedSpace}');
			setName += "" + occupiedSpace;
		}
		riders[setName] = new Bosh(_start.x, _start.y, setName, _startFrame, _endFrame);
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