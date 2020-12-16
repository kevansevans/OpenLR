package components.tool;
import components.lines.Floor;
import components.lines.Accel;
import components.lines.Scenery;
import components.lines.LineBase;
import components.stage.Canvas;
import enums.Commands;
import h2d.Bitmap;
import hxd.BitmapData;
import h2d.Tile;
import h2d.Interactive;
import h2d.Scene;
import h2d.col.Point;
import hxd.Cursor;
import hxd.Event;
import hxd.Key;
import hxd.Res;

/**
 * ...
 * @author Kaelan
 */
enum ToolMode {
	NONE;
	PENCIL;
	LINE;
	ERASER;
}
enum abstract LineColor(Int) from Int to Int {
	var FLOOR:Int;
	var ACCEL:Int;
	var SCENE:Int;
	var NONE = -1;
}
class ToolBehavior 
{
	public var s2d:Scene;
	public var interactive:Interactive;
	public var canvas:Canvas;
	
	public var tool:ToolMode;
	public var color:Int;
	
	public var bitmapPencilBlue:BitmapData;
	public var bitmapPencilRed:BitmapData;
	public var bitmapPencilGreen:BitmapData;
	public var cursorPencilBlue:Cursor;
	public var cursorPencilRed:Cursor;
	public var cursorPencilGreen:Cursor;
	
	public function new(_stage:Scene, _clicky:Interactive, _canvas:Canvas) 
	{
		s2d  = _stage;
		interactive = _clicky;
		canvas = _canvas;
		
		tool = PENCIL;
		color = 0;
		
		interactive.enableRightButton = true;
		interactive.onKeyDown = keyInputDown;
		interactive.onKeyUp = keyInputDown;
		interactive.onPush = mouseDown;
		interactive.onRelease = mouseUp;
		interactive.onMove = mouseMove;
		interactive.onWheel = mouseWheel;
		
		bitmapPencilBlue = Res.tool.pencilBlue.toBitmap();
		cursorPencilBlue = Cursor.Custom(new CustomCursor([bitmapPencilBlue], 0, 1, 25));
		bitmapPencilRed = Res.tool.pencilRed.toBitmap();
		cursorPencilRed = Cursor.Custom(new CustomCursor([bitmapPencilRed], 0, 1, 25));
		bitmapPencilGreen = Res.tool.pencilGreen.toBitmap();
		cursorPencilGreen = Cursor.Custom(new CustomCursor([bitmapPencilGreen], 0, 1, 25));
		
		Main.canvas_interaction.cursor = cursorPencilBlue;
	}
	
	var mouseStart:Point;
	var mouseEnd:Point;
	
	var leftIsDown:Bool = false;
	var middleIsDown:Bool = false;
	
	var shifted:Bool = false;
	
	function mouseDown(event:Event):Void 
	{
		switch (event.button) {
			case 0:
				leftIsDown = true;
				mouseStart = new Point(s2d.mouseX, s2d.mouseY);
				
				switch (tool) {
					case ERASER :
						canvas.erase();
					default :
				}
			case 2 :
				middleIsDown = true;
				mouseStart = new Point(s2d.mouseX, s2d.mouseY);
			case 3 :
				Main.simulation.backSim();
			case 4 :
				Main.simulation.stepSim();
			default:
				trace(event.button);
		}
	}
	
	function mouseWheel(event:Event):Void 
	{
		if (event.wheelDelta > 0) {
			Main.canvas.zoomCanvas(1);
		} else if (event.wheelDelta < 0) {
			Main.canvas.zoomCanvas(-1);
		}
	}
	
