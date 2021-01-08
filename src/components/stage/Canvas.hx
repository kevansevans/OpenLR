package components.stage;

import components.lines.LineBase;
import components.lines.Floor;
import components.lines.Accel;
import components.lines.Scenery;
import components.managers.Grid;
import enums.LineDrawMode;
import h2d.Graphics;
import h2d.Object;
import h2d.Scene;
import h2d.col.Point;
import h2d.Bitmap;
import h2d.Tile;

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
class Canvas extends Scene
{
	var rideLayer:Object;
	var sceneColorLayer:Object;
	var scenePlaybackLayer:Object;
	var colorLayer:Object;
	
	public var preview:Object;
	
	var eraserSize:Int = 5;
	
	@:isVar public var drawMode(get, set):DrawMode = FULL_EDIT;
	
	public var sledderLayer:Object;
	
	public function new(?_parent:Object) 
	{
		super();
		
		_parent.addChild(this);
		
		sceneColorLayer = new Object(this);
		scenePlaybackLayer = new Object(this);
		scenePlaybackLayer.visible = false;
		colorLayer = new Object(this);
		rideLayer = new Object(this);
		
		sledderLayer = new Object(this);
		
		preview = new Object(this);
	}
	
	public function drawRiders() {
		for (rider in Main.riders.riders) {
			rider.renderRider();
		}
	}
	
	public function setCanvasPosition(_x:Float, _y:Float, ?_log:Bool = true) {
		setPosition(_x, _y);
		if (_log) Main.console.log("Set canvas position to: " + _x + " " + _y, 0x0000BB);
	}
	
	public function addCanvasPosition(_x:Float, _y:Float) {
		x += _x;
		y += _y;
	}
	
	public function zoomCanvas(wheelDelta:Int):Void 
	{
		var oldScale = scaleX;
		var oldMouseX = mouseX;
		var oldMouseY = mouseY;
		var delta = Math.min(Math.max((scaleX) * (wheelDelta > 0 ? 0.825 : 1.125), 0.01), 100);
		setScale(delta);
		var newScale = scaleX;
		x += -(oldMouseX * (newScale - oldScale));
		y += -(oldMouseY * (newScale - oldScale));
	}
	
	public function erase() {
		var gridChunk = Grid.registryPosition(mouseX, mouseY);
		var key:String = "";
		var invScale = 1 / scaleX;
		for (_x in -1...2) for (_y in -1...2) {
			key = 'x${_x + gridChunk.x}y${_y + gridChunk.y}';
			if (Main.grid.registry[key] == null) continue;
			var storage = Main.grid.registry[key];
			
			var mouse:Point = new Point(mouseX, mouseY);
			
			for (line in storage.colliders) {
				var _loc9 = invScale;
				var _loc1 = line;
                var _loc3 = mouseX - _loc1.start.x;
                var _loc2 = mouseY - _loc1.start.y;
                var _loc12 = Math.sqrt(Math.pow(_loc3, 2) + Math.pow(_loc2, 2));
                var _loc13 = Math.sqrt(Math.pow(mouseX - _loc1.end.x, 2) + Math.pow(mouseY - _loc1.end.y, 2));
                var _loc11 = Math.abs(_loc1.nx * _loc3 + _loc1.ny * _loc2);
                var _loc4 = (_loc3 * _loc1.dx + _loc2 * _loc1.dy) * _loc1.invSqrDistance;
                if (_loc12 < eraserSize * _loc9 || _loc13 < eraserSize * _loc9 || _loc11 < eraserSize * _loc9 && _loc4 >= 0 && _loc4 <= 1)
                {
					removeLine(line);
					#if js
					if (Main.p2p.connected) Main.p2p.removeLine(line.id);
					#end
					continue;
				}
				
			}
			
			for (line in storage.nonColliders) {
				//crummy decompiler code
				var _loc9 = invScale;
				var _loc1 = line;
                var _loc3 = mouseX - _loc1.start.x;
                var _loc2 = mouseY - _loc1.start.y;
                var _loc12 = Math.sqrt(Math.pow(_loc3, 2) + Math.pow(_loc2, 2));
                var _loc13 = Math.sqrt(Math.pow(mouseX - _loc1.end.x, 2) + Math.pow(mouseY - _loc1.end.y, 2));
                var _loc11 = Math.abs(_loc1.nx * _loc3 + _loc1.ny * _loc2);
                var _loc4 = (_loc3 * _loc1.dx + _loc2 * _loc1.dy) * _loc1.invSqrDistance;
                if (_loc12 < eraserSize * _loc9 || _loc13 < eraserSize * _loc9 || _loc11 < eraserSize * _loc9 && _loc4 >= 0 && _loc4 <= 1)
                {
					removeLine(line);
					#if js
					if (Main.p2p.connected) Main.p2p.removeLine(line.id);
					#end
					continue;
				}
			}
		}
	}
	
