package;

import components.tool.ToolBehavior;
import enums.Commands;
import h2d.col.Point;
import haxe.http.HttpBase;
import haxe.macro.Context;
import components.stage.Canvas;
import hl.UI;
import hxd.res.DefaultFont;
import h2d.Bitmap;
import h2d.Console;
import h2d.Graphics;
import h2d.Interactive;
import h2d.Tile;
import hxd.App;
import hxd.Cursor;
import hxd.Event;
import hxd.Key;
import hxd.Window;
import h2d.Scene;


/**
 * ...
 * @author Kaelan
 */
class Main extends App
{
	var grid:Graphics;
	var canvas:Canvas;
	
	var viewGridSize:Int = 64;
	
	var canvas_interaction:Interactive;
	
	public static var console:Console;
	
	var toolControl:ToolBehavior;
	
	public static var build:String;
	
	@:macro public static function getBuildDate() {
		var months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUN", "AUG", "SEP", "OCT", "NOV", "DEC"];
		var month:Int = Date.now().getMonth();
		var monthstr:String = months[month] != null ? months[month] : "Lousy Smarch Weather";
		return Date.now().getDate() + monthstr + Date.now().getFullYear();
    }
	
	static function main() 
	{
		build = "" + getBuildDate();
		#if debug
		build = "Debug:" + build;
		#else
		build = "Release:" + build;
		#end
		new Main();
	}
	
	public function new() {
		
		super();
		
	}
	
	override function init():Void 
	{
		super.init();
		
		Window.getInstance().title = "OpenLR - " + Main.build;
		
		engine.backgroundColor = 0xFFCCCCCC;
		
		grid = new Graphics();
		s2d.addChild(grid);
		
		canvas = new Canvas();
		s2d.addChild(canvas);
		sevents.addScene(canvas);
		
		canvas.x = engine.width / 2;
		canvas.y = engine.height / 2;
		
		canvas_interaction = new Interactive(engine.width, engine.height, s2d);
		canvas_interaction.cursor = Cursor.Default;
		
		toolControl = new ToolBehavior(s2d, canvas_interaction, canvas);
		
		console = new Console(DefaultFont.get(), s2d);
		setConsoleActions();
		console.log("Welcome to OpenLR: " + Main.build, 0x333333);
		console.log("Press / to toggle console...", 0x333333);
		console.log("https://github.com/kevansevans/OpenLR", 0x333333);
	}
	
	function setConsoleActions():Void 
	{
		var arg1:ConsoleArgDesc = {t: AFloat, opt: false, name : "x value"};
		var arg2:ConsoleArgDesc = {t: AFloat, opt: false, name : "y value"};
		console.addCommand("setPosition", "Sets the position of the canvas", [arg1, arg2], setCanvasPosition);
		console.addCommand("version", "show current build version", [], function() { console.log(Main.build, 0x0000BB); });
		var arg3:ConsoleArgDesc = {t: AInt, opt: true, name : "size"};
		console.addCommand("setGridSize", "Change editor grid size", [arg3], function(?_value:Int = 64) { viewGridSize = _value; console.log("Set grid size to: " + _value, 0x0000BB);});
		console.addCommand(Commands.gridSizeInc, "Increase grid size by 1", [], function() { viewGridSize += 1;});
		console.addCommand(Commands.gridSizeDec, "Decrease grid size by 1", [], function() { viewGridSize -= 1; viewGridSize = Std.int(Math.max(viewGridSize, 1));});
		console.addCommand("setScale", "Change editor grid size", [arg3], function(?_value:Int = 2) { viewGridSize = _value; console.log("Set canvas scale to: " + _value, 0x0000BB);});
		var arg5:ConsoleArgDesc = {t: AInt, opt: false, name : "type"};
		var arg6:ConsoleArgDesc = {t: AFloat, opt: false, name : "x1"};
		var arg7:ConsoleArgDesc = {t: AFloat, opt: false, name : "y1"};
		var arg8:ConsoleArgDesc = {t: AFloat, opt: false, name : "x2"};
		var arg9:ConsoleArgDesc = {t: AFloat, opt: false, name : "y2"};
		console.addCommand(Commands.drawLine, "add line to track", [arg5, arg6, arg7, arg8, arg9], canvas.addLine);
		var arg10:ConsoleArgDesc = {t: AString, opt: false, name : "Tool"};
		console.addCommand(Commands.setTool, "Change current active tool", [arg10], function(_tool:String, _color:String) {
			switch (_tool.toUpperCase()) {
				case "NONE":
					toolControl.tool = ToolMode.NONE;
				case "PENCIL":
					toolControl.tool = ToolMode.PENCIL;
				case "LINE":
					toolControl.tool = ToolMode.LINE;
				case "ERASER":
					toolControl.tool = ToolMode.ERASER;
				default :
					console.log('${_tool} is not a recognized tool name');
			}
		});
		var arg11:ConsoleArgDesc = {t: AString, opt: true, name : "Line Color"};
		
		var arg12:ConsoleArgDesc = {t: AFloat, opt: false, name : "x"};
		var arg13:ConsoleArgDesc = {t: AFloat, opt: false, name : "y"};
		console.addCommand(Commands.zoomIn, "Increase zoom by 1", [], function() {zoomCanvas(1); });
		console.addCommand(Commands.zoomOut, "Decrease zoom by 1", [], function() {zoomCanvas( -1); });
		console.addCommand(Commands.addCanvasPosition, "Add values to existing canvas position", [arg12, arg13], function(_x:Float, _y:Float) {
			canvas.x += _x;
			canvas.y += _y;
		});
	}
	
