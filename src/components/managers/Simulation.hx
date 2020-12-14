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
	
	@:isVar public var desiredSimSpeed(get, set):Float;
	public var fastForward:Int = 1;
	
	public function new() 
	{
		frameStates = new Map();
		
		desiredSimSpeed = 40;
		
		record();
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
		}
	}
	public function rewindSim(_delta:Float) {
		if (frames <= 0) {
			frames = 0;
			return;
		}
		timeDelta += _delta;
		while (timeDelta >= desiredSimSpeed) {
			restoreState();
			timeDelta -= desiredSimSpeed;
		}
	}
	
	public function stepSim() {
		Main.riders.stepRiders();
		record();
		++frames;
	}
	
	public function backSim() {
		restoreState();
	}
	
	public function restoreState(?_frame:Int) {
		var locframe:Int = 0;
		if (_frame == null) {
			frames -= 1;
			locframe = frames;
		} else  {
			locframe = _frame;
		}
		frames = locframe;
		for (rider in Main.riders.riders) {
			var state = frameStates[rider][locframe];
			trace(state);
			rider.crashed = state.crashed;
			for (point in 0...rider.ridePoints.length) {
				rider.ridePoints[point].restoreState(state.points[point]);
			}
			rider.drawContactPoints();
		}
	}
	
	public function record() {
		for (rider in Main.riders.riders) {
			if (frameStates[rider] == null) frameStates[rider] = new Array();
			if (frameStates[rider][frames] == null) {
				var stat:RiderState = {
					crashed : rider.crashed,
					points : new Array()
				}
				frameStates[rider][frames] = stat;
			}
			frameStates[rider][frames].crashed = rider.crashed;
			var _points:Array<PointState> = new Array();
			for (point in rider.ridePoints) {
				_points.push(point.saveState());
			}
			frameStates[rider][frames].points = _points;
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