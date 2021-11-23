package components.stage;

import hxlr.engine.RiderManager;
import hxlr.rider.RiderBase;

import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class Camera 
{
	public var enabled:Bool = false;
	
	public var rider:RiderBase;
	
	public var cameraScale:Float = 6;
	
	public function new() 
	{
		rider = RiderManager.riderList[0];
	}
	
	var lastPosition:Point;
	var lastScale:Float;
	
	public function start() {
		
		if (!enabled) return;
		
		lastPosition = new Point(Main.riderLayer.x, Main.riderLayer.y);
		lastScale = Main.riderLayer.scaleX;
		
		Main.riderLayer.setScale(cameraScale);
		Main.riderLayer.x = rider.focusPoint.pos.x + (Main.locengine.width / 2);
		Main.riderLayer.y = rider.focusPoint.pos.y + (Main.locengine.height / 2);
		
	}
	
	public function follow() {
		
		rider = RiderManager.riderList[0];
		var position = Main.riderLayer.localToGlobal(rider.getCameraPoint().clone());
		
		var right:Float = Main.locengine.width * 0.6;
		var left:Float = Main.locengine.width * 0.3;
		var top:Float = Main.locengine.height * 0.3;
		var bottom:Float = Main.locengine.height * 0.6;
		
		var xAdjust:Float = 0.0;
		var yAdjust:Float = 0.0;
		
		if (position.x > right) {
			xAdjust = right - position.x;
		} else if (position.x < left) {
			xAdjust = left - position.x;
		}
		
		if (position.y > bottom) {
			yAdjust = bottom - position.y;
		} else if (position.y < top) {
			yAdjust = top - position.y;
		}
		
		Main.riderLayer.x += xAdjust;
		Main.riderLayer.y += yAdjust;
	}
	
	public function stop() {
		
	}
}