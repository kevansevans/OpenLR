package components.stage;

import hxlr.lines.LineObject;
import hxlr.lines.Floor;
import hxlr.lines.Accel;
import hxlr.lines.Scenery;
import hxlr.enums.LineType;
import hxlr.engine.Grid;
import h2d.Graphics;
import h2d.Object;
import h2d.Scene;
import h2d.col.Point;
import h2d.Bitmap;

/**
 * ...
 * @author Kaelan
 */

class RiderLayer extends Object
{
	public var previewLayer:Object;
	var rideLayer:Object;
	var sceneLayer:Object;
	
	public var preview:Object;
	
	var eraserSize:Int = 5;
	
	public var lineVisLock:Bool = false;
	
	public var sledderLayer:Object;
	public var sledderGFX:Graphics;
	
	public var mouseX(get, null):Float;
	public var mouseY(get, null):Float;
	
	public function new(?_parent:Object) 
	{
		super(_parent);
		
		sceneLayer = new Object(this);
		rideLayer = new Object(this);
		previewLayer = new Graphics(this);
		sledderLayer = new Object(this);
		sledderGFX = new Graphics(sledderLayer);
		sledderGFX.smooth = true;
		
		preview = new Object(this);
		
		@:privateAccess Main.rootScene.renderer.manager.globals.set("render.mode", 0);
	}
	
	
	public function drawRiders() {
		
		sledderGFX.clear();
		
		for (rider in Main.riders.riders) {
			rider.renderRider();
		}
	}
	
	public function setCanvasPosition(_x:Float, _y:Float, ?_log:Bool = true) {
		setCanvasPosition(_x, _y);
		
	}
	
	public function addCanvasPosition(_x:Float, _y:Float) {
		x += _x;
		y += _y;
	}
	
	public function zoomCanvas(wheelDelta:Int, _ignoreMouse:Bool = false):Void 
	{
		var oldScale = scaleX;
		var oldMouseX = mouseX;
		var oldMouseY = mouseY;
		var delta = Math.min(Math.max((scaleX) * (wheelDelta > 0 ? 0.825 : 1.125), 0.01), 100);
		setScale(delta);
		var newScale = scaleX;
		
		if (_ignoreMouse)
		{
			oldMouseX = (Main.rootScene.width / 2) - this.x;
			oldMouseY = (Main.rootScene.height / 2) - this.y;
		}
		
		x += -(oldMouseX * (newScale - oldScale));
		y += -(oldMouseY * (newScale - oldScale));
	}
	
	public var previewLine:BitmapLine;
	
	public function drawPreviewLine(_line:LineObject) {
		
		if (previewLayer.contains(previewLine)) previewLine.remove();
		
		previewLine = new BitmapLine(_line, previewLayer);
	}
	
	public function trashTrack() {
		for (line in Grid.lines) {
			Main.lineCanvas.removeLine(line);
		}
	}
	
	function get_mouseX():Float 
	{
		return (Main.rootScene.mouseX - this.x) * (1 / scaleX);
	}
	
	function get_mouseY():Float 
	{
		return (Main.rootScene.mouseY - this.y) * (1 / scaleX);
	}
}