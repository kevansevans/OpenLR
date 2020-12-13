package components.stage;

import components.lines.LineBase;
import components.lines.Floor;
import components.lines.Accel;
import components.lines.Scenery;
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
		
		sceneLayer = new Object(this);
		colorLayer = new Object(this);
		rideLayer = new Object(this);
	}
	
	public function removeLine() {
		
	}
	
	public function addLine(_type:Int, _x1:Float, _y1:Float, _x2:Float, _y2:Float) {
		var line:LineBase = null;
		switch (_type) {
			case 0:
				line = new Floor(new Point(_x1, _y1), new Point(_x2, _y2), false);
				colorLayer.addChild(line.colorLayer);
			case 1 :
				line = new Accel(new Point(_x1, _y1), new Point(_x2, _y2), false);
				colorLayer.addChild(line.colorLayer);
			case 2 :
				line = new Scenery(new Point(_x1, _y1), new Point(_x2, _y2), false);
				sceneLayer.addChild(line.colorLayer);
			default :
				Main.console.log("New line creation error!", 0xFF0000);
				return;
		}
		rideLayer.addChild(line.rideLayer);
		line.render();
		line.visMode(EDIT);
		Main.grid.preRegister(line);
	}
}