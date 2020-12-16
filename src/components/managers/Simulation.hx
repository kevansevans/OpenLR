package components.managers;

import components.sledder.RiderBase;
import components.physics.RidePoint.PointState;

/**
 * ...
 * @author Kaelan
 */
class Simulation 
{
	public var frameStates:Map<RiderBase, Array<RiderState>>;
	public var frames:Int = 0;
	
	public var playing:Bool = false;
	public var rewinding:Bool = false;
	public var updating:Bool = false;
	
	public var bgFrames:Int = 0;
	
	@:isVar public var desiredSimSpeed(get, set):Float;
	public var fastForward:Int = 1;
	
	public function new() 
	{
		frameStates = new Map();
		
		desiredSimSpeed = 40;
		
		recordGlobalSimState();
	}
	
	var timeDelta:Float = 0.0;
	public function startSim() {
		playing = true;
		timeDelta = 0;
	}
	public function endSim() {
		playing = false;
		timeDelta = 0;
	}
	public function playSim(_delta:Float) {
		
		timeDelta += _delta;
		while (timeDelta >= desiredSimSpeed) {
			stepSim();
			timeDelta -= desiredSimSpeed;
			++frames;
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
		for (rider in Main.riders.riders) {
			var state = frameStates[rider][locframe];
			if (state == null) {
				recordRiderState(rider);
			}
			rider.crashed = state.crashed;
			for (point in 0...rider.ridePoints.length) {
				rider.ridePoints[point].restoreState(state.points[point]);
			}
		}
	}
	
	public function recordGlobalSimState() {
		for (rider in Main.riders.riders) {
			recordRiderState(rider);
		}
	}
	
	public function recordRiderState(_rider:RiderBase) {
		if (frameStates[_rider] == null) frameStates[_rider] = new Array();
			if (frameStates[_rider][frames] == null) {
				var stat:RiderState = {
					crashed : _rider.crashed,
					points : new Array()
				}
				frameStates[_rider][frames] = stat;
			}
			frameStates[_rider][frames].crashed = _rider.crashed;
			var _points:Array<PointState> = new Array();
			for (point in _rider.ridePoints) {
				_points.push(point.saveState());
			}
			frameStates[_rider][frames].points = _points;
	}
	
	var restorePoint:Int = 0;
	var maxPoint:Int = 0;
	var returnPoint:Int = 0;
	
	public function updateSimHistory(_minFrame:Int) {
		updating = true;
		var restorePoint = Std.int(Math.max(0, _minFrame - 10));
		var maxPoint = _minFrame + 40;
		returnPoint = frames;
		restoreState(restorePoint);
	}
	public function updateSim() {
		
		for (step in 0...40) {
			stepSim();
		}
		restorePoint += 40;
		if (restorePoint >= maxPoint) {
			restoreState(returnPoint);
			updating = false;
		}
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