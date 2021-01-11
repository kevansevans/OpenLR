package components.lines;

import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class Undefined extends LineBase 
{

	public function new(_start:Point, _end:Point, _shift:Bool, ?_lim:Int=0) 
	{
		super(_start, _end, _shift, _lim);
		
	}
	
	override public function render():Void 
	{
		colorLayer.clear();
		
		colorLayer.x = start.x;
		colorLayer.y = start.y;
		
		var x_offset:Float = nx > 0 ? Math.ceil(nx) : Math.floor(nx);
		var y_offset:Float = ny > 0 ? Math.ceil(ny) : Math.floor(ny);
		
		colorLayer.lineStyle(2, 0xFF0000);
		colorLayer.moveTo(0, 0);
		colorLayer.lineTo(gfxEnd.x, gfxEnd.y);
		colorLayer.drawCircle(0, 0, lineCapRadius, lineCapSegment);
		colorLayer.drawCircle(gfxEnd.x, gfxEnd.y, lineCapRadius, lineCapSegment);
	}
	
}