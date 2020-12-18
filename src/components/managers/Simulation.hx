package components.managers;

import components.sledder.RiderBase;
import components.physics.RidePoint.PointState;
import haxe.PosInfos;

/**
 * ...
 * @author Kaelan
 */
class Simulation 
{
	public var frameStates:Map<RiderBase, Array<RiderState>>;
	public var flagPoint:Map<RiderBase, RiderState>;
	public var frames:Int = 0;
	
	public var playing:Bool = false;
	public var paused:Bool = false;
	public var rewinding:Bool = false;
	public var updating:Bool = false;
	
	@:isVar public var desiredSimSpeed(get, set):Float;
	public var fastForward:Int = 1;
	
	public function new() 
	{
		frameStates = new Map();
		
		desiredSimSpeed = 40;
		
		recordGlobalSimState();
		
		restoreState(0);
	}
	
	var timeDelta:Float = 0.0;
	public function startSim() {
		
		if (Main.riders.riderCount == 0) {
			Main.console.log("No riders in current track", 0xFF0000);
			return;
		}
		
		playing = true;
		paused = false;
		timeDelta = 0;
		if (flagPoint != null) restoreFlagPoint();
		else restoreState(0);
	}
	
	public function pauseSim() {
		if (!playing && !paused) {
			startSim();
			return;
		}
		playing = false;
		paused = true;
	}
	public function resumeSim() {
		playing = true;
		paused = false;
	}
	
	public function endSim() {
		playing = false;
		timeDelta = 0;
		if (flagPoint != null) restoreFlagPoint();
		else restoreState(0);
	}
	public function playSim(_delta:Float) {
		
		timeDelta += _delta;
		while (timeDelta >= desiredSimSpeed) {
			stepSim();
			timeDelta -= desiredSimSpeed;
		}
	}
	public function rewindSim(_delta:Float) {
		timeDelta += _delta;
		while (timeDelta >= desiredSimSpeed) {
			restoreState(frames -= 1);
			timeDelta -= desiredSimSpeed;
		}
	}
	
	public function stepSim() {
		++frames;
		Main.riders.stepRiders();
		recordGlobalSimState();
	}
	
	public function backSim() {
		restoreState(frames -= 1);
	}
	
	public function quickUpdate() {
		backSim();
		stepSim();
	}
	
	public function restoreState(_frame:Int) {
		var locframe = Std.int(Math.max(_frame, 0));
		frames = locframe;
		for (rider in Main.riders.riders) {
			var state = frameStates[rider][locframe];
			if (state == null) {
				recordRiderState(rider, frames);
				continue;
			}
			rider.crashed = state.crashed;
			for (point in 0...rider.ridePoints.length) {
				rider.ridePoints[point].restoreState(state.points[point]);
			}
		}
	}
	
	public function setFlagPoint() {
		flagPoint = new Map();
		for (rider in Main.riders.riders) {
			flagPoint[rider] = frameStates[rider][frames];
		}
	}
	
	public function restoreFlagPoint() {
		
	}
	
	public function destroyFlagPoint() {
		flagPoint = null;
	}
	
	public function recordGlobalSimState() {
		for (rider in Main.riders.riders) {
			recordRiderState(rider, frames);
		}
	}
	
	public function recordRiderState(_rider:RiderBase, _frame:Int) {
		if (frameStates[_rider] == null) frameStates[_rider] = new Array();
		var stat:RiderState = {
			crashed : _rider.crashed,
			points : new Array()
		}
		frameStates[_rider][_frame] = stat;
		var _points:Array<PointState> = new Array();
		for (point in _rider.ridePoints) {
			_points.push(point.saveState());
		}
		frameStates[_rider][_frame].points = _points;
	}
	
	var rewindPoint:Int = 0;
	var returnPoint:Int = 0;
	public function updateSimHistory(_minFrame:Int) {
		return;
		if (updating) return;
		updating = true;
		playing = false;
		returnPoint = Std.int(Math.max(frames - 1, 0));
		rewindPoint = Std.int(Math.max(_minFrame - 1, 0));
		restoreState(rewindPoint);
	}
	public function updateSim() {
		for (a in 0...40) {
			stepSim();
			if (frames >= returnPoint) {
				updating = false;
				frames = rewindPoint;
				restoreState(rewindPoint);
				return ;
			}
		}
	}
	
	var localRiderFrame:Int = 0;
	public function catchRiderUp(_rider:RiderBase) 
	{
		localRiderFrame = 0;
	}
	
	function get_desiredSimSpeed():Float 
	{
		return desiredSimSpeed;
	}
	
	function set_desiredSimSpeed(value:Float):Float 
	{
		return desiredSimSpeed = 1 / value;
	}
	
}

typedef RiderState = {
	var crashed:Bool;
	var points:Array<PointState>;
}