package components.lines;

import h2d.col.Point;

import enums.LineDrawMode;

import components.tool.ToolBehavior.LineColor;

/**
 * ...
 * @author Kaelan
 */
class Accel extends LineBase 
{

	public function new(_start:Point, _end:Point, _shift:Bool) 
	{
		super(_start, _end, _shift);
		
		type = ACCEL;
		
	}
	
	override public function render():Void 
	{
		rideLayer.clear();
		colorLayer.clear();
		
		rideLayer.x = colorLayer.x = start.x;
		rideLayer.y = colorLayer.y = start.y;
		
		var x_offset:Float = nx > 0 ? Math.ceil(nx) : Math.floor(nx);
		var y_offset:Float = ny > 0 ? Math.ceil(ny) : Math.floor(ny);
		
		colorLayer.lineStyle(2, 0xCC0000, 0.75);
		colorLayer.moveTo(0 + x_offset, 0 + y_offset);
		colorLayer.lineTo(gfxEnd.x + x_offset, gfxEnd.y + y_offset);
		colorLayer.lineTo(gfxEnd.x + (nx * 4 - dx * invDistance * 5), gfxEnd.y + (ny * 4 - dy * invDistance * 5));
		colorLayer.lineTo(gfxEnd.x - dx * invDistance * 5, gfxEnd.y - dy * invDistance * 5);
		
		rideLayer.lineStyle(2, 0);
		rideLayer.moveTo(0, 0);
		rideLayer.lineTo(gfxEnd.x, gfxEnd.y);
		rideLayer.drawCircle(0, 0, 0.02, 10);
		rideLayer.drawCircle(gfxEnd.x, gfxEnd.y, 0.02, 10);
	}
	
}