	function mouseMove(event:Event):Void 
	{
		if (!leftIsDown) {
			//actions that may need the mose to not be held?
		} else {
			switch (tool) {
				case NONE :
					
				case PENCIL :
					
					mouseEnd = new Point(s2d.mouseX, s2d.mouseY);
					if (Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) + Math.pow(mouseEnd.y - mouseStart.y, 2)) > 10) {
						drawLine();
						mouseStart = new Point(s2d.mouseX, s2d.mouseY);
						mouseEnd = new Point(s2d.mouseX, s2d.mouseY);
					}
					
				case LINE :
					
					mouseEnd = new Point(s2d.mouseX, s2d.mouseY);
					
					updatePreview();
					
				case ERASER :
					
					canvas.erase();
					
				default :
					
			}
		}
		
		if (middleIsDown) {
			
			mouseEnd = new Point(s2d.mouseX, s2d.mouseY);
			
			var x:Float = -(mouseStart.x - mouseEnd.x);
			var y:Float = -(mouseStart.y - mouseEnd.y);
			
			Main.canvas.addCanvasPosition(x, y);
			
			mouseStart = new Point(s2d.mouseX, s2d.mouseY);
		}
	}
	
	var previewLine:LineBase;
	function updatePreview() {
		if (previewLine != null) {
			Main.grid.unregister(previewLine);
			Main.canvas.preview.removeChild(previewLine.rideLayer);
			Main.canvas.preview.removeChild(previewLine.colorLayer);
		}
		
		switch (color) {
			case FLOOR :
				previewLine = new Floor(new Point(mouseStart.x, mouseStart.x), new Point(mouseEnd.x, mouseEnd.y), false);
				Main.canvas.preview.addChild(previewLine.colorLayer);
				Main.canvas.preview.addChild(previewLine.rideLayer);
				Main.grid.register(previewLine);
			case ACCEL :
				previewLine = new Accel(new Point(mouseStart.x, mouseStart.x), new Point(mouseEnd.x, mouseEnd.y), false);
				Main.canvas.preview.addChild(previewLine.colorLayer);
				Main.canvas.preview.addChild(previewLine.rideLayer);
				Main.grid.register(previewLine);
			case SCENE :
				previewLine = new Scenery(new Point(mouseStart.x, mouseStart.x), new Point(mouseEnd.x, mouseEnd.y), false);
				Main.canvas.preview.addChild(previewLine.colorLayer);
		}
		
		previewLine.render();
	}
	
	function mouseUp(event:Event):Void 
	{
		switch (event.button) {
			case 0:
				leftIsDown = false;
				switch (tool) {
					case NONE :
					
					case PENCIL :
						
					case LINE :
						mouseEnd = new Point(s2d.mouseX, s2d.mouseY);
						if (Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) + Math.pow(mouseEnd.y - mouseStart.y, 2)) < 10) return;
						drawLine();
						
						if (previewLine != null) {
							Main.grid.unregister(previewLine);
							Main.canvas.preview.removeChild(previewLine.rideLayer);
							Main.canvas.preview.removeChild(previewLine.colorLayer);
							previewLine = null;
						}
					case ERASER :
						
					default :
				}
			case 2:
				middleIsDown = false;
			default:
		}
	}
	
	function drawLine():Void 
	{
		var lineStart = canvas.globalToLocal(mouseStart);
		var lineEnd = canvas.globalToLocal(mouseEnd);
		
		Main.canvas.addLine(color, lineStart.x, lineStart.y, lineEnd.x, lineEnd.y, shifted);
	}
	
	function keyInputDown(event:Event):Void 
	{
		switch (event.kind) {
			case EKeyDown :
				switch (event.keyCode) {
					case Key.QWERTY_EQUALS :
						Main.viewGridSize += 1;
						Main.console.log('Ruler width set to: ${Main.viewGridSize}', 0x0066FF);
					case Key.QWERTY_MINUS :
						Main.viewGridSize -= 1;
						Main.viewGridSize = Std.int(Math.max(Main.viewGridSize, 1));
						Main.console.log('Ruler width set to: ${Main.viewGridSize}', 0x0066FF);
					case Key.Q:
						tool = PENCIL;
						updateCursor();
						Main.console.log("Tool set to Pencil", 0x0000BB);
					case Key.W:
						tool = LINE;
						updateCursor();
						Main.console.log("Tool set to Line", 0x0000BB);
					case Key.E:
						tool = ERASER;
						updateCursor();
						Main.console.log("Tool set to Eraser", 0x0000BB);
						
					case Key.A :
						Main.simulation.backSim();
					case Key.D :
						Main.simulation.stepSim();
						
					case Key.NUMBER_1 :
						color = FLOOR;
						updateCursor();
						Main.console.log("Line type set to Normal", 0x0066FF);
					case Key.NUMBER_2 :
						color = ACCEL;
						updateCursor();
						Main.console.log("Line type set to Accel", 0xCC0000);
					case Key.NUMBER_3 :
						color = SCENE;
						updateCursor();
						Main.console.log("Line type set to Scenery", 0x00CC00);
						
					case Key.CTRL :
						Main.simulation.rewinding = true;
						
					case Key.SPACE :
						if (!Main.simulation.paused) Main.simulation.pauseSim();
						else if (Main.simulation.paused) Main.simulation.resumeSim();
						
					case Key.RSHIFT :
						Main.simulation.updateSim();
					case Key.LSHIFT :
						shifted = true;
						
					case Key.TAB :
						switch (Main.canvas.drawMode) {
							case FULL_EDIT :
								Main.canvas.drawMode = NO_SCENERY_EDIT;
							case NO_SCENERY_EDIT :
								Main.canvas.drawMode = PLAYBACK;
							case PLAYBACK :
								Main.canvas.drawMode = NO_SCENERY_PLAYBACK;
							case NO_SCENERY_PLAYBACK :
								Main.canvas.drawMode = SCENERY_EDIT;
							case SCENERY_EDIT :
								Main.canvas.drawMode = SCENERY_PLAYBACK;
							case SCENERY_PLAYBACK :
								Main.canvas.drawMode = FULL_EDIT;
						}
						
				}
			case EKeyUp :
				switch (event.keyCode) {
					case Key.CTRL :
						Main.simulation.rewinding = false;
					case Key.LSHIFT :
						shifted = false;
				}
			default:
		}
	}
	
	function updateCursor():Void 
	{
		switch (tool) {
			case PENCIL :
				updatePencilCursor();
			default :
				Main.canvas_interaction.cursor = Default;
		}
	}
	
	function updatePencilCursor() {
		switch (color) {
			case FLOOR :
				Main.canvas_interaction.cursor = cursorPencilBlue;
			case ACCEL :
				Main.canvas_interaction.cursor = cursorPencilRed;
			case SCENE :
				Main.canvas_interaction.cursor = cursorPencilGreen;
			default :
				Main.canvas_interaction.cursor = Default;
		}
	}
}