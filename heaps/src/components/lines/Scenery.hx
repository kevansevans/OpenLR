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
	
}