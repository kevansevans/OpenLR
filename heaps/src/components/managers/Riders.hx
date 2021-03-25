package components.managers;

import hxlr.rider.RiderBase;

import components.sledder.Bosh;
import network.NetAction;
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
		
		#if js
		
		if (Main.p2p.connected) {
			
			Main.p2p.updateRiderData(NetAction.addRider, 
				[
					riders[setName].name, 
					riders[setName].startPos.x, 
					riders[setName].startPos.y,
					riders[setName].enabledFrame,
					riders[setName].disableFrame,
					
				]
			);
			
		}
		
		#end
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
		//riders[_name].delete();
		
		#if js
		if (Main.p2p.connected) {
			Main.p2p.updateRiderData(NetAction.removeRider, [_name]);
		}
		#end
	}
	
	#if js
	
	public function P2PAddRider(_name:String, _x:Float, _y:Float, _startFrame:Null<Int>, _endFrame:Null<Int>) {
		riders[_name] = new Bosh(_x, _y, _name, _startFrame, _endFrame);
		++riderCount;
		Main.simulation.recordGlobalSimState();
	}
	
	public function P2PRemoveRider(_name:String) {
		//riders[_name].delete();
	}
	
	public function P2PUpdateRider() {
		
	}
	
	#end
	
}