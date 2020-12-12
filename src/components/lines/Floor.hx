package components.lines;

import enums.LineDrawMode;
import h2d.col.Point;
import typedefs.LineProperties;

/**
 * ...
 * @author Kaelan
 */
class Floor extends LineBase 
{
	public function new(_start:Point, _end:Point, _shift:Bool) 
	{
		super(_start, _end, _shift);
	}
	
	override public function render(_mode:LineDrawMode):Void 
	{
		rideLayer.clear();
		colorLayer.clear();
		
		rideLayer.x = colorLayer.x = start.x;
		rideLayer.y = colorLayer.y = start.y;
		
		var x_offset:Float = nx > 0 ? Math.ceil(nx) : Math.floor(nx);
		var y_offset:Float = ny > 0 ? Math.ceil(ny) : Math.floor(ny);
		
		colorLayer.lineStyle(2, 0x0066FF, 0.75);
		colorLayer.moveTo(0 + x_offset, 0 + y_offset);
		colorLayer.lineTo(gfxEnd.x + x_offset, gfxEnd.y + y_offset);
		
		rideLayer.lineStyle(2, 0);
		rideLayer.moveTo(0, 0);
		rideLayer.lineTo(gfxEnd.x, gfxEnd.y);
	}
	
}