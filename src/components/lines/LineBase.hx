package components.lines;
import components.physics.RidePoint;
import components.tool.ToolBehavior.LineColor;
import enums.LineDrawMode;
import h2d.Graphics;
import h2d.Object;

import scripts.LineScript;

import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class LineBase
{
	public var rideLayer:Graphics;
	public var colorLayer:Graphics;
	
	public var start:Point;
	public var end:Point;
	
	public var type:LineColor;
	
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
	
	public var scripts:LineScript;
	
	var lineCapRadius:Float = 0.0025;
	var lineCapSegment:Int = 15;
	
	public function new(_start:Point, _end:Point, _shift:Bool, ?_lim:Int = 0)
	{
		start = _start;
		end = _end;
		
		gfxEnd = new Point(end.x - start.x, end.y - start.y);
		
		shifted = _shift;
		
		rideLayer = new Graphics();
		colorLayer = new Graphics();
		
		keyList = new Array();
		
		calculateConstants();
		
		setLim(_lim);
	}
	
	function calculateConstants() {
		dx = end.x - start.x;
		dy = end.y - start.y;
		C = dy * start.x - dx * start.y;
		invSqrDistance = 1 / (Math.pow(dx, 2) + Math.pow(dy, 2));
		distance = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
		invDistance = 1 / distance;
		nx = dy * invDistance * (shifted ? 1 : -1);
		ny = dx * invDistance * (shifted ? -1 : 1);
		limValue = Math.min(0.25, zone / distance);
	}
	
	function setLim(_limMode:Int)
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
	
	public function render() {
		colorLayer.clear();
		colorLayer.lineStyle(1, 0xFF0000);
		colorLayer.moveTo(0, 0);
		colorLayer.lineTo(gfxEnd.x, gfxEnd.y);
	}
	
	public function collide(_point:RidePoint) {
		
	}
}