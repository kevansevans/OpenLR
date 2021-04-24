package hxlr.lines;

import hxlr.math.geom.Point;

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