package components.tool;
import hxlr.engine.Cell;
import hxlr.enums.LineType;
import hxlr.lines.Undefined;
import hxlr.engine.Grid;
import hxlr.lines.Floor;
import hxlr.lines.Accel;
import hxlr.lines.Scenery;
import hxlr.lines.Slow;
import hxlr.lines.LineObject;
import hxlr.Constants;
import components.tool.ToolFunction;
import components.ui.Toolbar.Icon;
import hxd.BitmapData;
import h2d.col.Point;
import hxd.Cursor;
import hxd.Event;
import hxd.Key;
import hxd.Res;
import components.stage.Canvas.DrawMode;

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
	public var tool:ToolMode;
	public var color:Int;
	
	public var bitmapNoWay:BitmapData;
	public var cursorNoWay:Cursor;
	
	public var bitmapPencilBlue:BitmapData;
	public var bitmapPencilRed:BitmapData;
	public var bitmapPencilGreen:BitmapData;
	public var bitmapPencilPink:BitmapData;
	public var bitmapPencilBrown:BitmapData;
	public var cursorPencilBlue:Cursor;
	public var cursorPencilRed:Cursor;
	public var cursorPencilGreen:Cursor;
	public var cursorPencilPink:Cursor;
	public var cursorPencilBrown:Cursor;
	
	public var bitmapLineBlue:BitmapData;
	public var bitmapLineRed:BitmapData;
	public var bitmapLineGreen:BitmapData;
	public var bitmapLinePink:BitmapData;
	public var bitmapLineBrown:BitmapData;
	public var cursorLineBlue:Cursor;
	public var cursorLineRed:Cursor;
	public var cursorLineGreen:Cursor;
	public var cursorLinePink:Cursor;
	public var cursorLineBrown:Cursor;
	
	public var bitmapEraser:BitmapData;
	public var bitmapEraserBlue:BitmapData;
	public var bitmapEraserRed:BitmapData;
	public var bitmapEraserGreen:BitmapData;
	public var bitmapEraserPink:BitmapData;
	public var bitmapEraserBrown:BitmapData;
	public var cursorEraser:Cursor;
	public var cursorEraserBlue:Cursor;
	public var cursorEraserRed:Cursor;
	public var cursorEraserGreen:Cursor;
	public var cursorEraserPink:Cursor;
	public var cursorEraserBrown:Cursor;
	
	public var lineSnapMouseDown:Bool = true;
	public var lineSnapMouseMove:Bool = true;
	public var lineSnapStart:LineObject = null;
	public var lineSnapEnd:LineObject = null;
	public var lineSnapping:Bool = true;
	public var gridSnapping:Bool = false;
	public var angleSnapping:Bool = false;
	public var angleSnapValue:Float = 90;
	public var gridSnapDistance(get, null):Float;
	public var snapDistance:Float = 15;
	
	public var colorEraser:Bool = false;
	
	public function new() 
	{
		tool = PENCIL;
		color = 0;
		
		Main.input.enableRightButton = true;
		Main.input.onKeyDown = keyInputDown;
		Main.input.onKeyUp = keyInputDown;
		Main.input.onPush = mouseDown;
		Main.input.onRelease = mouseUp;
		Main.input.onMove = mouseMove;
		Main.input.onWheel = mouseWheel;
		Main.input.onOver = function(e:Event) {
			Main.input.focus();
		}
		
		bitmapPencilBlue = Res.tool.pencilBlue.toBitmap();
		cursorPencilBlue = Cursor.Custom(new CustomCursor([bitmapPencilBlue], 0, 1, 25));
		bitmapPencilRed = Res.tool.pencilRed.toBitmap();
		cursorPencilRed = Cursor.Custom(new CustomCursor([bitmapPencilRed], 0, 1, 25));
		bitmapPencilGreen = Res.tool.pencilGreen.toBitmap();
		cursorPencilGreen = Cursor.Custom(new CustomCursor([bitmapPencilGreen], 0, 1, 25));
		bitmapPencilBrown = Res.tool.pencilBrown.toBitmap();
		cursorPencilBrown = Cursor.Custom(new CustomCursor([bitmapPencilBrown], 0, 1, 25));
		
		bitmapLineBlue = Res.tool.lineBlue.toBitmap();
		cursorLineBlue = Cursor.Custom(new CustomCursor([bitmapLineBlue], 0, 13, 13));
		bitmapLineRed = Res.tool.lineRed.toBitmap();
		cursorLineRed = Cursor.Custom(new CustomCursor([bitmapLineRed], 0, 13, 13));
		bitmapLineGreen = Res.tool.lineGreen.toBitmap();
		cursorLineGreen = Cursor.Custom(new CustomCursor([bitmapLineGreen], 0, 13, 13));
		bitmapLineBrown = Res.tool.lineBrown.toBitmap();
		cursorLineBrown = Cursor.Custom(new CustomCursor([bitmapLineBrown], 0, 13, 13));
		
		bitmapEraser = Res.tool.eraser.toBitmap();
		cursorEraser = Cursor.Custom(new CustomCursor([bitmapEraser], 0, 5, 5));
		bitmapEraserBlue = Res.tool.eraserBlue.toBitmap();
		cursorEraserBlue = Cursor.Custom(new CustomCursor([bitmapEraserBlue], 0, 5, 5));
		bitmapEraserRed = Res.tool.eraserRed.toBitmap();
		cursorEraserRed = Cursor.Custom(new CustomCursor([bitmapEraserRed], 0, 5, 5));
		bitmapEraserGreen = Res.tool.eraserGreen.toBitmap();
		cursorEraserGreen = Cursor.Custom(new CustomCursor([bitmapEraserGreen], 0, 5, 5));
		bitmapEraserBrown = Res.tool.eraserBrown.toBitmap();
		cursorEraserBrown = Cursor.Custom(new CustomCursor([bitmapEraserBrown], 0, 5, 5));
		
		bitmapNoWay = Res.tool.noWay.toBitmap();
		cursorNoWay = Cursor.Custom(new CustomCursor([bitmapNoWay], 0, 10, 10));
		
		Main.input.cursor = cursorPencilBlue;
	}
	
	var mouseStart:Point;
	var mouseEnd:Point;
	
	var leftIsDown:Bool = false;
	var middleIsDown:Bool = false;
	var rightIsDown:Bool = false;
	
	public var shifted:Bool = false;
	
	function mouseDown(event:Event):Void 
	{
		
		if (Main.canvas.lineVisLock) {
			switch (Main.canvas.drawMode) {
				case FULL_EDIT | PLAYBACK :
				case NO_SCENERY_EDIT | NO_SCENERY_PLAYBACK :
					if (color == SCENE) return;
					else if (tool == ERASER && color == SCENE && colorEraser) return;
				case SCENERY_EDIT | SCENERY_PLAYBACK :
					if (color == FLOOR || color == ACCEL) return;
					else if (tool == ERASER && (color == FLOOR || color == ACCEL) && colorEraser) return;
				default :
			}
		}
		
		switch (event.button) {
			
			case 0:
				
				#if embeded_track
				return;
				#end
				
				leftIsDown = true;
				mouseStart = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
				mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
				
				switch (tool) {
					
					case ERASER :
						
						ToolFunction.erase(Main.canvas.mouseX, Main.canvas.mouseY);
						
					case PENCIL | LINE :
						
						if (lineSnapMouseDown) snap(mouseStart, true);
						
					default :
						
				}
			case 1 :
				
				#if embeded_track
				return;
				#end
				
				rightIsDown = true;
				mouseStart = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
				mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
				
				switch (tool) {
					
					case PENCIL | LINE :
						
						if (lineSnapMouseDown) snap(mouseStart, false);
						
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
		
		switch (tool) {
			
			case NONE :
				
			case PENCIL :
				
				#if embeded_track
				return;
				#end
				
				if (leftIsDown || rightIsDown) {
					
					mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
					
					if (angleSnapping) snapToAngle();
					
					var dist = Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) + Math.pow(mouseEnd.y - mouseStart.y, 2));
					
					var dist = Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) + Math.pow(mouseEnd.y - mouseStart.y, 2));
					if (dist > 10 * (1 / Main.canvas.scaleX) && dist < 1000 * (1 / Main.canvas.scaleX)) {
						drawLine();
						mouseStart = mouseEnd.clone();
						mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
					}
					
					updatePreview();
					
				}
				
			case LINE :
				
				#if embeded_track
				return;
				#end
				
				if (leftIsDown || rightIsDown) {
					
					mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
					
					if (angleSnapping) snapToAngle();
					
					if (lineSnapMouseMove) snap(mouseEnd, false);
					
					updatePreview();
					
				}
				
			case ERASER :
				
				#if embeded_track
				return;
				#end
				
				if (leftIsDown) {
					
					ToolFunction.erase(Main.canvas.mouseX, Main.canvas.mouseY);
					
				}
				
			default :	
		}
		
		if (middleIsDown) {
			
			mouseEnd = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
			
			var x:Float = -(mouseStart.x - mouseEnd.x) * Main.canvas.scaleX;
			var y:Float = -(mouseStart.y - mouseEnd.y) * Main.canvas.scaleX;
			
			Main.canvas.addCanvasPosition(x, y);
			mouseStart = new Point(Main.canvas.mouseX, Main.canvas.mouseY);
		}
	}
	
	public var tempLine:LineObject;
	
	function updatePreview() {
		
		if (!leftIsDown && !rightIsDown) {
			Main.canvas.previewLine.remove();
			return;
		}
		
		if (tool == ERASER) return;
		
		var preview = Main.canvas.preview;
		
		if (Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) + Math.pow(mouseEnd.y - mouseStart.y, 2)) * Main.canvas.scaleX < 10) {
			
			tempLine = new Undefined(mouseStart, mouseEnd);
			
		} else {
		
			switch (color) {
				case FLOOR :
					
					if (leftIsDown) {
						tempLine = new Floor(mouseStart, mouseEnd, shifted);
					} else if (rightIsDown) {
						tempLine = new Floor(mouseEnd, mouseStart, !shifted);
					}
					
				case ACCEL :
					
					if (leftIsDown) {
						tempLine = new Accel(mouseStart, mouseEnd, shifted);
					} else if (rightIsDown) {
						tempLine = new Accel(mouseEnd, mouseStart, !shifted);
					}
					
				case SCENE :
					
					tempLine = new Scenery(mouseStart, mouseEnd);
					
				case SLOW :
					
					tempLine = new Slow(mouseStart, mouseEnd);
			}
		}
		
		Main.canvas.drawPreviewLine(tempLine);
	}
	
	function mouseUp(event:Event):Void 
	{
		
		switch (event.button) {
			
			case 0 | 1:
				
				#if embeded_track
				return;
				#end
				
				switch (tool) {
					case NONE :
					
					case PENCIL | LINE:
						
						if (mouseStart == null || mouseEnd == null) return;
						
						if (tool == LINE) {
								snap(mouseEnd, false);
								drawLine();
						}
						
						if (tool == PENCIL)
						{
							var dist = Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) + Math.pow(mouseEnd.y - mouseStart.y, 2));
							if (dist > 10 * (1 / Main.canvas.scaleX) && dist < 1000 * (1 / Main.canvas.scaleX)) {
								drawLine();
							}
						}
						
						
					case ERASER :
						
					default :
				}
			case 2:
				middleIsDown = false;
			default:
		}
		
		leftIsDown = false;
		rightIsDown = false;
		
		Main.canvas.preview.removeChildren();
		updatePreview();
	}
	
	public function snap(_pos:Point, _start:Bool):Void 
	{
		if (color == LineType.NULL) return;
		
		var lineDist:Null<Float> = null;
		var gridDist:Null<Float> = null;
		
		var lineSnap:Point = _pos.clone();
		var gridSnap:Point = _pos.clone();
		
		if (lineSnapping) {
			var radius:Float = snapDistance / Main.canvas.scaleX;
			
			for (_x in -1...2) for (_y in -1...2) {
				
				var key:String = Cell.getInfo(_x + _pos.x , _y + _pos.y).key;
				if (Grid.registry[key] == null) continue;
				
				var chunk = Grid.registry[key];
				for (line in chunk.collidable) {
					
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
			
			var top:Float = Math.ceil(Main.canvas.mouseY / Main.ruler.rulerSize) * Main.ruler.rulerSize;
			var left:Float = Math.ceil(Main.canvas.mouseX / Main.ruler.rulerSize) * Main.ruler.rulerSize;
			var bottom:Float = Math.floor(Main.canvas.mouseY / Main.ruler.rulerSize) * Main.ruler.rulerSize;
			var right:Float = Math.floor(Main.canvas.mouseX / Main.ruler.rulerSize) * Main.ruler.rulerSize;
			
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
	
	function snapToAngle()
	{
		var values:Array<Float> = [];
		var steps:Float = 0;
		
		while (steps < 360)
		{
			values.push(steps);
			steps += angleSnapValue;
		}
		
		values.push(360);
		
		var maxAngle:Float = 0;
		var minAngle:Float = 0;
		var curAngle:Float = Math.atan2(mouseEnd.y - mouseStart.y, mouseEnd.x - mouseStart.x) * 180 / Math.PI;
		if (curAngle < 0) curAngle += 360;
		for (angle in values)
		{
			if (curAngle > angle)
			{
				minAngle = angle;
				continue;
			} else {
				maxAngle = angle;
				break;
			}
		}
		
		var snapToAngle = curAngle < minAngle + (angleSnapValue / 2) ? minAngle : maxAngle;
		snapToAngle *= (Math.PI / 180);
		var dist:Float = mouseStart.distance(mouseEnd);
		
		mouseEnd.x = dist * Math.cos(snapToAngle) + mouseStart.x;
		mouseEnd.y = dist * Math.sin(snapToAngle) + mouseStart.y;
	}
	
	function get_gridSnapDistance():Float 
	{
		return Main.ruler.rulerSize / 2;
	}
	
	function drawLine():Void 
	{
		if (Math.sqrt(Math.pow(mouseEnd.x - mouseStart.x, 2) +Math.pow(mouseEnd.y - mouseStart.y, 2)) * Main.canvas.scaleX < 10 && color != LineType.SCENE) return;
		
		var type:LineType = LineType.NULL;
		switch (color) {
			case 0:
				type = LineType.FLOOR;
			case 1:
				type = LineType.ACCEL;
			case 2:
				type = LineType.SCENE;
			case 4:
				type = LineType.SLOW;
		}
		
		if (leftIsDown) {
			var line = Grid.createLineObject(type, mouseStart.x, mouseStart.y, mouseEnd.x, mouseEnd.y, shifted);
			Grid.register(line);
			Main.canvas.addVisLine(line);
		} else if (rightIsDown) {
			var line = Grid.createLineObject(type, mouseEnd.x, mouseEnd.y, mouseStart.x, mouseStart.y, !shifted);
			Grid.register(line);
			Main.canvas.addVisLine(line);
		}
		
		Constants.CVAR.changes += 1;
	}
	
	var lastViewedPosition:Point;
	
	function keyInputDown(event:Event):Void 
	{
		switch (event.kind) {
			case EKeyDown :
				switch (event.keyCode) {
					case Key.QWERTY_BRACKET_RIGHT :
						
						#if embeded_track
						return;
						#end
						
						if (shifted) {
							var zoom:Int = 2;
							while (true) {
								if (zoom <= Main.ruler.rulerSize) {
									zoom = zoom << 1;
									if (zoom == 0) {
										break;
									}
								} else {
									Main.ruler.rulerSize = zoom;
									break;
								}
							}
						} else {
							Main.ruler.rulerSize += 1;
						}
					case Key.QWERTY_BRACKET_LEFT :
						
						#if embeded_track
						return;
						#end
						
						if (Main.ruler.rulerSize == 1) return;
						if (shifted) {
							var zoom:Int = 2;
							while (true) {
								if (zoom >= Main.ruler.rulerSize) {
									Main.ruler.rulerSize = zoom >> 1;
									break;
								} else {
									zoom = zoom << 1;
								}
							}
						} else {
							Main.ruler.rulerSize -= 1;
							Main.ruler.rulerSize = Std.int(Math.max(Main.ruler.rulerSize, 1));
						}
					case Key.Q:
						
						#if embeded_track
						return;
						#end
						
						Main.toolbar.pencil.onClick();
					case Key.W:
						
						#if embeded_track
						return;
						#end
						
						Main.toolbar.line.onClick();
					case Key.E:
						
						#if embeded_track
						return;
						#end
						
						Main.toolbar.eraser.onClick();
					case Key.A :
						Main.simulation.backSim();
					case Key.D :
						Main.simulation.stepSim();
					case Key.Y :
						Main.simulation.startSim();
						Main.timeline.updatePlaydeck();
					case Key.U :
						Main.simulation.endSim();
						Main.riders.resetPositions();
						Main.timeline.updatePlaydeck();
					case Key.F :
						Main.simulation.setFlagState();
						Main.timeline.updatePlaydeck();
					case Key.NUMBER_1 :
						
						#if embeded_track
						return;
						#end
						
						setColorMode(FLOOR);
					case Key.NUMBER_2 :
						
						#if embeded_track
						return;
						#end
						
						setColorMode(ACCEL);
					case Key.NUMBER_3 :
						
						#if embeded_track
						return;
						#end
						
						setColorMode(SCENE);
						
					case Key.NUMBER_5 :
						
						#if embeded_track
						return;
						#end
						
						setColorMode(SLOW);
						
					case Key.CTRL :
						Main.simulation.rewinding = true;
						#if hl
						//Main.audio.stopMusic();
						#end
						
					case Key.SPACE :
						
						if (shifted) {
							Main.simulation.endSim();
							Main.timeline.updatePlaydeck();
							return;
						}
						
						if (!Main.simulation.paused && Main.simulation.playing) Main.simulation.pauseSim();
						else if (Main.simulation.paused) Main.simulation.resumeSim();
						else if (!Main.simulation.playing && !Main.simulation.paused) Main.simulation.startSim();
						Main.timeline.updatePlaydeck();
					case Key.RSHIFT :
						Main.simulation.updateSim();
					#if js
					case 16 :
					#else
					case Key.LSHIFT :
					#end
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
						updateCursor();
				}
			case EKeyUp :
				switch (event.keyCode) {
					case Key.CTRL :
						Main.simulation.rewinding = false;
						#if hl
						//Main.audio.playMusic(Main.simulation.frames);
						#end
					#if js
					case 16 :
					#else
					case Key.LSHIFT :
					#end
						shifted = false;
						
					case Key.HOME :
						
						lastViewedPosition = new Point(Main.canvas.x, Main.canvas.y);
						
						if (Main.camera.riderFollow == null) {
							
							Main.canvas.x = Main.locengine.width / 2;
							Main.canvas.y = Main.locengine.height / 2;
							
						} else {
							
							var position = Main.canvas.localToGlobal(Main.riders.riders[Main.camera.riderFollow].startPos);
							
							Main.canvas.x = position.x + (Main.locengine.width / 2);
							Main.canvas.y = position.y + (Main.locengine.height / 2);
							
						}
					case Key.END :
						
						if (lastViewedPosition != null) {
							
							Main.canvas.x = lastViewedPosition.x;
							Main.canvas.y = lastViewedPosition.y;
							
						}
				}
			default:
		}
	}
	
	public function setColorMode(_color:LineType) 
	{
		color = _color;
		updateCursor();
	}
	
	public function setToolEraser():Void 
	{
		if (tool == ERASER) {
			colorEraser = !colorEraser;
		}
		tool = ERASER;
		updateCursor();
	}
	
	public function setToolPencil() {
		tool = PENCIL;
		updateCursor();
	}
	
	public function setToolLine() {
		tool = LINE;
		updateCursor();
	}
	
	public function updateCursor():Void 
	{
		switch (tool) {
			#if !embeded_track
			case PENCIL :
				updatePencilCursor();
			case LINE :
				updateLineCursor();
			case ERASER :
				updateEraserCursor();
			#end
			default :
				Main.input.cursor = Default;
		}
	}
	
	function updateEraserCursor():Void 
	{
		if (!colorEraser) {
			Main.input.cursor = cursorEraser;
		} else {
			if (Main.canvas.lineVisLock) {
				switch (Main.canvas.drawMode) {
					case FULL_EDIT | PLAYBACK :
					case NO_SCENERY_EDIT | NO_SCENERY_PLAYBACK :
						if (color == SCENE) {
							Main.input.cursor = cursorNoWay;
							return;
						}
					case SCENERY_EDIT | SCENERY_PLAYBACK :
						if (color == FLOOR || color == ACCEL)  {
							Main.input.cursor = cursorNoWay;
							return;
						}
					default :
				}
			}
			switch (color) {
				case FLOOR :
					Main.input.cursor = cursorEraserBlue;
				case ACCEL :
					Main.input.cursor = cursorEraserRed;
				case SCENE :
					Main.input.cursor = cursorEraserGreen;
				case SLOW :
					Main.input.cursor = cursorEraserBrown;
				default :
					Main.input.cursor = Default;
			}
		}
	}
	
	function updateLineCursor():Void 
	{
		if (Main.canvas.lineVisLock) {
			switch (Main.canvas.drawMode) {
				case FULL_EDIT | PLAYBACK :
				case NO_SCENERY_EDIT | NO_SCENERY_PLAYBACK :
					if (color == SCENE) {
						Main.input.cursor = cursorNoWay;
						return;
					}
				case SCENERY_EDIT | SCENERY_PLAYBACK :
					if (color == FLOOR || color == ACCEL)  {
						Main.input.cursor = cursorNoWay;
						return;
					}
				default :
			}
		}
		switch (color) {
			case FLOOR :
				Main.input.cursor = cursorLineBlue;
			case ACCEL :
				Main.input.cursor = cursorLineRed;
			case SCENE :
				Main.input.cursor = cursorLineGreen;
			case SLOW :
				Main.input.cursor = cursorLineBrown;
			default :
				Main.input.cursor = Default;
		}
	}
	
	function updatePencilCursor() {
		if (Main.canvas.lineVisLock) {
			switch (Main.canvas.drawMode) {
				case FULL_EDIT | PLAYBACK :
				case NO_SCENERY_EDIT | NO_SCENERY_PLAYBACK :
					if (color == SCENE) {
						Main.input.cursor = cursorNoWay;
						return;
					}
				case SCENERY_EDIT | SCENERY_PLAYBACK :
					if (color == FLOOR || color == ACCEL)  {
						Main.input.cursor = cursorNoWay;
						return;
					}
				default :
			}
		}
		switch (color) {
			case FLOOR :
				Main.input.cursor = cursorPencilBlue;
			case ACCEL :
				Main.input.cursor = cursorPencilRed;
			case SCENE :
				Main.input.cursor = cursorPencilGreen;
			case SLOW :
				Main.input.cursor = cursorPencilBrown;
			default :
				Main.input.cursor = Default;
		}
	}
}