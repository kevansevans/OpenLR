package;

import components.managers.Grid;
import components.managers.Riders;
import components.managers.Simulation;
import components.sledder.Bosh;
import components.tool.ToolBehavior;
import enums.Commands;
import format.amf.Reader;
import h2d.col.Point;
import haxe.ds.Map;
import haxe.http.HttpBase;
import haxe.macro.Context;
import components.stage.Canvas;
import hl.UI;
import hxd.res.DefaultFont;
import h2d.Bitmap;
import components.stage.LRConsole;
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
import sys.io.FileInput;
import sys.io.File;
import format.amf.Value;


/**
 * ...
 * @author Kaelan
 */
class Main extends App
{
	var ruler:Graphics;
	
	public static var canvas:Canvas;
	
	public static var viewGridSize:Int = 14;
	
	public static var canvas_interaction:Interactive;
	
	public static var console:LRConsole;
	
	public static var toolControl:ToolBehavior;
	
	public static var build:String;
	
	public static var grid:Grid;
	
	public static var riders:Riders;
	
	public static var simulation:Simulation;
	
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
		
		s2d.defaultSmooth = true;
		
		ruler = new Graphics();
		s2d.addChild(ruler);
		
		canvas = new Canvas();
		s2d.addChild(canvas);
		sevents.addScene(canvas);
		
		canvas.x = engine.width / 2;
		canvas.y = engine.height / 2;
		
		canvas_interaction = new Interactive(engine.width, engine.height, s2d);
		canvas_interaction.cursor = Cursor.Default;
		
		toolControl = new ToolBehavior(s2d, canvas_interaction, canvas);
		
		console = new LRConsole(DefaultFont.get(), s2d);
		setConsoleActions();
		console.log("Welcome to OpenLR: " + Main.build, 0x333333);
		console.log("Press / to toggle console...", 0x333333);
		console.log("https://github.com/kevansevans/OpenLR", 0x333333);
		
		grid = new Grid();
		
		riders = new Riders();
		
