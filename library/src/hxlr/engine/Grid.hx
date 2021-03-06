package hxlr.engine;

import hxlr.engine.Cell;
import hxlr.enums.LineType;
import hxlr.lines.LineBase;

/**
 * ...
 * @author Kaelan
 */
class Grid 
{

	public var lineCount:Int = 0;
	public var lineIDCount:Int = 0;
	public var subTypeCount:Array<Int> = new Array();
	
	public var registry:Map<String, Cell>;
	public var lines:Array<LineBase>;
	
	public function new() 
	{
		registry = new Map();
		lines = new Array();
	}
	
	public function register(_line:LineBase)
	{
		addLine(_line);
		
		var start = Cell.getInfo(_line.start.x, _line.start.y);
		var end = Cell.getInfo(_line.end.x, _line.end.y);
		
		var right = _line.dx > 0 ? end.x : start.x;
		var left = _line.dx > 0 ? start.x : end.x;
		var bottom = _line.dy > 0 ? end.y : start.y;
		var top = _line.dy > 0 ? start.y : end.y;
		
		storeLine(_line, start);
		
		if (_line.dx == 0 && _line.dy == 0 || left == right && top == bottom) {
			return;
		}
		
		var x = _line.start.x;
		var y = _line.start.y;
		var invDx = 1 / _line.dx;
		var invDy = 1 / _line.dy;
		
		var difX:Float;
		var difY:Float;
		
		while (true) {
			
			if (start.x < 0) {
				difX = _line.dx > 0 ? (Cell.size + start.gx) : (-Cell.size - start.gx);
			} else {
				difX = _line.dx > 0 ? (Cell.size - start.gx) : (-(start.gx + 1));
			}
			if (start.y < 0) {
				difY = _line.dy > 0 ? (Cell.size + start.gy) : (-Cell.size - start.gy);
			} else {
				difY = _line.dy > 0 ? (Cell.size - start.gy) : (-(start.gy + 1));
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
			start = Cell.getInfo(x, y);
			if (start.x >= left && start.x <= right && start.y >= top && start.y <= bottom) {
				storeLine(_line, start);
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
		++subTypeCount[_line.type];
		
		Main.simulation.updateSim();
	}
	
	function storeLine(_line:LineBase, _info:CellInfo)
	{
		if (registry[_info.key] == null) {
			registry[_info.key] = new Cell(_info);
		}
		registry[_info.key].addLine(_line);
		_line.keyList.push(_info.key);
	}
	
	public function deleteTrack() {
		for (line in lines) unregister(line);
	}
	
	public function unregister(_line:LineBase) {
		
		if (_line == null) return;
		
		for (key in _line.keyList) {
			registry[key].removeLine(_line);
		}
		
		--lineCount;
		--subTypeCount[_line.type];
		
		lines[_line.id] = null;
	}
}