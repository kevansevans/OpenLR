package components.stage;

import components.stage.LineShader;
import components.stage.VisLine;
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
enum DrawMode {
	FULL_EDIT;
	PLAYBACK;
	NO_SCENERY_EDIT;
	NO_SCENERY_PLAYBACK;
	SCENERY_EDIT;
	SCENERY_PLAYBACK;
}
class Canvas extends Object
{
	public var lineBitmaps:Map<LineObject, VisLine> = new Map();
	
	public var previewLayer:Object;
	var rideLayer:Object;
	var sceneLayer:Object;
	
	public var preview:Object;
	
	var eraserSize:Int = 5;
	
	@:isVar public var drawMode(get, set):DrawMode = FULL_EDIT;
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
	
	public var previewLine:VisLine;
	
	public function drawPreviewLine(_line:LineObject) {
		
		if (previewLayer.contains(previewLine)) previewLine.remove();
		
		previewLine = new VisLine(_line, previewLayer);
	}
	
	public function addVisLine(_line:LineObject) 
	{
		
		var line:VisLine = null;
		
		switch (_line.type) {
			case FLOOR | ACCEL | SLOW :
				line = new VisLine(_line, rideLayer);
			case SCENE :
				line = new VisLine(_line, sceneLayer);
			default :
				return;
		}
		
		lineBitmaps[_line] = line;
		
	}
	
	public function removeVisLine(_line:LineObject) {
		
		var line = lineBitmaps[_line];
		line.remove();
		lineBitmaps.remove(_line);
		
	}
	
	public function trashTrack() {
		for (line in Grid.lines) {
			removeVisLine(line);
		}
	}
	
	function get_drawMode():DrawMode 
	{
		return drawMode;
	}
	
	public function set_drawMode(_mode:DrawMode):DrawMode 
	{
		
		switch (_mode) {
			
			case FULL_EDIT :
				
				sceneLayer.visible = true;
				rideLayer.visible = true;
				ColorShader.drawMode = 0;
				
			case PLAYBACK :
				
				sceneLayer.visible = true;
				rideLayer.visible = true;
				ColorShader.drawMode = 1;
				
			case NO_SCENERY_EDIT :
				
				sceneLayer.visible = false;
				rideLayer.visible = true;
				ColorShader.drawMode = 0;
				
			case NO_SCENERY_PLAYBACK :
				
				sceneLayer.visible = false;
				rideLayer.visible = true;
				ColorShader.drawMode = 1;
				
			case SCENERY_EDIT :
				
				sceneLayer.visible = true;
				rideLayer.visible = false;
				ColorShader.drawMode = 0;
				
			case SCENERY_PLAYBACK :
				
				sceneLayer.visible = true;
				rideLayer.visible = false;
				ColorShader.drawMode = 1;
				
		}
		
		Main.textinfo.align();
		
		return drawMode = _mode;
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