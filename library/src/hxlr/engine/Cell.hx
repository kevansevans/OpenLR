package hxlr.engine;

import hxlr.enums.LineType;
import hxlr.lines.LineBase;
import hxlr.math.Point;

/**
 * ...
 * @author Kaelan
 */

typedef CellInfo = {
	var x:Int;
	var y:Int;
	var gx:Float;
	var gy:Float;
	var ?key:String;
}
 
class Cell 
{
	public static inline var size:Int = 14;
	public static var cellList:Array<Cell> = new Array();
	
	public static function getInfo(_x:Float, _y:Float):CellInfo 
	{
		var info:CellInfo = {
			x : Std.int(Math.floor(_x / size)),
			y : Std.int(Math.floor(_y / size)),
			gx : _x - size * Math.floor(_x / size),
			gy : _y - size * Math.floor(_y / size),
		};
		info.key = 'x${info.x}y${info.y}';
		return info;
	}
	
	public var info:CellInfo;
	
	public var allLines:Array<LineBase>;
	public var collidable:Array<LineBase>;
	public var intangible:Array<LineBase>;
	
	public function new(_info:CellInfo) 
	{
		info = _info;
		
		allLines = new Array();
		collidable = new Array();
		intangible = new Array();
	}
	
	public function addLine(_line:LineBase) {
		
		if (allLines.contains(_line)) return;
		
		allLines.push(_line);
		
		if (_line.tangible) {
			collidable[_line.id] = _line;
		} else {
			intangible[_line.id] = _line;
		}
		
		if (!cellList.contains(this)) cellList.push(this);
		
	}
	
	public function removeLine(_line:LineBase) {
		
		if (!allLines.contains(_line)) return;
		
		allLines.remove(_line);
		
		switch (_line.tangible) {
			case true :
				collidable.remove(_line);
			case false :
				intangible.remove(_line);
		}
		
		if (allLines.length == 0) cellList.remove(this);
		
	}
}