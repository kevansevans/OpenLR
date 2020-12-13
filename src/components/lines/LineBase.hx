package components.lines;
import components.tool.ToolBehavior.LineColor;
import enums.LineDrawMode;
import h2d.Graphics;
import h2d.Object;

import typedefs.LineProperties;
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
	
	public var properties:LineProperties;
	
	public var scripts:LineScript;
	
	public function new(_start:Point, _end:Point, _shift:Bool)
	{
		start = _start;
		end = _end;
		
		gfxEnd = new Point(end.x - start.x, end.y - start.y);
		
		shifted = _shift;
		
		rideLayer = new Graphics();
		colorLayer = new Graphics();
		
		calculateConstants();
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
	}
	
	public function render() {
		colorLayer.clear();
		colorLayer.lineStyle(1, 0xFF0000);
		colorLayer.moveTo(0, 0);
		colorLayer.lineTo(gfxEnd.x, gfxEnd.y);
	}
	
	public function visMode(_mode:LineDrawMode) {
		switch (_mode) {
			case EDIT :
				rideLayer.visible = true;
				colorLayer.visible = true;
			case PLAYBACK :
				rideLayer.visible = true;
				colorLayer.visible = false;
		}
	}
	
}