	function setCanvasPosition(_x:Float, _y:Float, ?_log:Bool = true) {
		canvas.setPosition(_x + engine.width / 2, _y + engine.height / 2);
		if (_log) console.log("Set canvas position to: " + _x + " " + _y, 0x0000BB);
	}
	
	function keyInputDown(event:Event):Void 
	{
		switch (event.kind) {
			case EKeyDown :
				switch (event.keyCode) {
					case Key.QWERTY_EQUALS :
						viewGridSize += 1;
						console.log("Grid set to size: " + viewGridSize, 0x0000BB);
					case Key.QWERTY_MINUS :
						viewGridSize -= 1;
						viewGridSize = Std.int(Math.max(viewGridSize, 1));
						console.log("Grid set to size: " + viewGridSize, 0x0000BB);
				}
			default:
		}
	}
	
	function zoomCanvas(wheelDelta:Int):Void 
	{
		var oldScale = canvas.scaleX;
		var oldMouseX = canvas.mouseX;
		var oldMouseY = canvas.mouseY;
		var delta = canvas.scaleX < 1 ? wheelDelta * 0.01 : wheelDelta * 0.25;
		canvas.setScale(Math.min(Math.max(canvas.scaleX - delta, 0.01), 100));
		var newScale = canvas.scaleX;
		canvas.x += -(oldMouseX * (newScale - oldScale));
		canvas.y += -(oldMouseY * (newScale - oldScale));
	}
	
	var mousePosX:Float;
	var mousePosY:Float;
	
	var lineStart:Point;
	var lineEnd:Point;

	function canvasClickDown(event:Event):Void 
	{
		mousePosX = s2d.mouseX;
		mousePosY = s2d.mouseY;
	}
	
	function canvasClickUp(event:Event):Void 
	{
		switch (event.button) {
			case 2:
				canvas.stopDrag();
			default:
				
		}
	}
	
	override function update(dt:Float):Void 
	{
		super.update(dt);
		
		updateGridLines();
	}
	
	override function onResize():Void 
	{
		super.onResize();
		
		canvas_interaction.width = engine.width;
		canvas_interaction.height = engine.height;
	}
	
	function updateGridLines() {
		
		var ratio = Math.round(viewGridSize * canvas.scaleX);
		
		var x_offset = canvas.x % ratio;
		var y_offset = canvas.y % ratio;
		
		var x_originValue:Null<Float> = null;
		var y_originValue:Null<Float> = null;
		
		grid.clear();
		
		for (x in 0...(engine.width * 10)) {
			grid.lineStyle(2, 0xBBBBBB);
			if (x % ratio == 0) {
				if (x + x_offset - canvas.x == 0) {
					x_originValue = x;
					continue;
				}
				if (ratio <= 3) continue;
				grid.moveTo(x + x_offset, 0);
				grid.lineTo(x + x_offset, engine.height);
			}
		}
		for (y in 0...(engine.height * 10)) {
			grid.lineStyle(2, 0xBBBBBB);
			if (y % ratio == 0) {
				if (y + y_offset - canvas.y == 0) {
					y_originValue = y; 
					continue;
				}
				if (ratio <= 3) continue;
				grid.moveTo(0, y + y_offset);
				grid.lineTo(engine.width, y + y_offset);
			}
		}
		grid.lineStyle(2, 0xBB0000);
		if (x_originValue != null) {
			grid.moveTo(x_originValue + x_offset, 0);
			grid.lineTo(x_originValue + x_offset, engine.height);
		}
		if (y_originValue != null) {
			grid.moveTo(0, y_originValue + y_offset);
			grid.lineTo(engine.width, y_originValue + y_offset);
		}
	}
}