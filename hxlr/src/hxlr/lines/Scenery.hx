package hxlr.lines;

import hxlr.math.geom.Point;

/**
 * ...
 * @author Kaelan
 */
class Scenery extends LineObject 
{

	public function new(_start:Point, _end:Point) 
	{
		super(_start, _end);
		
		type = SCENE;
	}
	
}