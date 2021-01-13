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
import network.NetAction;

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
	
	public function addLine(_type:Int, _x1:Float, _y1:Float, _x2:Float, _y2:Float, ?_shifted:Bool = false, ?_limMode:Int = -1) {
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
		
		#if js
		
		if (Main.p2p.connected) Main.p2p.updateLineInfo(NetAction.lineDownload, [
			line.type,
			line.start.x,
			line.start.y,
			line.end.x,
			line.end.y,
			line.shifted,
			line.limType
		]);
		
		#end
	}
	
	public function removeLine(_line:LineBase) {
		
		colorLayer.removeChild(_line.colorLayer);
		sceneColorLayer.removeChild(_line.colorLayer);
		scenePlaybackLayer.removeChild(_line.rideLayer);
		rideLayer.removeChild(_line.rideLayer);
		
		#if js
		if (Main.p2p.connected) Main.p2p.updateLineInfo(NetAction.deleteLine, [_line.id]);
		#end
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
	
	#if js
	public function P2PLineAdd(_type:Int, _x1:Float, _y1:Float, _x2:Float, _y2:Float, ?_shifted:Bool = false, ?_limMode:Int = -1) {
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
	}
	
	public function P2PRemoveLine(_id:Int) {
		var _line = Main.grid.lines[_id];
		Main.grid.unregister(_line);
		colorLayer.removeChild(_line.colorLayer);
		sceneColorLayer.removeChild(_line.colorLayer);
		scenePlaybackLayer.removeChild(_line.rideLayer);
		rideLayer.removeChild(_line.rideLayer);
	}
	#end
}