package components.stage;

import hxlr.lines.LineObject;
import hxlr.lines.Floor;
import hxlr.lines.Accel;
import hxlr.lines.Scenery;
import hxlr.enums.LineType;
import hxlr.engine.Grid;
import format.agal.Data.Reg;
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
	public var previewLayer:Graphics;
	var rideLayer:Graphics;
	var sceneColorLayer:Graphics;
	var scenePlaybackLayer:Graphics;
	var colorLayer:Graphics;
	
	public var preview:Object;
	
	var eraserSize:Int = 5;
	
	@:isVar public var drawMode(get, set):DrawMode = FULL_EDIT;
	
	public var sledderLayer:Object;
	
	public function new(?_parent:Object) 
	{
		super();
		
		_parent.addChild(this);
		
		sceneColorLayer = new Graphics(this);
		scenePlaybackLayer = new Graphics(this);
		scenePlaybackLayer.visible = false;
		colorLayer = new Graphics(this);
		rideLayer = new Graphics(this);
		previewLayer = new Graphics(this);
		
		sledderLayer = new Object(this);
		
		preview = new Object(this);
	}
	
	public function drawRiders() {
		for (rider in Main.riders.riders) {
			rider.renderRider();
		}
	}
	
	public function setCanvasPosition(_x:Float, _y:Float, ?_log:Bool = true) {
		setCanvasPosition(_x, _y);
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
	
	public function redrawLines(_type:LineType) {
		
		switch (_type) {
			case LineType.FLOOR | LineType.ACCEL :
				rideLayer.clear();
				colorLayer.clear();
			case LineType.SCENE :
				sceneColorLayer.clear();
				scenePlaybackLayer.clear();
			default :
		}
		
		for (line in Grid.lines) {
			if (line == null) continue;
			drawLineGraphic(line);
		}
	}
	
	public function drawPreviewLine(_line:LineObject) {
		
		previewLayer.clear();
		
		var lineCapRadius:Float = 0.0025;
		var lineCapSegment:Int = 15;
		
		switch (_line.type) {
			
			case LineType.FLOOR :
				
				previewLayer.lineStyle(2, 0x0066FF);
				previewLayer.moveTo(_line.start.x + _line.nx, _line.start.y + _line.ny);
				previewLayer.lineTo(_line.end.x + _line.nx, _line.end.y + _line.ny);
				
				previewLayer.lineStyle(2, 0);
				previewLayer.moveTo(_line.start.x, _line.start.y);
				previewLayer.lineTo(_line.end.x, _line.end.y);
				previewLayer.drawCircle(_line.start.x, _line.start.y, lineCapRadius, lineCapSegment);
				previewLayer.drawCircle(_line.end.x, _line.end.y, lineCapRadius, lineCapSegment);
				
			case LineType.ACCEL :
				
				previewLayer.lineStyle(2, 0xCC0000);
				previewLayer.moveTo(_line.start.x + _line.nx, _line.start.y + _line.ny);
				previewLayer.lineTo(_line.end.x + _line.nx, _line.end.y + _line.ny);
				previewLayer.lineTo(_line.end.x + (_line.nx * 4 - _line.dx * _line.invDistance * 5), _line.end.y + (_line.ny * 4 - _line.dy * _line.invDistance * 5));
				previewLayer.lineTo(_line.end.x - _line.dx * _line.invDistance * 5, _line.end.y - _line.dy * _line.invDistance * 5);
				
				previewLayer.lineStyle(2, 0);
				previewLayer.moveTo(_line.start.x, _line.start.y);
				previewLayer.lineTo(_line.end.x, _line.end.y);
				previewLayer.drawCircle(_line.start.x, _line.start.y, lineCapRadius, lineCapSegment);
				previewLayer.drawCircle(_line.end.x, _line.end.y, lineCapRadius, lineCapSegment);
				
			case LineType.SCENE :
				
				previewLayer.lineStyle(2, 0);
				previewLayer.moveTo(_line.start.x, _line.start.y);
				previewLayer.lineTo(_line.end.x, _line.end.y);
				previewLayer.drawCircle(_line.start.x, _line.start.y, lineCapRadius, lineCapSegment);
				previewLayer.drawCircle(_line.end.x, _line.end.y, lineCapRadius, lineCapSegment);
				
				previewLayer.lineStyle(2, 0x00CC00);
				previewLayer.moveTo(_line.start.x, _line.start.y);
				previewLayer.lineTo(_line.end.x, _line.end.y);
				previewLayer.drawCircle(_line.start.x, _line.start.y, lineCapRadius, lineCapSegment);
				previewLayer.drawCircle(_line.end.x, _line.end.y, lineCapRadius, lineCapSegment);
				
			default :
				
				previewLayer.lineStyle(1, 0xFF0000);
				previewLayer.moveTo(_line.start.x, _line.start.y);
				previewLayer.lineTo(_line.end.x, _line.end.y);
			
		}
		
	}
	
	public function drawLineGraphic(_line:LineObject) {
		
		var lineCapRadius:Float = 0.0025;
		var lineCapSegment:Int = 15;
		
		switch (_line.type) {
			
			case LineType.FLOOR :
				
				rideLayer.lineStyle(2, 0);
				rideLayer.moveTo(_line.start.x, _line.start.y);
				rideLayer.lineTo(_line.end.x, _line.end.y);
				rideLayer.drawCircle(_line.start.x, _line.start.y, lineCapRadius, lineCapSegment);
				rideLayer.drawCircle(_line.end.x, _line.end.y, lineCapRadius, lineCapSegment);
				
				colorLayer.lineStyle(2, 0x0066FF);
				colorLayer.moveTo(_line.start.x + _line.nx, _line.start.y + _line.ny);
				colorLayer.lineTo(_line.end.x + _line.nx, _line.end.y + _line.ny);
				
			case LineType.ACCEL :
				
				rideLayer.lineStyle(2, 0);
				rideLayer.moveTo(_line.start.x, _line.start.y);
				rideLayer.lineTo(_line.end.x, _line.end.y);
				rideLayer.drawCircle(_line.start.x, _line.start.y, lineCapRadius, lineCapSegment);
				rideLayer.drawCircle(_line.end.x, _line.end.y, lineCapRadius, lineCapSegment);
				
				colorLayer.lineStyle(2, 0xCC0000);
				colorLayer.moveTo(_line.start.x + _line.nx, _line.start.y + _line.ny);
				colorLayer.lineTo(_line.end.x + _line.nx, _line.end.y + _line.ny);
				colorLayer.lineTo(_line.end.x + (_line.nx * 4 - _line.dx * _line.invDistance * 5), _line.end.y + (_line.ny * 4 - _line.dy * _line.invDistance * 5));
				colorLayer.lineTo(_line.end.x - _line.dx * _line.invDistance * 5, _line.end.y - _line.dy * _line.invDistance * 5);
				
				
			case LineType.SCENE :
				
				sceneColorLayer.lineStyle(2, 0x00CC00);
				sceneColorLayer.moveTo(_line.start.x, _line.start.y);
				sceneColorLayer.lineTo(_line.end.x, _line.end.y);
				sceneColorLayer.drawCircle(_line.start.x, _line.start.y, lineCapRadius, lineCapSegment);
				sceneColorLayer.drawCircle(_line.end.x, _line.end.y, lineCapRadius, lineCapSegment);
				
				scenePlaybackLayer.lineStyle(2, 0);
				scenePlaybackLayer.moveTo(_line.start.x, _line.start.y);
				scenePlaybackLayer.lineTo(_line.end.x, _line.end.y);
				scenePlaybackLayer.drawCircle(_line.start.x, _line.start.y, lineCapRadius, lineCapSegment);
				scenePlaybackLayer.drawCircle(_line.end.x, _line.end.y, lineCapRadius, lineCapSegment);
				
			default :
				
				rideLayer.lineStyle(1, 0xFF0000);
				rideLayer.moveTo(_line.start.x, _line.start.y);
				rideLayer.lineTo(_line.end.x, _line.end.y);
			
		}
		
	}
	
	public function addLine(_type:LineType, _x1:Float, _y1:Float, _x2:Float, _y2:Float, ?_shifted:Bool = false, ?_limMode:Int = -1, ?_lineID:Int = -1) {
		
		var line:LineObject = null;
		switch (_type) {
			
			case LineType.FLOOR:
				line = new Floor(new Point(_x1, _y1), new Point(_x2, _y2), _shifted);
			case LineType.ACCEL :
				line = new Accel(new Point(_x1, _y1), new Point(_x2, _y2), _shifted);
			case LineType.SCENE :
				line = new Scenery(new Point(_x1, _y1), new Point(_x2, _y2), _shifted);
			default :
			
		}
		
		if (_limMode != -1) line.setLim(_limMode);
		if (_lineID != -1) line.id = _lineID;
		
		Grid.register(line);
		
		drawLineGraphic(line);
		
		#if (js && !embeded_track)
		
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
	
	public function trashTrack() {
		rideLayer.clear();
		colorLayer.clear();
		sceneColorLayer.clear();
		scenePlaybackLayer.clear();
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
	
	#if (js && !embeded_track)
	public function P2PLineAdd(_type:Int, _x1:Float, _y1:Float, _x2:Float, _y2:Float, ?_shifted:Bool = false, ?_limMode:Int = -1) {
		var line:LineObject = null;
		switch (_type) {
			case 0:
				line = new Floor(new Point(_x1, _y1), new Point(_x2, _y2), _shifted);
				if (_limMode != -1) line.setLim(_limMode);
			case 1 :
				line = new Accel(new Point(_x1, _y1), new Point(_x2, _y2), _shifted);
				if (_limMode != -1) line.setLim(_limMode);
			case 2 :
				line = new Scenery(new Point(_x1, _y1), new Point(_x2, _y2), _shifted);
			default :
			
		}
		drawLineGraphic(line);
		Grid.register(line);
	}
	#end
}