		simulation = new Simulation();
	}
	
	//EVERYTHING is a console command if and when possible.
	function setConsoleActions():Void 
	{
		var arg1:ConsoleArgDesc = {t: AFloat, opt: false, name : "x value"};
		var arg2:ConsoleArgDesc = {t: AFloat, opt: false, name : "y value"};
		console.addCommand(Commands.setCanvasPosition, "Sets the position of the canvas", [arg1, arg2], setCanvasPosition);
		console.addCommand(Commands.version, "show current build version", [], function() { console.log(Main.build, 0x0000BB); });
		var arg3:ConsoleArgDesc = {t: AInt, opt: true, name : "size"};
		console.addCommand(Commands.setGridSize, "Change editor grid size", [arg3], function(?_value:Int = 64) { viewGridSize = _value; console.log("Set grid size to: " + _value, 0x0000BB);});
		console.addCommand(Commands.gridSizeInc, "Increase grid size by 1", [], function() { viewGridSize += 1;});
		console.addCommand(Commands.gridSizeDec, "Decrease grid size by 1", [], function() { viewGridSize -= 1; viewGridSize = Std.int(Math.max(viewGridSize, 1));});
		console.addCommand(Commands.setScale, "Change editor grid size", [arg3], function(?_value:Int = 2) { viewGridSize = _value; console.log("Set canvas scale to: " + _value, 0x0000BB);});
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
					console.log('${_tool} is not a recognized tool name', 0xFF0000);
			}
		});
		var arg11:ConsoleArgDesc = {t: AString, opt: true, name : "Line Color"};
		console.addCommand(Commands.setLineColor, "Change line color mode", [arg11], function(_color:String) {
			switch (_color.toUpperCase()) {
				case "FLOOR" | "NORMAL" | "BLUE" | "1" :
					toolControl.color = 0;
				case "ACC" | "ACCEL" | "ACCELERATE" | "SPEED" | "FAST" | "RED" | "2" :
					toolControl.color = 1;
				case "SCENE" | "SCENERY" | "GREEN" | "3" :
					toolControl.color = 2;
				case "ANY" | "NONE" | "0" :
					toolControl.color = -1;
				default:
					console.log('${_color} is not a recognized line type', 0xFF0000);
			}
		});
		var arg12:ConsoleArgDesc = {t: AFloat, opt: false, name : "x"};
		var arg13:ConsoleArgDesc = {t: AFloat, opt: false, name : "y"};
		console.addCommand(Commands.zoomIn, "Increase zoom by 1", [], function() {canvas.zoomCanvas(1); });
		console.addCommand(Commands.zoomOut, "Decrease zoom by 1", [], function() {canvas.zoomCanvas( -1); });
		console.addCommand(Commands.addCanvasPosition, "Add values to existing canvas position", [arg12, arg13], function(_x:Float, _y:Float) { canvas.addCanvasPosition(_x, _y); });
		var arg14:ConsoleArgDesc = {t: ABool, opt: false, name : "true/false"};
		console.addCommand(Commands.showGrid, "Toggle grid visibility", [arg14], function(_visible:Bool) { ruler.visible = _visible; });
		console.addCommand(Commands.trackInfo, "Print track info", [], function() {
			console.log("===");
			console.log("Lines " + grid.lineCount);
			console.log("Floor " + grid.floorCount);
			console.log("Accel " + grid.accelCount);
			console.log("Scene " + grid.sceneCount);
			console.log("===");
		});
		console.addCommand(Commands.playTrack, "Start simulation", [], function() {simulation.startSim(); });
		console.addCommand(Commands.stopTrack, "End simulation", [], function() {simulation.endSim(); });
		console.addCommand(Commands.stepSimBackward, "Step sim back by one frame", [], function() {simulation.backSim(); });
		console.addCommand(Commands.stepSimForward, "Step sim forward by one frame", [], function() {simulation.stepSim(); });
		console.addCommand(Commands.rewindSimulation, "Set simulation to rewind", [arg14], function(_rewinding:Bool) {simulation.rewinding = _rewinding; });
		var arg15:ConsoleArgDesc = {t: AString, opt: false, name : "Rider name"};
		var arg16:ConsoleArgDesc = {t: AFloat, opt: true, name : "x position"};
		var arg17:ConsoleArgDesc = {t: AFloat, opt: true, name : "y position"};
		console.addCommand(Commands.setRiderStart, "Set rider start position", [arg15, arg16, arg17], function(_name:String, _x:Float = 0.0, _y:Float = 0.0) {
			var rider = riders.riders[_name];
			if (rider == null) return;
			rider.startPos = new Point(_x, _y);
			rider.init();
		});
		console.addCommand(Commands.addNewRider, "Add new rider to sim", [arg15, arg16, arg17], function(_name:String, _x:Float = 0.0, _y:Float = 0.0) {
			var rider = riders.riders[_name];
			if (rider != null) return;
			else riders.riders[_name] = new Bosh(_x, _y, _name);
		});
		console.addCommand(Commands.listRiderInfo, "Print all riders and info into console", [], function() {
			console.log("===");
			for (rider in riders.riders) {
				console.log('${rider.name} ${rider.startPos.x} ${rider.startPos.y}');
			}
			console.log("===");
		});
	}
	
	var mousePosX:Float;
	var mousePosY:Float;
	
	
	
	//this function needs to be improved
	
	
	var riderPhysDelta:Float = 0.0;
	var playing:Bool = false;
	override function update(dt:Float):Void 
	{
		super.update(dt);
		
		updateGridLines();
		
		canvas.drawRiders();
		
		if (simulation.updating) {
			simulation.updateSim();
			return;
		}
		
		if (simulation.playing && !simulation.rewinding) {
			simulation.playSim(dt);
		} else if (simulation.rewinding) {
			simulation.rewindSim(dt);
		}
		
		canvas.drawRiders();
	}
	
	override function onResize():Void 
	{
		super.onResize();
		
		canvas_interaction.width = engine.width;
		canvas_interaction.height = engine.height;
	}
	
	//this function needs to be improved
	function updateGridLines() {
		
		var ratio = Math.round(viewGridSize * canvas.scaleX);
		
		var x_offset = canvas.x % ratio;
		var y_offset = canvas.y % ratio;
		
		var x_originValue:Null<Float> = null;
		var y_originValue:Null<Float> = null;
		
		ruler.clear();
		
		for (x in 0...(engine.width * 10)) {
			ruler.lineStyle(2, 0xBBBBBB);
			if (x % ratio == 0) {
				if (x + x_offset - canvas.x == 0) {
					x_originValue = x;
					continue;
				}
				if (ratio <= 3) continue;
				ruler.moveTo(x + x_offset, 0);
				ruler.lineTo(x + x_offset, engine.height);
			}
		}
		for (y in 0...(engine.height * 10)) {
			ruler.lineStyle(2, 0xBBBBBB);
			if (y % ratio == 0) {
				if (y + y_offset - canvas.y == 0) {
					y_originValue = y; 
					continue;
				}
				if (ratio <= 3) continue;
				ruler.moveTo(0, y + y_offset);
				ruler.lineTo(engine.width, y + y_offset);
			}
		}
		ruler.lineStyle(2, 0xFF, 0.25);
		if (x_originValue != null) {
			ruler.moveTo(x_originValue + x_offset, 0);
			ruler.lineTo(x_originValue + x_offset, engine.height);
		}
		if (y_originValue != null) {
			ruler.moveTo(0, y_originValue + y_offset);
			ruler.lineTo(engine.width, y_originValue + y_offset);
		}
	}
}