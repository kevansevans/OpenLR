package hxlr.engine;

import hxlr.engine.RiderManager;
import hxlr.lines.LineObject;
import hxlr.rider.RiderBase;
import hxlr.rider.ContactPoint;

/**
 * ...
 * @author Kaelan
 */
class Simulation 
{
	public static var self:Simulation;
	
	public var frameStates:Map<RiderBase, Array<RiderState>>;
	public var frames:Int = 0;
	
	public var playing:Bool = false;
	public var paused:Bool = false;
	public var rewinding:Bool = false;
	
	public var flagged:Bool = false;
	public var flagframe:Int = 0;
	
	@:isVar public var desiredSimSpeed(get, set):Float;
	public var fastForward:Int = 1;
	
	public function new() 
	{
		frameStates = new Map();
		
		desiredSimSpeed = 40;
		
		recordGlobalSimState();
		
		restoreState(0);
		
		self = this;
	}
	
	var timeDelta:Float = 0.0;
	public function startSim() {
		
		if (RiderManager.riderCount == 0) {
			return;
		}
		
		playing = true;
		paused = false;
		timeDelta = 0;
		if (flagged) restoreState(flagframe);
		else restoreState(0);
		
		#if hl
		//Main.audio.stopMusic();
		//Main.audio.playMusic(frames);
		#end
		
		Main.camera.start();
	}
	
	public function pauseSim() {
		if (!playing && !paused) return;
		else {
			if (!paused) {
				playing = false;
				paused = true;
			} else {
				playing = true;
				paused = false;
			}
		}
	}
	public function resumeSim() {
		playing = true;
		paused = false;
		#if hl
		//Main.audio.playMusic(frames);
		#end
	}
	
	public function endSim() {
		
		if (playing) Main.camera.stop();
		
		playing = false;
		paused = false;
		timeDelta = 0;
		if (flagged) restoreState(flagframe);
		else restoreState(0);
	}
	public function playSim(_delta:Float) {
		
		timeDelta += _delta;
		if (timeDelta >= desiredSimSpeed) {
			stepSim();
			timeDelta = 0;
		}
	}
	public function rewindSim(_delta:Float) {
		timeDelta += _delta;
		while (timeDelta >= desiredSimSpeed) {
			restoreState(frames -= 1);
			timeDelta -= desiredSimSpeed;
		}
	}
	
	public function updateSim(_line:LineObject)
	{
		var anchor:Float = Math.POSITIVE_INFINITY;
		
		for (key in _line.keyList)
		{
			var cell = Grid.registry[key];
			if (cell.lowestFrame == Math.POSITIVE_INFINITY) continue;
			else if (cell.lowestFrame < anchor) anchor = cell.lowestFrame;
			trace(cell.lowestFrame);
		}
		
		if (anchor != Math.POSITIVE_INFINITY)
		{
			var returnPos:Int = frames;
			var endUpdate:Int = returnPos > flagframe ? returnPos : flagframe;
			++endUpdate;
			var rewind:Int = Std.int(Math.max(anchor - 1, 0));
			
			if (rewind == 0) {
				RiderManager.resetRiders();
			}
			else restoreState(rewind);
			
			frames = rewind;
			
			for (key in _line.keyList)
			{
				Grid.registry[key].lowestFrame = Math.POSITIVE_INFINITY;
			}
			
			for (step in rewind...endUpdate)
			{
				stepSim();
			}
			
			restoreState(returnPos);
			
			for (rider in RiderManager.riderList) {
				rider.refreshRider();
				rider.renderRider();
			}
		}
	}
	
	public function stepSim() {
		++frames;
		RiderManager.stepRiders();
		recordGlobalSimState();
	}
	
	public function backSim() {
		restoreState(frames -= 1);
	}
	
	public function quickUpdate() {
		backSim();
		stepSim();
	}
	
	public function setFlagState() {
		
		flagged = (playing == true || paused == true) ? true : !flagged;
		
		if (flagged && (playing || paused)) {
			flagframe = frames;
		}
		
	}
	
	public function restoreState(_frame:Int) {
		var locframe = Std.int(Math.max(_frame, 0));
		frames = locframe;
		for (rider in RiderManager.riderList) {
			if (frameStates[rider] == null) recordRiderState(rider, _frame);
			var state = frameStates[rider][locframe];
			if (state == null) {
				recordRiderState(rider, frames);
				continue;
			}
			rider.crashed = state.crashed;
			for (point in 0...rider.contactPoints.length) {
				rider.contactPoints[point].deserialize(state.points[point]);
			}
			for (point in 0...rider.airPoints.length) {
				rider.airPoints[point].deserialize(state.scarves[point]);
			}
		}
	}
	
	public function recordGlobalSimState(?_frame:Int = null) {
		for (rider in RiderManager.riderList) {
			recordRiderState(rider, _frame == null ? frames : _frame);
		}
	}
	
	public function recordRiderState(_rider:RiderBase, _frame:Int) {
		if (frameStates[_rider] == null) frameStates[_rider] = new Array();
		var stat:RiderState = {
			crashed : _rider.crashed,
			points : new Array(),
			scarves : new Array()
		}
		frameStates[_rider][_frame] = stat;
		var _points:Array<PointContainer> = new Array();
		var _scarves:Array<PointContainer> = new Array();
		for (point in _rider.contactPoints) {
			_points.push(point.serialize());
		}
		for (point in _rider.airPoints) {
			_scarves.push(point.serialize());
		}
		frameStates[_rider][_frame].points = _points;
		frameStates[_rider][_frame].scarves = _scarves;
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
	var points:Array<PointContainer>;
	var scarves:Array<PointContainer>;
}