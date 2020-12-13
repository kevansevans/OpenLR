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
		
		colorLayer.lineStyle(2, 0x00CC00);
		colorLayer.moveTo(0, 0 );
		colorLayer.lineTo(gfxEnd.x, gfxEnd.y);
		colorLayer.drawCircle(0, 0, 0.02, 10);
		colorLayer.drawCircle(gfxEnd.x, gfxEnd.y, 0.02, 10);
		
		rideLayer.lineStyle(2, 0);
		rideLayer.moveTo(0, 0);
		rideLayer.lineTo(gfxEnd.x, gfxEnd.y);
		rideLayer.drawCircle(0, 0, 0.02, 10);
		rideLayer.drawCircle(gfxEnd.x, gfxEnd.y, 0.02, 10);
	}
	
	override public function visMode(_mode:LineDrawMode):Void 
	{
		switch (_mode) {
			case EDIT :
				rideLayer.visible = false;
				colorLayer.visible = true;
			case PLAYBACK :
				rideLayer.visible = true;
				colorLayer.visible = false;
		}
	}
	
}