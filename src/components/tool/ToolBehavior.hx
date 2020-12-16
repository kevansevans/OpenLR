package components.tool;
import components.stage.Canvas;
import enums.Commands;
import h2d.Interactive;
import h2d.Scene;
import h2d.col.Point;
import hxd.Event;
import hxd.Key;

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
enum abstract LineColor(Int) from Int {
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
	}
	
	var mouseStart:Point;
	var mouseEnd:Point;
	
	var leftIsDown:Bool = false;
	var middleIsDown:Bool = false;
	
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
		
		Main.canvas.addLine(color, lineStart.x, lineStart.y, lineEnd.x, lineEnd.y);
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
						Main.console.log("Tool set to Pencil", 0x0000BB);
					case Key.W:
						tool = LINE;
						Main.console.log("Tool set to Line", 0x0000BB);
					case Key.E:
						tool = ERASER;
						Main.console.log("Tool set to Eraser", 0x0000BB);
						
					case Key.NUMBER_1 :
						color = FLOOR;
						Main.console.log("Line type set to Normal", 0x0066FF);
					case Key.NUMBER_2 :
						color = ACCEL;
						Main.console.log("Line type set to Accel", 0xCC0000);
					case Key.NUMBER_3 :
						color = SCENE;
						Main.console.log("Line type set to Scenery", 0x00CC00);
						
					case Key.CTRL :
						Main.simulation.rewinding = true;
						Main.console.log("<< Rewindind <<", 0x00CC00);
						
					case Key.SPACE :
						Main.simulation.playing = !Main.simulation.playing;
						
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
						Main.console.log("|| Resume ||", 0x00CC00);
				}
			default:
		}
	}
}