package components.managers;

import components.lines.LineBase;
import h2d.col.Point;
import components.tool.ToolBehavior.LineColor;
import haxe.ds.ArraySort;
import hxd.Key;
import network.NetAction;

/**
 * ...
 * @author Kaelan
 */
class Grid 
{
	public var registry:Map<String, LineContainer>;
	
	public var lines:Array<LineBase>;
	public var networkLines:Map<String, LineBase>;
	
	public var lineCount:Int = 0;
	public var lineIDCount:Int = 0;
	public var floorCount:Int = 0;
	public var accelCount:Int = 0;
	public var sceneCount:Int = 0;
	
	public function new() 
	{
		registry = new Map();
		lines = new Array();
	}
	
	public function register(_line:LineBase)
	{
		updateFrame = 0;
		
		addLine(_line);
		
		var start = registryPosition(_line.start.x, _line.start.y);
		var end = registryPosition(_line.end.x, _line.end.y);
		
		var right = _line.dx > 0 ? end.x : start.x;
		var left = _line.dx > 0 ? start.x : end.x;
		var bottom = _line.dy > 0 ? end.y : start.y;
		var top = _line.dy > 0 ? start.y : end.y;
		
		if (_line.dx == 0 && _line.dy == 0 || left == right && top == bottom) {
			storeLine(_line, start.x, start.y);
			return;
		} else {
			storeLine(_line, start.x, start.y);
		}
		
		var x = _line.start.x;
		var y = _line.start.y;
		var invDx = 1 / _line.dx;
		var invDy = 1 / _line.dy;
		
		while (true) {
			
			var difX:Float;
			var difY:Float;
			
			if (start.x < 0) {
				difX = _line.dx > 0 ? (GRIDSIZE + start.gx) : (-GRIDSIZE - start.gx);
			} else {
				difX = _line.dx > 0 ? (GRIDSIZE - start.gx) : (-(start.gx + 1));
			}
			if (start.y < 0) {
				difY = _line.dy > 0 ? (GRIDSIZE + start.gy) : (-GRIDSIZE - start.gy);
			} else {
				difY = _line.dy > 0 ? (GRIDSIZE - start.gy) : (-(start.gy + 1));
			}
			
			if (_line.dx == 0) {
				y += difY;
			} else if (_line.dy == 0) {
				x += difX;
			} else {
				
				var step = y + _line.dy * difX * invDx;
				if (Math.abs(step - y) < Math.abs(difY)) {
					x += difX;
					y = step;
				} else if (Math.abs(step - y) == Math.abs(difY)) {
					x += difX;
					y += difY;
				} else {
					x = x + _line.dx * difY * invDy;
					y += difY;
				}
			}
			start = registryPosition(x, y);
			if (start.x >= left && start.x <= right && start.y >= top && start.y <= bottom) {
				storeLine(_line, start.x, start.y);
				continue;
			}
			return;
		}
	}
	
	public function addLine(_line:LineBase):Void 
	{
		if (_line.id == null) _line.id = lineIDCount;
		lines[_line.id] = _line;
		++lineCount;
		++lineIDCount;
		switch (_line.type) {
			case FLOOR :
				++floorCount;
			case ACCEL :
				++accelCount;
			case SCENE :
				++sceneCount;
			default :
		}
		
		Main.simulation.updateSim();
	}
	
	var updateFrame:Int = 0;
	
	function storeLine(_line:LineBase, _x:Int, _y:Int)
	{
		var key = 'x${_x}y${_y}';
		if (registry[key] == null) {
			var reg:LineContainer = {
				position : new Point(_x, _y),
				allLines : [],
				colliders : [],
				nonColliders : []
			}
			registry[key] = reg;
		}
		registry[key].allLines.push(_line);
		switch (_line.type) {
			case FLOOR | ACCEL:
				registry[key].colliders[_line.id] = _line;
			case SCENE :
				registry[key].nonColliders.push(_line);
			default :
				Main.console.log("Error registering line", 0xFF0000);
		}
		_line.keyList.push(key);
	}
	
	public function deleteTrack() {
		for (line in lines) unregister(line);
	}
	
	public function unregister(_line:LineBase) {
		
		if (_line == null) return;
		
		for (key in _line.keyList) {
			registry[key].allLines.remove(_line);
			switch (_line.type) {
				case FLOOR | ACCEL :
					registry[key].colliders.remove(_line);
				case SCENE :
					registry[key].nonColliders.remove(_line);
				default :
			}
		}
		
		--lineCount;
		switch (_line.type) {
			case FLOOR :
				--floorCount;
			case ACCEL :
				--accelCount;
			case SCENE :
				--sceneCount;
			default :
		}
		
		
		#if js
		if (Main.p2p.connected) {
			Main.p2p.updateLineInfo(NetAction.deleteLine, [_line.id]);
		}
		#end
		
		lines[_line.id] = null;
		
		Main.simulation.updateSim();
		Main.canvas.redrawLines(_line.type);
	}
	
	#if js
	public function P2Punregister(_line:LineBase) {
		for (key in _line.keyList) {
			registry[key].allLines.remove(_line);
			switch (_line.type) {
				case FLOOR | ACCEL :
					registry[key].colliders.remove(_line);
				case SCENE :
					registry[key].nonColliders.remove(_line);
				default :
			}
		}
		switch (_line.type) {
			case FLOOR :
				--floorCount;
			case ACCEL :
				--accelCount;
			case SCENE :
				--sceneCount;
			default :
		}
		--lineCount;
		lines[_line.id] = null;
	}
	#end
	
	static inline var GRIDSIZE:Int = 14;
	public static function registryPosition(_x:Float, _y:Float):GridObject
	{
		var gObject:GridObject = {
			x : Std.int(Math.floor(_x / GRIDSIZE)),
			y : Std.int(Math.floor(_y / GRIDSIZE)),
			gx : _x - GRIDSIZE * Math.floor(_x / GRIDSIZE),
			gy : _y - GRIDSIZE * Math.floor(_y / GRIDSIZE)
		}
		return gObject;
	}
	
}

typedef GridObject = {
	var x:Int;
	var y:Int;
	var gx:Float;
	var gy:Float;
}

typedef LineContainer = {
	var position:Point;
	var allLines:Array<LineBase>;
	var colliders:Array<LineBase>;
	var nonColliders:Array<LineBase>;
}