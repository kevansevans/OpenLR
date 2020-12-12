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
class ToolBehavior 
{
	public var s2d:Scene;
	public var interactive:Interactive;
	public var canvas:Canvas;
	
	public var tool:ToolMode;
	
	public function new(_stage:Scene, _clicky:Interactive, _canvas:Canvas) 
	{
		s2d  = _stage;
		interactive = _clicky;
		canvas = _canvas;
		
		tool = PENCIL;
		
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
			Main.console.runCommand(Commands.zoomIn);
		} else if (event.wheelDelta < 0) {
			Main.console.runCommand(Commands.zoomOut);
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
					
				default :
					
			}
		}
		
		if (middleIsDown) {
			
			mouseEnd = new Point(s2d.mouseX, s2d.mouseY);
			
			var x:Float = -(mouseStart.x - mouseEnd.x);
			var y:Float = -(mouseStart.y - mouseEnd.y);
			
			Main.console.runCommand(Commands.addCanvasPosition + ' $x $y');
			
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
		
		Main.console.runCommand('drawLine 0 ${lineStart.x} ${lineStart.y} ${lineEnd.x} ${lineEnd.y}');
	}
	
	function keyInputDown(event:Event):Void 
	{
		switch (event.kind) {
			case EKeyDown :
				switch (event.keyCode) {
					case Key.QWERTY_EQUALS :
						Main.console.runCommand(Commands.gridSizeDec);
					case Key.QWERTY_MINUS :
						Main.console.runCommand(Commands.gridSizeInc);
						
					case Key.Q:
						Main.console.runCommand(Commands.setTool + " Pencil");
						Main.console.log("Tool set to Pencil", 0x0000BB);
					case Key.W:
						Main.console.runCommand(Commands.setTool + " Line");
						Main.console.log("Tool set to Line", 0x0000BB);
					case Key.E:
						Main.console.runCommand(Commands.setTool + " Eraser");
						Main.console.log("Tool set to Eraser", 0x0000BB);
				}
			default:
		}
	}
}