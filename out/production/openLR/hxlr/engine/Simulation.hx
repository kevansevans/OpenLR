package hxlr.engine;

import hxlr.Common;
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
	public static var frameStates:Map<RiderBase, Array<RiderState>> = new Map();
	public static var frames:Int = 0;
	
	public static var playing:Bool = false;
	public static var paused:Bool = false;
	public static var rewinding:Bool = false;
	public static var fastForward:Bool = false;
	
	public static var flagged:Bool = false;
	public static var flagframe:Int = 0;
	
	public static var desiredSimSpeed:Float = 1 / 40;
	
	public static function init()
	{
		desiredSimSpeed = 1 / 40;
		
		recordGlobalSimState();
		
		restoreState(0);
	}
	
	static var timeDelta:Float = 0.0;
	public static function startSim() {
		
		if (RiderManager.riderCount == 0) {
			return;
		}
		
		playing = true;
		paused = false;
		timeDelta = 0;
		
		if (flagged) restoreState(flagframe);
		else restoreState(0);
		
		Main.camera.start();
	}
	
	public static function pauseSim() {
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
	public static function resumeSim() {
		playing = true;
		paused = false;
	}
	
	public static function endSim() {
		
		if (playing) Main.camera.stop();
		
		if (Common.CVAR.hitTest && !Common.CVAR.hitTestLive) Common.clearLitLines();
		
		playing = false;
		paused = false;
		timeDelta = 0;
		if (flagged) restoreState(flagframe);
		else restoreState(0);
	}
	
	public static function playSim(_delta:Float) {
		
		Grid.trackedLineList = [];
		
		timeDelta += _delta;
		if (timeDelta >= desiredSimSpeed) {
			if (!fastForward) stepSim();
			else {
				for (a in 0...4) stepSim();
			}
			timeDelta = 0;
			
			if (Common.CVAR.hitTest) Common.lightLinesUp(Grid.trackedLineList);
		}
	}
	
	public static function rewindSim(_delta:Float) {
		timeDelta += _delta;
		while (timeDelta >= desiredSimSpeed) {
			restoreState(frames -= 1);
			timeDelta -= desiredSimSpeed;
		}
	}
	
	public static function updateSim(_line:LineObject)
	{
		var anchor:Float = Math.POSITIVE_INFINITY;
		
		for (key in _line.keyList)
		{
			var cell = Grid.registry[key];
			if (cell.lowestFrame == Math.POSITIVE_INFINITY) continue;
			else if (cell.lowestFrame < anchor) anchor = cell.lowestFrame;
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
	
	public static function stepSim() {
		
		if (Common.CVAR.hitTest && Common.CVAR.hitTestLive) Common.clearLitLines();
		
		++frames;
		RiderManager.stepRiders();
		recordGlobalSimState();
	}
	
	public static function backSim() {
		restoreState(frames -= 1);
	}
	
	public static function quickUpdate() {
		backSim();
		stepSim();
	}
	
	public static function setFlagState() {
		
		flagged = (playing == true || paused == true) ? true : !flagged;
		
		if (flagged && (playing || paused)) {
			flagframe = frames;
		}
		
	}
	
	public static function restoreState(_frame:Int) {
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
	
	public static function recordGlobalSimState(?_frame:Int = null) {
		for (rider in RiderManager.riderList) {
			recordRiderState(rider, _frame == null ? frames : _frame);
		}
	}
	
	public static function recordRiderState(_rider:RiderBase, _frame:Int) {
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
	
}

typedef RiderState = {
	var crashed:Bool;
	var points:Array<PointContainer>;
	var scarves:Array<PointContainer>;
}