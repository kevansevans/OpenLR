package components.stage;

import hxlr.rider.RiderBase;

import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class Camera 
{
	public var enabled:Bool;
	public var riderFollow(default, set):Null<String>;
	
	var rider:RiderBase;
	
	public var cameraScale:Float = 6;
	
	public function new(?_name:String) 
	{
		enabled = false;
		riderFollow = _name;
	}
	
	var lastPosition:Point;
	var lastScale:Float;
	
	public function start() {
		
		if (!enabled || riderFollow == null) return;
		
		lastPosition = new Point(Main.canvas.x, Main.canvas.y);
		lastScale = Main.canvas.scaleX;
		
		Main.canvas.setScale(cameraScale);
		Main.canvas.x = rider.focusPoint.pos.x + (Main.locengine.width / 2);
		Main.canvas.y = rider.focusPoint.pos.y + (Main.locengine.height / 2);
		
	}
	
	public function follow() {
		
		var position = Main.canvas.localToGlobal(rider.focusPoint.pos.clone());
		
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
		
		Main.canvas.x += xAdjust;
		Main.canvas.y += yAdjust;
	}
	
	public function stop() {
		
	}
	
	function set_riderFollow(value:Null<String>):Null<String> 
	{
		rider = Main.riders.riders[value];
		return riderFollow = value;
	}
	
}