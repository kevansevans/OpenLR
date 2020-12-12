package components.stage;

import components.lines.LineBase;
import components.lines.Floor;
import enums.LineDrawMode;
import h2d.Graphics;
import h2d.Object;
import h2d.Scene;
import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class Canvas extends Scene
{
	var rideLayer:Object;
	var sceneLayer:Object;
	var colorLayer:Object;
	public function new() 
	{
		super();
		
		colorLayer = new Object(this);
		sceneLayer = new Object(this);
		rideLayer = new Object(this);
	}
	
	public function addLine(_type:Int, _x1:Float, _y1:Float, _x2:Float, _y2:Float) {
		switch (_type) {
			case 0:
				var line:Floor = new Floor(new Point(_x1, _y1), new Point(_x2, _y2), false);
				rideLayer.addChild(line.rideLayer);
				colorLayer.addChild(line.colorLayer);
				line.render(LineDrawMode.edit);
			default :
		}
	}
}