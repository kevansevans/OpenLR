package components.stage;

import h2d.Object;
import enums.LineDrawMode;
import components.managers.Grid.GridObject;
import components.managers.Grid;
import h2d.Graphics;
import components.lines.LineBase;

/**
 * ...
 * @author Kaelan
 */
class RenderChunk extends Object
{
	public static var lineRenderMode:LineDrawMode = EDIT;
	
	public var selfKey:String;
	public var gridChunks:Array<LineContainer>;
	
	var rideLayer:Graphics;
	var colorLayer:Graphics;
	var scenePlaybackLayer:Graphics;
	var sceneColorLayer:Graphics;
	
	
	public function new(_x:Int, _y:Int, ?_parent:Object) {
		
		super(_parent);
		
		this.x = _x;
		this.y = _y;
		
		sceneColorLayer = new Graphics(this);
		scenePlaybackLayer = new Graphics(this);
		scenePlaybackLayer.visible = false;
		colorLayer = new Graphics(this);
		rideLayer = new Graphics(this);
		
		updateRender();
	}
	
	public function updateRender() {
		
		updateGridChunks();
		
		rideLayer.clear();
		colorLayer.clear();
		sceneColorLayer.clear();
		scenePlaybackLayer.clear();
		
		for (chunk in gridChunks) {
			for (line in chunk.allLines) {
				drawLineGraphic(line);
			}
		}
		
	}
	
	public function drawLineGraphic(_line:LineBase) {
		
		var lineCapRadius:Float = 0.0025;
		var lineCapSegment:Int = 15;
		
		switch (_line.type) {
			
			case 0 :
				
				rideLayer.lineStyle(2, 0);
				rideLayer.moveTo(_line.start.x - this.x, _line.start.y - this.y);
				rideLayer.lineTo(_line.end.x - this.x, _line.end.y - this.y);
				rideLayer.drawCircle(_line.start.x - this.x, _line.start.y - this.y, lineCapRadius, lineCapSegment);
				rideLayer.drawCircle(_line.end.x - this.x, _line.end.y - this.y, lineCapRadius, lineCapSegment);
				
				colorLayer.lineStyle(2, 0x0066FF);
				colorLayer.moveTo(_line.start.x - this.x + _line.nx, _line.start.y - this.y + _line.ny);
				colorLayer.lineTo(_line.end.x - this.x + _line.nx, _line.end.y - this.y + _line.ny);
				
			case 1 :
				
				rideLayer.lineStyle(2, 0);
				rideLayer.moveTo(_line.start.x - this.x, _line.start.y - this.y);
				rideLayer.lineTo(_line.end.x - this.x, _line.end.y - this.y);
				rideLayer.drawCircle(_line.start.x - this.x, _line.start.y - this.y, lineCapRadius, lineCapSegment);
				rideLayer.drawCircle(_line.end.x - this.x, _line.end.y - this.y, lineCapRadius, lineCapSegment);
				
				colorLayer.lineStyle(2, 0xCC0000);
				colorLayer.moveTo(_line.start.x - this.x + _line.nx, _line.start.y - this.y + _line.ny);
				colorLayer.lineTo(_line.end.x - this.x + _line.nx, _line.end.y - this.y + _line.ny);
				colorLayer.lineTo(_line.end.x - this.x + (_line.nx * 4 - _line.dx * _line.invDistance * 5), _line.end.y - this.y + (_line.ny * 4 - _line.dy * _line.invDistance * 5));
				colorLayer.lineTo(_line.end.x - this.x - _line.dx * _line.invDistance * 5, _line.end.y - this.y - _line.dy * _line.invDistance * 5);
				
				
			case 2 :
				
				sceneColorLayer.lineStyle(2, 0x00CC00);
				sceneColorLayer.moveTo(_line.start.x - this.x, _line.start.y - this.y);
				sceneColorLayer.lineTo(_line.end.x - this.x, _line.end.y - this.y);
				sceneColorLayer.drawCircle(_line.start.x - this.x, _line.start.y - this.y, lineCapRadius, lineCapSegment);
				sceneColorLayer.drawCircle(_line.end.x - this.x, _line.end.y - this.y, lineCapRadius, lineCapSegment);
				
				scenePlaybackLayer.lineStyle(2, 0);
				scenePlaybackLayer.moveTo(_line.start.x - this.x, _line.start.y - this.y);
				scenePlaybackLayer.lineTo(_line.end.x - this.x, _line.end.y - this.y);
				scenePlaybackLayer.drawCircle(_line.start.x - this.x, _line.start.y - this.y, lineCapRadius, lineCapSegment);
				scenePlaybackLayer.drawCircle(_line.end.x - this.x, _line.end.y - this.y, lineCapRadius, lineCapSegment);
				
			default :
				
				rideLayer.lineStyle(1, 0xFF0000);
				rideLayer.moveTo(_line.start.x - this.x, _line.start.y - this.y);
				rideLayer.lineTo(_line.end.x - this.x, _line.end.y - this.y);
			
		}
		
	}
	
	public function updateGridChunks():Void 
	{
		gridChunks = new Array();
		
		var gridPos = Grid.registryPosition(this.x, this.y);
		for (_x in 0...75) for (_y in 0...75) {
			var key = 'x${_x + gridPos.x - this.x}y${_y + gridPos.y - this.y}';
			if (Main.grid.registry[key] == null) continue;
			else gridChunks.push(Main.grid.registry[key]);
		}
	}
}