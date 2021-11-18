package hxlr.lines;

import hxlr.enums.Anchor;
import hxlr.enums.LineType;
import hxlr.math.geom.Line;
import hxlr.math.geom.Point;
import hxlr.rider.ContactPoint;
import hxlr.file.TrackStruct.LineStruct;

/**
 * ...
 * @author Kaelan
 */
class LineObject extends Line
{
	public var tangible:Bool = false;
	
	
	public var keyList:Array<String>;
	
	//Needed info
	public var id:Null<Int>;
	public var type:LineType;
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
	
	//6.1 info
	public var x(get, null):Float;
	public var y(get, null):Float;
	public var hx(get, null):Float;
	public var hy(get, null):Float;
	
	public var special(get, never):Bool;
	public var multiplier(default, set):Int = 1; 
	public var thickness:Float = 2;
	public var accConst:Float = 0.1;
	public var grindable:Bool;
	public var grindMode:Anchor;
	public var layer:Int = 0;
	
	public var limType:Int = 0;
	public var limStart:Float = 0;
	public var limEnd:Float = 0;
	public var limValue:Float = 0;
	
	public var prevLine:LineObject;
	public var nextLine:LineObject;
	
	public var left(get, null):Float;
	public var right(get, null):Float;
	public var top(get, null):Float;
	public var bottom(get, null):Float;
	
	
	public function new(_start:Point, _end:Point, _shift:Bool = false, ?_lim:Int = 0)
	{
		super(_start, _end);
		
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
	
	public function collide(_point:ContactPoint) 
	{
		#if debug
			trace("Undefined line collision behavior!");
		#end
	}
	
	public function toLineStruct():LineStruct {
		var save:LineStruct = {
			id : id,
			type : type,
			x1 : start.x,
			y1 : start.y,
			x2 : end.x,
			y2 : end.y,
			multiplier : multiplier != 1 ? multiplier : null,
			flipped : shifted == true ? true : null,
			leftExtended : switch(limType){
				case 0 | 2:
					null;
				case 1 | 3:
					true;
				default :
					null;
			},
			rightExtended : switch(limType){
				case 0 | 1:
					null;
				case 2 | 3:
					true;
				default :
					null;
			},
			layer : layer,
		}
		return save;
	}
	
	function getGrind(_point:ContactPoint):Bool
	{
		if (!grindable) return true;
		else
		{
			switch (grindMode)
			{
				case HAND_A | HAND_B :
					if (_point.id == HAND_A || _point.id == HAND_B) return true;
					else return false;
				case FOOT_A | FOOT_B :
					if (_point.id == FOOT_A || _point.id == FOOT_B) return true;
					else return false;
				default :
					if (_point.id == grindMode) return true;
					else return false;
			}
		}
		return true; //So Haxe doesn't throw a fit
	}
	
	function get_special():Bool 
	{
		if (multiplier != 1) return true;
		if (thickness != 2) return true;
		if (grindable) return true;
		if (layer != 0) return true;
		
		return false;
	}
	
	function get_x():Float 
	{
		return this.start.x + this.dx * 0.5;
	}
	
	function get_y():Float 
	{
		return this.start.y + this.dy * 0.5;
	}
	
	function get_hx():Float 
	{
		return Math.abs(this.dx) * 0.5;
	}
	
	function get_hy():Float 
	{
		return Math.abs(this.dy) * 0.5;
	}
	
	function get_left():Float 
	{
		return Math.min(start.x, end.x);
	}
	
	function get_right():Float 
	{
		return Math.max(start.x, end.x);
	}
	
	function get_top():Float 
	{
		return Math.min(start.y, end.y);
	}
	
	function get_bottom():Float 
	{
		return Math.max(start.y, end.y);
	}
	
	function set_multiplier(value:Int):Int 
	{
		return multiplier = value;
	}
}