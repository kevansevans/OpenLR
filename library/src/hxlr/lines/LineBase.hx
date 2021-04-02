package hxlr.lines;

import hxlr.enums.LineType;
import hxlr.math.Point;
import hxlr.rider.ContactPoint;

/**
 * ...
 * @author Kaelan
 */
class LineBase
{
	public var id:Null<Int>;
	
	public var start:Point;
	public var end:Point;
	
	public var type:LineType;
	public var tangible:Bool = false;
	
	public var keyList:Array<String>;
	
	var gfxEnd:Point;
	
	public var shifted:Bool;
	
	public var dx:Float;
	public var dy:Float;
	public var C:Float;
	public var distance:Float;
	public var invSqrDistance:Float;
	public var invDistance:Float;
	public var nx:Float;
	public var ny:Float;
	public var zone = 10;
	
	public var limType:Int = 0;
	public var limStart:Float = 0;
	public var limEnd:Float = 0;
	public var limValue:Float = 0;
	
	public var prevLine:LineBase;
	public var nextLine:LineBase;
	
	public function new(_start:Point, _end:Point, _shift:Bool, ?_lim:Int = 0)
	{
		start = _start;
		end = _end;
		
		gfxEnd = new Point(end.x - start.x, end.y - start.y);
		
		shifted = _shift;
		
		keyList = new Array();
		
		calculateConstants();
		
		setLim(_lim);
		
	}
	
	function calculateConstants() {
		dx = end.x - start.x;
		dy = end.y - start.y;
		C = dy * start.x - dx * start.y;
		var _loc2 = Math.pow(dx, 2) + Math.pow(dy, 2);
		invSqrDistance = 1 / _loc2;
		distance = Math.sqrt(_loc2);
		invDistance = 1 / distance;
		nx = dy * invDistance * (shifted ? 1 : -1);
		ny = dx * invDistance * (shifted ? -1 : 1);
		limValue = Math.min(0.25, zone / distance);
	}
	
	public function setLim(_limMode:Int)
	{
		switch (_limMode) {
			case 0:
				limStart = 0;
				limEnd = 1;
			case 1:
				limStart = -limValue;
				limEnd = 1;
			case 2:
				limStart = 0;
				limEnd = 1 + limValue;
			case 3:
				limStart = -limValue;
				limEnd = 1 + limValue;
		}
		limType = _limMode;
	}
	
	public function collide(_point:ContactPoint) {
		
	}
	
	public function toSaveObject():LineStruct {
		var save:LineStruct = {
			id : id,
			type : type,
			x1 : start.x,
			y1 : start.y,
			x2 : end.x,
			y2 : end.y,
			flipped : shifted,
			leftExtended : switch(limType){
				case 0 | 2:
					false;
				case 1 | 3:
					true;
				default :
					false;
			},
			rightExtended : switch(limType){
				case 0 | 1:
					false;
				case 2 | 3:
					true;
				default :
					false;
			},
		}
		return save;
	}
}

typedef LineStruct = {
	var id:Int;
	var type:LineType;
	var x1:Float;
	var y1:Float;
	var x2:Float;
	var y2:Float;
	var flipped:Bool;
	var leftExtended:Bool;
	var rightExtended:Bool;
}