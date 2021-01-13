package components.lines;

import enums.LineDrawMode;
import h2d.col.Point;

import components.tool.ToolBehavior.LineColor;

/**
 * ...
 * @author Kaelan
 */
class Scenery extends LineBase 
{

	public function new(_start:Point, _end:Point, _shift:Bool) 
	{
		super(_start, _end, _shift);
		
		type = SCENE;
	}
	
	override public function render():Void 
	{
		rideLayer.clear();
		colorLayer.clear();
		
		rideLayer.x = colorLayer.x = start.x;
		rideLayer.y = colorLayer.y = start.y;
		
		colorLayer.lineStyle(2, 0x00CC00, 0.5);
		colorLayer.moveTo(0, 0);
		colorLayer.lineTo(gfxEnd.x, gfxEnd.y);
		colorLayer.drawCircle(0, 0, lineCapRadius, lineCapSegment);
		colorLayer.drawCircle(gfxEnd.x, gfxEnd.y, lineCapRadius, lineCapSegment);
		
		rideLayer.lineStyle(2, 0);
		rideLayer.moveTo(0, 0);
		rideLayer.lineTo(gfxEnd.x, gfxEnd.y);
		rideLayer.drawCircle(0, 0, lineCapRadius, lineCapSegment);
		rideLayer.drawCircle(gfxEnd.x, gfxEnd.y, lineCapRadius, lineCapSegment);
	}
}