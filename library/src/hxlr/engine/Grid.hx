package hxlr.engine;

import haxe.macro.Expr.Case;
import hxlr.engine.Cell;
import hxlr.enums.LineType;
import hxlr.file.TrackStruct.LineStruct;
import hxlr.lines.Accel;
import hxlr.lines.LineObject;
import hxlr.lines.Floor;
import hxlr.lines.Scenery;
import hxlr.lines.Slow;
import hxlr.lines.Undefined;
import hxlr.math.geom.Point;

/**
 * ...
 * @author Kaelan
 */
class Grid 
{

	public static var lineCount:Int = 0;
	public static var lineIDCount:Int = 0;
	public static var subTypeCount:Array<Null<Int>> = new Array();
	
	public static var registry:Map<String, Cell>;
	public static var lines:Array<LineObject>;
	
	public function new() 
	{
		registry = new Map();
		lines = new Array();
	}
	
	public static function createLineObject(_type:LineType, _x1:Float, _y1:Float, _x2:Float, _y2:Float, _inv:Bool = false, _limMode:Int = 0, _multiplier:Int = 1):LineObject
	{
		var line:LineObject = null;
		
		var start:Point = new Point(_x1, _y1);
		var end:Point = new Point(_x2, _y2);
		
		switch (_type) {
			
			case FLOOR :
				line = new Floor(start, end, _inv, _limMode);
			case ACCEL :
				line = new Slow(start, end, _inv, _limMode);
				line.multiplier = _multiplier;
			case SCENE :
				line = new Scenery(start, end);
			case SLOW :
				line = new Slow(start, end, _inv, _limMode);
			default :
				line = new Undefined(start, end);
		}
		
		return line;
	}
	
	public static function createLineFromStruct(_line:LineStruct):LineObject
	{
		
		var line:LineObject = null;
		
		var start:Point = new Point(_line.x1, _line.y1);
		var end:Point = new Point(_line.x2, _line.y2);
		
		var limMode = 0;
		if (_line.leftExtended && !_line.rightExtended) limMode = 1;
		else if (!_line.leftExtended && _line.rightExtended) limMode = 2;
		else if (_line.leftExtended && _line.rightExtended) limMode = 3;
		
		switch (_line.type) {
			
			case FLOOR :
				line = new Floor(start, end, _line.flipped, limMode);
			case ACCEL :
				line = new Accel(start, end, _line.flipped, limMode);
				line.multiplier = _line.multiplier == null ? 1 : _line.multiplier;
			case SCENE :
				line = new Scenery(start, end);
			case SLOW :
				line = new Slow(start, end, _line.flipped, limMode);
			default :
				line = new Undefined(start, end);
				
		}
		
		
		return line;
	}
	
	public static function register(_line:LineObject)
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
		var invDx = _line.dx == 0 ? 1 : 1 / _line.dx;
		var invDy = _line.dy == 0 ? 1 : 1 / _line.dy;
		
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
	
	public static function addLine(_line:LineObject):Void 
	{
		if (_line.id == null) _line.id = lineIDCount;
		lines[_line.id] = _line;
		++lineCount;
		++lineIDCount;
		if (subTypeCount[_line.type] == null) subTypeCount[_line.type] = 0;
		++subTypeCount[_line.type];
	}
	
	static function storeLine(_line:LineObject, _info:CellInfo)
	{
		if (registry[_info.key] == null) {
			registry[_info.key] = new Cell(_info);
		}
		registry[_info.key].addLine(_line);
		_line.keyList.push(_info.key);
	}
	
	public static function deleteTrack() {
		for (line in lines) unregister(line);
		lines = new Array();
	}
	
	public static function unregister(_line:LineObject) {
		
		if (_line == null) return;
		
		for (key in _line.keyList) {
			registry[key].removeLine(_line);
		}
		
		--lineCount;
		--subTypeCount[_line.type];
		
		lines[_line.id] = null;
	}
}