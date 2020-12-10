package;

import haxe.macro.Context;
import components.stage.Canvas;
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
	var canvas:Scene;
	
	var viewGridSize:Int = 64;
	
	var canvas_interaction:Interactive;
	
	var console:Console;
	
	public static var build:String;
	
	@:macro public static function getBuildDate() {
        var buildTime:String = "" + Date.now().getDate() + ":" + Date.now().getMonth() + ":" + Date.now().getFullYear();
		return buildTime;
    }
	
	static function main() 
	{
		build = getBuildDate();
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
		
		engine.backgroundColor = 0xFFCCCCCC;
		
		grid = new Graphics();
		s2d.addChild(grid);
		
		canvas = new Scene();
		s2d.addChild(canvas);
		sevents.addScene(canvas);
		
		canvas.x = engine.width / 2;
		canvas.y = engine.height / 2;
		
		canvas_interaction = new Interactive(engine.width, engine.height, s2d);
		canvas_interaction.cursor = Cursor.Default;
		canvas_interaction.enableRightButton = true;
		canvas_interaction.onPush = canvasClickDown;
		canvas_interaction.onRelease = canvasClickUp;
		canvas_interaction.onWheel = canvasWheelAction;
		canvas_interaction.onKeyDown = keyInputDown;
		
		console = new Console(DefaultFont.get(), s2d);
		setConsoleActions();
		console.log("Welcome to OpenLR: " + Main.build, 0x333333);
		console.log("Press / to toggle console...", 0x333333);
	}
	
	function setConsoleActions():Void 
	{
		var arg1:ConsoleArgDesc = {t: AFloat, opt: false, name : "x value"};
		var arg2:ConsoleArgDesc = {t: AFloat, opt: false, name : "y value"};
		console.addCommand("setPosition", "Sets the position of the canvas", [arg1, arg2], setCanvasPosition);
		console.addCommand("version", "show current build version", [], function() { console.log(Main.build, 0x0000BB); });
		var arg3:ConsoleArgDesc = {t: AInt, opt: true, name : "size"};
		console.addCommand("setGridSize", "Change editor grid size", [arg3], function(?_value:Int = 64) { viewGridSize = _value; console.log("Set grid size to: " + _value, 0x0000BB);});
	}
	
	function setCanvasPosition(_x:Float, _y:Float, ?_log:Bool = true) {
		canvas.setPosition(_x, _y);
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
	
	function canvasWheelAction(event:Event):Void 
	{
		var oldScale = canvas.scaleX;
		var oldMouseX = canvas.mouseX;
		var oldMouseY = canvas.mouseY;
		var delta = canvas.scaleX < 1 ? event.wheelDelta * 0.1 : event.wheelDelta;
		canvas.setScale(Math.min(Math.max(canvas.scaleX - delta, 0.01), 100));
		var newScale = canvas.scaleX;
		canvas.x += -(oldMouseX * (newScale - oldScale));
		canvas.y += -(oldMouseY * (newScale - oldScale));
	}
	
	var mousePosX:Float;
	var mousePosY:Float;

	function canvasClickDown(event:Event):Void 
	{
		mousePosX = s2d.mouseX;
		mousePosY = s2d.mouseY;
		
		switch (event.button) {
			case 2:
				canvas.startDrag(dragFunction);
			default:
				
		}
	}
	
	function dragFunction(parameter0:Event):Void 
	{
		
		canvas.x += s2d.mouseX - mousePosX;
		canvas.y += s2d.mouseY - mousePosY;
		
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
				if (x + x_offset - canvas.x > -viewGridSize && x + x_offset - canvas.x < viewGridSize) {
					x_originValue = x;
					continue;
				}
				grid.moveTo(x + x_offset, 0);
				grid.lineTo(x + x_offset, engine.height);
			}
		}
		for (y in 0...(engine.height * 10)) {
			grid.lineStyle(2, 0xBBBBBB);
			if (y % ratio == 0) {
				if (y + y_offset - canvas.y > -viewGridSize && y + y_offset - canvas.y < viewGridSize) {
					y_originValue = y; 
					continue;
				}
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