package components.tool;
import components.lines.Undefined;
import components.managers.Grid;
import components.lines.Floor;
import components.lines.Accel;
import components.lines.Scenery;
import components.lines.LineBase;
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
	
	public var gridSnapDistance:Float = 0;
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
				
				switch (tool) {
					
					case ERASER :
						
						Main.canvas.erase();
						
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
					
					if (gridSnapDistance > 0) {
						
						var cornerX:Float = Math.round(Main.canvas.mouseX / Main.viewGridSize) * Main.viewGridSize;
						var cornerY:Float = Math.round(Main.canvas.mouseY / Main.viewGridSize) * Main.viewGridSize;
						var distance = Math.sqrt(Math.pow(cornerX - Main.canvas.mouseX, 2) + Math.pow(cornerY - Main.canvas.mouseY, 2));
						
						if (distance <= gridSnapDistance) {
							mouseEnd = new Point(cornerX, cornerY);
						}
					}	
					
					updatePreview();
					
				case ERASER :
					
					Main.canvas.erase();
					
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
					
					case PENCIL :
						
					case LINE :
						
						mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
						
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
		
		var radius:Float = snapDistance / Main.canvas.scaleX;
		var gridpos:GridObject = Grid.registryPosition(_pos.x, _pos.y);
		
		var lineDist:Null<Float> = null;
		var gridDist:Null<Float> = null;
		
		var lineSnap:Point = _pos.clone();
		var gridSnap:Point = _pos.clone();
		
		for (_x in -1...2) for (_y in -1...2) {
			
			var key:String = 'x${_x + gridpos.x}y${_y + gridpos.y}';
			if (Main.grid.registry[key] == null) continue;
			
			var chunk = Main.grid.registry[key];
			for (line in chunk.colliders) {
				
				var distanceA:Float = Math.sqrt(Math.pow(lineSnap.x - line.start.x, 2) + Math.pow(lineSnap.y - line.start.y, 2));
				var distanceB:Float = Math.sqrt(Math.pow(lineSnap.x - line.end.x, 2) + Math.pow(lineSnap.y - line.end.y, 2));
				
				if (distanceA <= radius || (distanceB <= radius && distanceA < distanceB && distanceA <= radius)) {
					_pos.x = line.start.x;
					_pos.y = line.start.y;
					lineDist = distanceA;
				}
				if (distanceB <= radius || (distanceA <= radius && distanceB < distanceA && distanceB <= radius)) {
					_pos.x = line.end.x;
					_pos.y = line.end.y;
					lineDist = distanceB;
				}
			}
		}
		
		if (gridSnapDistance > 0) {
			var cornerX:Float = Math.round(Main.canvas.mouseX / Main.viewGridSize) * Main.viewGridSize;
			var cornerY:Float = Math.round(Main.canvas.mouseY / Main.viewGridSize) * Main.viewGridSize;
			var distanceC = Math.sqrt(Math.pow(cornerX - Main.canvas.mouseX, 2) + Math.pow(cornerY - Main.canvas.mouseY, 2));
							
			if (distanceC <= gridSnapDistance) {
				gridSnap = new Point(cornerX, cornerY);
			}
		}
		
		if (lineDist == null && gridDist == null) {
			return;
		} else if (lineDist == null) {
			_pos = gridSnap.clone();
		} else if (gridDist == null) {
			_pos = lineSnap.clone();
		} else {
			if (lineDist <= gridDist) _pos = lineSnap.clone();
			else _pos = gridSnap.clone();
		}
	}
	
	function drawLine():Void 
	{
		if (Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) +Math.pow(mouseEnd.y - mouseStart.y, 2)) * Main.canvas.scaleX < 10) return;
		
		Main.canvas.addLine(color, mouseStart.x, mouseStart.y, mouseEnd.x, mouseEnd.y, shifted);
	}
	
	function keyInputDown(event:Event):Void 
	{
		switch (event.kind) {
			case EKeyDown :
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
						tool = PENCIL;
						updateCursor();
						Main.console.log("Tool set to Pencil", 0x0000BB);
					case Key.W:
						tool = LINE;
						updateCursor();
						Main.console.log("Tool set to Line", 0x0000BB);
					case Key.E:
						if (tool == ERASER) {
							colorEraser = !colorEraser;
							Main.console.log('Color eraser ' + (colorEraser == true ? 'on' : 'off'));
						}
						tool = ERASER;
						updateCursor();
						Main.console.log("Tool set to Eraser", 0x0000BB);
						
					case Key.A :
						Main.simulation.backSim();
					case Key.D :
						Main.simulation.stepSim();
					case Key.S :
						Main.simulation.startSim();
					case Key.X :
						Main.simulation.endSim();
						Main.riders.resetPositions();
						
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