	public function addLine(_type:Int, _x1:Float, _y1:Float, _x2:Float, _y2:Float, ?_shifted:Bool = false, ?_limMode:Int = -1):LineBase {
		var line:LineBase = null;
		switch (_type) {
			case 0:
				line = new Floor(new Point(_x1, _y1), new Point(_x2, _y2), _shifted);
				if (_limMode != -1) line.setLim(_limMode);
				colorLayer.addChild(line.colorLayer);
				rideLayer.addChild(line.rideLayer);
			case 1 :
				line = new Accel(new Point(_x1, _y1), new Point(_x2, _y2), _shifted);
				if (_limMode != -1) line.setLim(_limMode);
				colorLayer.addChild(line.colorLayer);
				rideLayer.addChild(line.rideLayer);
			case 2 :
				line = new Scenery(new Point(_x1, _y1), new Point(_x2, _y2), _shifted);
				sceneColorLayer.addChild(line.colorLayer);
				scenePlaybackLayer.addChild(line.rideLayer);
			default :
			
		}
		line.render();
		Main.grid.register(line);
		return line;
	}
	
	public function clear() {
		for (line in Main.grid.lines) {
			removeLine(line);
		}
	}
	
	public function removeLine(_line:LineBase) {
		Main.grid.unregister(_line);
		colorLayer.removeChild(_line.colorLayer);
		sceneColorLayer.removeChild(_line.colorLayer);
		scenePlaybackLayer.removeChild(_line.rideLayer);
		rideLayer.removeChild(_line.rideLayer);
	}
	
	function get_drawMode():DrawMode 
	{
		return drawMode;
	}
	
	function set_drawMode(_mode:DrawMode):DrawMode 
	{
		switch (_mode) {
			case FULL_EDIT :
				colorLayer.visible = true;
				sceneColorLayer.visible = true;
				scenePlaybackLayer.visible = false;
				rideLayer.visible = true;
				Main.console.log("Draw mode set to Edit");
			case PLAYBACK :
				colorLayer.visible = false;
				sceneColorLayer.visible = false;
				scenePlaybackLayer.visible = true;
				rideLayer.visible = true;
				Main.console.log("Draw mode set to Playback");
			case NO_SCENERY_EDIT :
				colorLayer.visible = true;
				sceneColorLayer.visible = false;
				scenePlaybackLayer.visible = false;
				rideLayer.visible = true;
				Main.console.log("Draw mode set to No Scenery Edit");
			case NO_SCENERY_PLAYBACK :
				colorLayer.visible = false;
				sceneColorLayer.visible = false;
				scenePlaybackLayer.visible = false;
				rideLayer.visible = true;
				Main.console.log("Draw mode set to No Scenery Playback");
			case SCENERY_EDIT :
				colorLayer.visible = false;
				sceneColorLayer.visible = true;
				scenePlaybackLayer.visible = false;
				rideLayer.visible = false;
				Main.console.log("Draw mode set to Scenery Edit Only");
			case SCENERY_PLAYBACK :
				colorLayer.visible = false;
				sceneColorLayer.visible = false;
				scenePlaybackLayer.visible = true;
				rideLayer.visible = false;
				Main.console.log("Draw mode set to Scenery Playback Only");
		}
		return drawMode = _mode;
	}
}