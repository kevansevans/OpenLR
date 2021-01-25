package components.tool;
import components.lines.Undefined;
import components.managers.Grid;
import components.lines.Floor;
import components.lines.Accel;
import components.lines.Scenery;
import components.lines.LineBase;
import components.tool.ToolFunction;
import components.ui.Toolbar.Icon;
import hxd.BitmapData;
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
	public var tool:ToolMode;
	public var color:Int;
	
	public var bitmapPencilBlue:BitmapData;
	public var bitmapPencilRed:BitmapData;
	public var bitmapPencilGreen:BitmapData;
	public var cursorPencilBlue:Cursor;
	public var cursorPencilRed:Cursor;
	public var cursorPencilGreen:Cursor;
	
	public var bitmapLineBlue:BitmapData;
	public var bitmapLineRed:BitmapData;
	public var bitmapLineGreen:BitmapData;
	public var cursorLineBlue:Cursor;
	public var cursorLineRed:Cursor;
	public var cursorLineGreen:Cursor;
	
	public var bitmapEraser:BitmapData;
	public var bitmapEraserBlue:BitmapData;
	public var bitmapEraserRed:BitmapData;
	public var bitmapEraserGreen:BitmapData;
	public var cursorEraser:Cursor;
	public var cursorEraserBlue:Cursor;
	public var cursorEraserRed:Cursor;
	public var cursorEraserGreen:Cursor;
	
	public var lineSnapping:Bool = true;
	public var gridSnapping:Bool = false;
	public var gridSnapDistance(get, null):Float;
	public var snapDistance:Float = 15;
	
	public var colorEraser:Bool = false;
	
	public function new() 
	{
		tool = PENCIL;
		color = 0;
		
		Main.canvas_interaction.enableRightButton = true;
		Main.canvas_interaction.onKeyDown = keyInputDown;
		Main.canvas_interaction.onKeyUp = keyInputDown;
		Main.canvas_interaction.onPush = mouseDown;
		Main.canvas_interaction.onRelease = mouseUp;
		Main.canvas_interaction.onMove = mouseMove;
		Main.canvas_interaction.onWheel = mouseWheel;
		Main.canvas_interaction.onOver = function(e:Event) {
			Main.canvas_interaction.focus();
		}
		
		bitmapPencilBlue = Res.tool.pencilBlue.toBitmap();
		cursorPencilBlue = Cursor.Custom(new CustomCursor([bitmapPencilBlue], 0, 1, 25));
		bitmapPencilRed = Res.tool.pencilRed.toBitmap();
		cursorPencilRed = Cursor.Custom(new CustomCursor([bitmapPencilRed], 0, 1, 25));
		bitmapPencilGreen = Res.tool.pencilGreen.toBitmap();
		cursorPencilGreen = Cursor.Custom(new CustomCursor([bitmapPencilGreen], 0, 1, 25));
		
		bitmapLineBlue = Res.tool.lineBlue.toBitmap();
		cursorLineBlue = Cursor.Custom(new CustomCursor([bitmapLineBlue], 0, 12, 12));
		bitmapLineRed = Res.tool.lineRed.toBitmap();
		cursorLineRed = Cursor.Custom(new CustomCursor([bitmapLineRed], 0, 12, 12));
		bitmapLineGreen = Res.tool.lineGreen.toBitmap();
		cursorLineGreen = Cursor.Custom(new CustomCursor([bitmapLineGreen], 0, 12, 12));
		
		bitmapEraser = Res.tool.eraser.toBitmap();
		cursorEraser = Cursor.Custom(new CustomCursor([bitmapEraser], 0, 5, 5));
		bitmapEraserBlue = Res.tool.eraserBlue.toBitmap();
		cursorEraserBlue = Cursor.Custom(new CustomCursor([bitmapEraserBlue], 0, 5, 5));
		bitmapEraserRed = Res.tool.eraserRed.toBitmap();
		cursorEraserRed = Cursor.Custom(new CustomCursor([bitmapEraserRed], 0, 5, 5));
		bitmapEraserGreen = Res.tool.eraserGreen.toBitmap();
		cursorEraserGreen = Cursor.Custom(new CustomCursor([bitmapEraserGreen], 0, 5, 5));
		
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
				mouseStart = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
				mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
				
				switch (tool) {
					
					case ERASER :
						
						ToolFunction.erase(Main.canvas.mouseX, Main.canvas.mouseY);
						
					case PENCIL | LINE :
						
						snap(mouseStart);
						
					default :
						
				}
			case 2 :
				middleIsDown = true;
				mouseStart = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
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
		
		Main.canvas.preview.removeChildren();
		
		if (!leftIsDown) {
			//actions that may need the mose to not be held?
		} else {
			switch (tool) {
				case NONE :
					
				case PENCIL :
					
					mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
					if (Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) + Math.pow(mouseEnd.y - mouseStart.y, 2)) > 10 * (1 / Main.canvas.scaleX)) {
						drawLine();
						mouseStart = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
						mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
					}
					
					updatePreview();
					
				case LINE :
					
					mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
					
					snap(mouseEnd);
					
					updatePreview();
					
				case ERASER :
					
					ToolFunction.erase(Main.canvas.mouseX, Main.canvas.mouseY);
					
				default :
					
			}
		}
		
		if (middleIsDown) {
			
			mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
			
			var x:Float = -(mouseStart.x - mouseEnd.x) * Main.canvas.scaleX;
			var y:Float = -(mouseStart.y - mouseEnd.y) * Main.canvas.scaleX;
			
			Main.canvas.addCanvasPosition(x, y);
			mouseStart = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
		}
	}
	
	public var tempLine:LineBase;
	
	function updatePreview() {
		
		var preview = Main.canvas.preview;
		
		if (Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) +Math.pow(mouseEnd.y - mouseStart.y, 2)) * Main.canvas.scaleX < 10) {
			
			tempLine = new Undefined(mouseStart, mouseEnd, shifted);
			preview.addChild(tempLine.colorLayer);
			
		} else {
		
			switch (color) {
				case FLOOR :
					
					tempLine = new Floor(mouseStart, mouseEnd, shifted);
					preview.addChild(tempLine.colorLayer);
					preview.addChild(tempLine.rideLayer);
					
				case ACCEL :
					
					tempLine = new Accel(mouseStart, mouseEnd, shifted);
					preview.addChild(tempLine.colorLayer);
					preview.addChild(tempLine.rideLayer);
					
				case SCENE :
					
					tempLine = new Scenery(mouseStart, mouseEnd, shifted);
					preview.addChild(tempLine.colorLayer);
			}
		}
		tempLine.render();
	}
	
	function mouseUp(event:Event):Void 
	{
		switch (event.button) {
			case 0:
				leftIsDown = false;
				switch (tool) {
					case NONE :
					
					case PENCIL | LINE:
						
						if (mouseStart == null || mouseEnd == null) return;
						
						snap(mouseEnd);
						
						drawLine();
						
					case ERASER :
						
					default :
				}
			case 2:
				middleIsDown = false;
			default:
		}
		
		Main.canvas.preview.removeChildren();
	}
	
	public function snap(_pos:Point):Void 
	{
		if (color == LineColor.NONE || color == LineColor.SCENE) return;
		
		var lineDist:Null<Float> = null;
		var gridDist:Null<Float> = null;
		
		var lineSnap:Point = _pos.clone();
		var gridSnap:Point = _pos.clone();
		
		if (lineSnapping) {
			var radius:Float = snapDistance / Main.canvas.scaleX;
			var gridpos:GridObject = Grid.registryPosition(_pos.x, _pos.y);
			
			for (_x in -1...2) for (_y in -1...2) {
				
				var key:String = 'x${_x + gridpos.x}y${_y + gridpos.y}';
				if (Main.grid.registry[key] == null) continue;
				
				var chunk = Main.grid.registry[key];
				for (line in chunk.colliders) {
					
					if (line == null) continue;
					
					var distanceA:Float = Math.sqrt(Math.pow(lineSnap.x - line.start.x, 2) + Math.pow(lineSnap.y - line.start.y, 2));
					var distanceB:Float = Math.sqrt(Math.pow(lineSnap.x - line.end.x, 2) + Math.pow(lineSnap.y - line.end.y, 2));
					
					if (distanceA <= radius || (distanceB <= radius && distanceA < distanceB && distanceA <= radius)) {
						lineSnap.x = line.start.x;
						lineSnap.y = line.start.y;
						lineDist = distanceA;
					}
					if (distanceB <= radius || (distanceA <= radius && distanceB < distanceA && distanceB <= radius)) {
						lineSnap.x = line.end.x;
						lineSnap.y = line.end.y;
						lineDist = distanceB;
					}
				}
			}
		}
		
		
		if (gridSnapping) {
			
			var top:Float = Math.ceil(Main.canvas.mouseY / Main.viewGridSize) * Main.viewGridSize;
			var left:Float = Math.ceil(Main.canvas.mouseX / Main.viewGridSize) * Main.viewGridSize;
			var bottom:Float = Math.floor(Main.canvas.mouseY / Main.viewGridSize) * Main.viewGridSize;
			var right:Float = Math.floor(Main.canvas.mouseX / Main.viewGridSize) * Main.viewGridSize;
			
			var corners:Array<Point> = [
				new Point(left, top),
				new Point(right, top),
				new Point(left, bottom),
				new Point(right, bottom)
			];
			
			var distanceC:Null<Float> = null;
			
			for (corner in corners) {
				
				var distanceD:Float = Math.sqrt(Math.pow(gridSnap.x - corner.x, 2) + Math.pow(gridSnap.y - corner.y, 2));
				
				if (distanceD > gridSnapDistance) continue;
				
				if (distanceC == null || distanceD <= distanceC) {
					distanceC = distanceD;
					gridDist = distanceD;
					gridSnap.x = corner.x;
					gridSnap.y = corner.y;
				}
				
			}
		}
		
		if (lineDist == null && gridDist == null) {
			return;
		} else if (lineDist == null) {
			_pos.x = gridSnap.x;
			_pos.y = gridSnap.y;
		} else if (gridDist == null) {
			_pos.x = lineSnap.x;
			_pos.y = lineSnap.y;
		} else {
			if (lineDist <= gridDist) {
				_pos.x = lineSnap.x;
				_pos.y = lineSnap.y;
			}
			else {
				_pos.x = gridSnap.x;
				_pos.y = gridSnap.y;
			}
		}
	}
	
	function get_gridSnapDistance():Float 
	{
		return Main.viewGridSize / 2;
	}
	
	function drawLine():Void 
	{
		if (Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) +Math.pow(mouseEnd.y - mouseStart.y, 2)) * Main.canvas.scaleX < 10 && color != LineColor.SCENE) return;
		
		Main.canvas.addLine(color, mouseStart.x, mouseStart.y, mouseEnd.x, mouseEnd.y, shifted);
	}
	
	function keyInputDown(event:Event):Void 
	{
		switch (event.kind) {
			case EKeyDown :
				trace(event.keyCode);
				switch (event.keyCode) {
					case Key.QWERTY_BRACKET_RIGHT :
						if (shifted) {
							var zoom:Int = 2;
							while (true) {
								if (zoom <= Main.viewGridSize) {
									zoom = zoom << 1;
									if (zoom == 0) {
										Main.console.log('Max left bitshift reached', 0xFF0000);
										break;
									}
								} else {
									Main.viewGridSize = zoom;
									break;
								}
							}
						} else {
							Main.viewGridSize += 1;
						}
						Main.console.log('Ruler width set to: ${Main.viewGridSize}', 0x0066FF);
					case Key.QWERTY_BRACKET_LEFT :
						if (Main.viewGridSize == 1) return;
						if (shifted) {
							var zoom:Int = 2;
							while (true) {
								if (zoom >= Main.viewGridSize) {
									Main.viewGridSize = zoom >> 1;
									break;
								} else {
									zoom = zoom << 1;
								}
							}
						} else {
							Main.viewGridSize -= 1;
							Main.viewGridSize = Std.int(Math.max(Main.viewGridSize, 1));
						}
						Main.console.log('Ruler width set to: ${Main.viewGridSize}', 0x0066FF);
					case Key.Q:
						setToolPencil();
						Main.toolbar.externalUpdate(Icon.PENCIL);
					case Key.W:
						setToolPencil();
						Main.toolbar.externalUpdate(Icon.ERASER);
					case Key.E:
						setToolEraser();
						Main.toolbar.externalUpdate(Icon.ERASER);
					case Key.A :
						Main.simulation.backSim();
					case Key.D :
						Main.simulation.stepSim();
					case Key.S :
						Main.simulation.startSim();
					case Key.X :
						Main.simulation.endSim();
						Main.riders.resetPositions();
						
					case Key.F :
						Main.simulation.setFlagState();
						
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
						#if hl
						Main.audio.stopMusic();
						#end
						
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
						#if hl
						Main.audio.playMusic(Main.simulation.frames);
						#end
					case Key.LSHIFT :
						shifted = false;
				}
			default:
		}
	}
	
	public function setToolEraser():Void 
	{
		if (tool == ERASER) {
			colorEraser = !colorEraser;
			Main.console.log('Color eraser ' + (colorEraser == true ? 'on' : 'off'));
		}
		tool = ERASER;
		updateCursor();
		Main.console.log("Tool set to Eraser", 0x0000BB);
	}
	
	public function setToolPencil() {
		tool = PENCIL;
		updateCursor();
		Main.console.log("Tool set to Pencil", 0x0000BB);
	}
	
	public function setToolLine() {
		tool = LINE;
		updateCursor();
		Main.console.log("Tool set to Line", 0x0000BB);
	}
	
	function updateCursor():Void 
	{
		switch (tool) {
			case PENCIL :
				updatePencilCursor();
			case LINE :
				updateLineCursor();
			default :
				updateEraserCursor();
		}
	}
	
	function updateEraserCursor():Void 
	{
		if (!colorEraser) {
			Main.canvas_interaction.cursor = cursorEraser;
		} else {
			switch (color) {
				case FLOOR :
					Main.canvas_interaction.cursor = cursorEraserBlue;
				case ACCEL :
					Main.canvas_interaction.cursor = cursorEraserRed;
				case SCENE :
					Main.canvas_interaction.cursor = cursorEraserGreen;
				default :
					Main.canvas_interaction.cursor = Default;
			}
		}
	}
	
	function updateLineCursor():Void 
	{
		switch (color) {
			case FLOOR :
				Main.canvas_interaction.cursor = cursorLineBlue;
			case ACCEL :
				Main.canvas_interaction.cursor = cursorLineRed;
			case SCENE :
				Main.canvas_interaction.cursor = cursorLineGreen;
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