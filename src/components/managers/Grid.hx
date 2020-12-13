package components.managers;

import components.lines.Accel;
import components.lines.LineBase;
import h2d.col.Point;
import components.tool.ToolBehavior.LineColor;

/**
 * ...
 * @author Kaelan
 */
class Grid 
{
	var registry:Map<String, LineContainer>;
	public function new() 
	{
		registry = new Map();
	}
	
	public function preRegister(_line:LineBase)
	{
		if (_line == null) {
			trace("AAAAAHHHHH");
			return ;
		}
		var start = registryPosition(_line.start.x, _line.start.y);
		var end = registryPosition(_line.end.x, _line.end.y);
		
		var left = _line.dx > 0 ? end.x : start.x;
		var right = _line.dx > 0 ? start.x : end.x;
		var bottom = _line.dy > 0 ? end.y : start.y;
		var top = _line.dy > 0 ? start.y : end.y;
		
		register(_line, start.x, start.y);
		
		if (_line.dx == 0 && _line.dy == 0 || left == right && top == bottom) return;
		
		var x = _line.start.x;
		var y = _line.start.y;
		var invDx = 1 / _line.dx;
		var invDy = 1 / _line.dy;
		
		var difX:Float;
		var difY:Float;
		
		while (true) {
			
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
					x += difY;
					y = step;
				} else if (Math.abs(step - y) == Math.abs(difY)) {
					x += difX;
					y += difY;
				} else {
					x += _line.dx * difY * invDy;
					y += difY;
				}
			}
			var pos = registryPosition(x, y);
			if (pos.x >= left && pos.x <= right && pos.y >= top && pos.y <= bottom) {
				register(_line, pos.x, pos.y);
				continue;
			}
			break;
		}
		
	}
	
	function register(_line:LineBase, _x:Int, _y:Int)
	{
		var key = 'x${_x}y${_y}';
		if (registry[key] == null) {
			var reg:LineContainer = {
				position : new Point(_x, _y),
				colliders : new Array(),
				nonColliders : new Array()
			}
			registry[key] = reg;
		}
		switch (_line.type) {
			case FLOOR | ACCEL :
				registry[key].colliders.push(_line);
			case SCENE :
				registry[key].nonColliders.push(_line);
			default :
				Main.console.log("Error registering line", 0xFF0000);
		}
	}
	
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
	var colliders:Array<LineBase>;
	var nonColliders:Array<LineBase>;
}