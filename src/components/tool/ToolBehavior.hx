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
enum LineColor {
	FLOOR;
	ACCEL;
	SCENE;
	NONE;
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
			case 2 :
				middleIsDown = true;
				mouseStart = new Point(s2d.mouseX, s2d.mouseY);
			default:
		}
	}
	
	function mouseWheel(event:Event):Void 
	{
		if (event.wheelDelta > 0) {
			Main.console.runCommandNoLog(Commands.zoomIn);
		} else if (event.wheelDelta < 0) {
			Main.console.runCommandNoLog(Commands.zoomOut);
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
					
					canvas.removeLine();
					
				default :
					
			}
		}
		
		if (middleIsDown) {
			
			mouseEnd = new Point(s2d.mouseX, s2d.mouseY);
			
			var x:Float = -(mouseStart.x - mouseEnd.x);
			var y:Float = -(mouseStart.y - mouseEnd.y);
			
			Main.console.runCommandNoLog(Commands.addCanvasPosition + ' $x $y');
			
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
		
		Main.console.runCommandNoLog('drawLine $color ${lineStart.x} ${lineStart.y} ${lineEnd.x} ${lineEnd.y}');
	}
	
	function keyInputDown(event:Event):Void 
	{
		switch (event.kind) {
			case EKeyDown :
				switch (event.keyCode) {
					case Key.QWERTY_EQUALS :
						Main.console.runCommandNoLog(Commands.gridSizeDec);
					case Key.QWERTY_MINUS :
						Main.console.runCommandNoLog(Commands.gridSizeInc);
						
					case Key.Q:
						Main.console.runCommandNoLog(Commands.setTool + " Pencil");
						Main.console.log("Tool set to Pencil", 0x0000BB);
					case Key.W:
						Main.console.runCommandNoLog(Commands.setTool + " Line");
						Main.console.log("Tool set to Line", 0x0000BB);
					case Key.E:
						Main.console.runCommandNoLog(Commands.setTool + " Eraser");
						Main.console.log("Tool set to Eraser", 0x0000BB);
						
					case Key.NUMBER_1 :
						Main.console.runCommandNoLog(Commands.setLineColor + " floor");
						Main.console.log("Line type set to Normal", 0x0066FF);
					case Key.NUMBER_2 :
						Main.console.runCommandNoLog(Commands.setLineColor + " accel");
						Main.console.log("Line type set to Accel", 0xCC0000);
					case Key.NUMBER_3 :
						Main.console.runCommandNoLog(Commands.setLineColor + " scene");
						Main.console.log("Line type set to Scenery", 0x00CC00);
				}
			default:
		}
	}
}