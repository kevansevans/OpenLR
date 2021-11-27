package hxlr.engine;

import hxlr.enums.LineType;
import hxlr.lines.LineObject;
import hxlr.math.geom.Point;

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

typedef CellInfo_6_0 =  {
	var x:Float;
	var y:Float;
	var hx:Float;
	var hy:Float;
}
 
class Cell 
{
	public static inline var size:Int = 14;
	public static var cellList:Array<Cell> = new Array();
	
	public static function getInfo(_x:Float, _y:Float, ?_argIsCellCoords:Bool = false):CellInfo 
	{
		var info:CellInfo = {
			x : Std.int(Math.floor(_x / size)),
			y : Std.int(Math.floor(_y / size)),
			gx : _x - size * Math.floor(_x / size),
			gy : _y - size * Math.floor(_y / size),
		};
		
		if (_argIsCellCoords)
		{
			info.x = Std.int(_x);
			info.y = Std.int(_y);
		}
		
		info.key = 'x${info.x}y${info.y}';
		
		return info;
	}
	
	public var info:CellInfo;
	
	public var allLines:Array<LineObject>;
	public var collidable:Array<LineObject>;
	public var intangible:Array<LineObject>;
	
	public var lowestFrame:Float = Math.POSITIVE_INFINITY;
	
	public function new(_info:CellInfo) 
	{
		info = _info;
		
		allLines = new Array();
		collidable = new Array();
		intangible = new Array();
	}
	
	public function addLine(_line:LineObject) {
		
		if (allLines.contains(_line)) return;
		
		allLines.push(_line);
		allLines.sort(function(_a:LineObject, _b:LineObject):Int {
			if (_a.id < _b.id) return -1;
			else return 1;
		});
		
		if (_line.tangible) {
			collidable.push(_line);
			collidable.sort(function(_a:LineObject, _b:LineObject):Int {
				if (_a.id < _b.id) return -1;
				else return 1;
			});
		} else {
			intangible.push(_line);
			intangible.sort(function(_a:LineObject, _b:LineObject):Int {
				if (_a.id < _b.id) return -1;
				else return 1;
			});
		}
		
		if (!cellList.contains(this)) cellList.push(this);
		
	}
	
	public function removeLine(_line:LineObject) {
		
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