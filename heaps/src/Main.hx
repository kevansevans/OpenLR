package;

import components.Assets;
import components.stage.Ruler;
import components.stage.TimeLine;
import h2d.Scene;
import haxe.Json;
import hxd.res.Resource;
import hxlr.Constants;
import hxlr.enums.LineType;
import hxlr.rider.RiderStruct;
import hxlr.engine.Grid;

import components.stage.Camera;
import components.managers.Musicplayer;
import components.managers.Riders;
import components.managers.Simulation;
import components.stage.TextInfo;
import components.tool.ToolBehavior;
import components.ui.Toolbar;
import components.ui.menu.MenuBase;
import enums.Commands;
import file.SaveLoad;
import h2d.Mask;
import h2d.col.Point;
import components.stage.Canvas;
import h3d.Engine;
import haxe.io.Bytes;
import hxd.res.DefaultFont;
import hxd.File;
import components.stage.LRConsole;
import h2d.Console;
import h2d.Graphics;
import h2d.Interactive;
import hxd.App;
import hxd.Res;
import utils.TableRNG;
import hxd.System;

import haxe.Json;

#if hl
import hl.UI;
#end

/**
 * ...
 * @author Kaelan
 * ...
 * 
 * Hi, thanks for viewing my source.
 * I'm not particularily concerned with making a build "for the community", I realized I had more fun worrying about what I wanted and building the engine to my needs.
 * This isn't to say I'm refusing to take feedback, obviously I'm interested if someone else besides me can see this comment.
 * 
 * I'm just not going to be focused on making this anything other than a personal engine. So please taper your expectations.
 * If you find use out of it, that's great, if not, well... you know where to find tools that you like better :P
 * 
 * This build is heavily focused on being minimalistic. If it's not an action that can be assigned a hotkey that feels comfortable,
 * it's very likely a console command. You can open src/enums/Commands.hx for a full list. Also most key actions will also have a console command.
 * 
 * -Kevy
 */
class Main extends App
{
	public static var locengine:Engine;
	public static var rootScene:Scene;
	public static var rulerScene:Scene;
	public static var tl(get, null):h2d.col.Point;
	public static var br(get, null):h2d.col.Point;
	
	public static var canvas:Canvas;
	
	public static var viewGridSize:Int = 14;
	
	public static var canvas_interaction:Interactive;
	
	public static var console:LRConsole;
	public var consoleMask:Mask;
	
	public static var toolControl:ToolBehavior;
	public static var toolbar:Toolbar;
	public static var timeline:TimeLine;
	
	public static var build:String;
	
	public static var grid:Grid;
	
	public static var riders:Riders;
	
	public static var simulation:Simulation;
	
	public static var saveload:SaveLoad;
	
	public static var trackName:Null<String> = null;
	public static var authorName:Null<String> = null;
	public static var songName:Null<String> = null;
	
	public static var textinfo:TextInfo;
	
	public static var audio:Musicplayer;
	
	public static var rng:TableRNG;
	
	public static var camera:Camera;
	
	public static var menu:MenuBase;
	
	public var ruler:Ruler;
	
	var mask:Mask;
	
	static function main() 
	{
		#if debug
		build = "Debug";
		#else
		build = "Release";
		#end
		
		new Main();
	}
	
	public function new() {
		
		super();
		
		rng = new TableRNG();
		rng.shuffle(Date.now().getMonth() + 1);
		rng.shuffle(Date.now().getMinutes() + 1);
		rng.shuffle(Date.now().getSeconds() + 1);
		
		#if (hl && !debug)
		UI.closeConsole();
		#end
	}
	
	override function init():Void 
	{
		super.init();
		
		Main.locengine = engine;
		Main.rootScene = s2d;
		
		Res.initEmbed();
		
		new Assets();
		
		engine.backgroundColor = 0xFFCCCCCC;
		
		s2d.defaultSmooth = true;
		
		rulerScene = new Scene();
		ruler = new Ruler(rulerScene);
		
		mask = new h2d.Mask(engine.width, engine.height, s2d);
		canvas = new Canvas(mask);
		
		canvas.x = engine.width / 2;
		canvas.y = engine.height / 2;
		
		canvas_interaction = new Interactive(engine.width, engine.height, s2d);
		
		menu = new MenuBase(s2d);
		
		toolControl = new ToolBehavior();
		
		grid = new Grid();
		
		riders = new Riders();
		
		simulation = new Simulation();
		
		saveload = new SaveLoad();
		saveload.loadUserInfo();
		
		//must load these last!
		
		textinfo = new TextInfo();
		s2d.addChild(textinfo.info);
		textinfo.update();
		textinfo.info.x = engine.width - textinfo.info.textWidth - 5;
		textinfo.info.y = 5;
		
		#if embeded_track
		toolbar = new Toolbar();
		#else
		toolbar = new Toolbar(s2d);
		#end
		timeline = new TimeLine(s2d);
		toolbar.x = (engine.width / 2) - (toolbar.width / 2);
		toolbar.y = 3;
		
		camera = new Camera();
		camera.riderFollow = "Bosh";
		
		#if !embeded_track
		
		hxd.Window.getInstance().title = "OpenLR - " + Main.build;
		
		#else
		
		var trackString = Res.track.embed.entry.getText();
		var saveObject:Dynamic = Json.parse(trackString);
		saveload.loadJSONObject(saveObject);
		
		console.runCommand("enableCamera true Bosh");
		console.runCommand("setCanvasPosition " + '${riders.riders["Bosh"].startPos.x} ${riders.riders["Bosh"].startPos.y}');
		
		hxd.Window.getInstance().title = "OpenLR - " + Main.trackName;
		
		canvas.drawMode = DrawMode.PLAYBACK;
		#end
		
		console = new LRConsole(DefaultFont.get(), s2d);
		setConsoleActions();
		console.log("Welcome to OpenLR: " + Main.build, 0x333333);
		console.log("Press / to toggle console...", 0x333333);
		console.log("https://github.com/kevansevans/OpenLR", 0x333333);
		console.log("Press S to play, Space to toggle pause.", 0x333333);
		console.log("Press X to stop.", 0x333333);
		console.log("Press 123 and QWE to cycle tools.", 0x333333);
		
		onResize();
	}
	
	//EVERYTHING is a console command if and when possible.
	//You can gleam the order I added everything through this function, haha
	function setConsoleActions():Void 
	{
		console.addCommand(Commands.github, "Link to github page", [], function() {System.openURL('https://github.com/kevansevans/OpenLR'); } );
		var arg1:ConsoleArgDesc = {t: AFloat, opt: false, name : "x value"};
		var arg2:ConsoleArgDesc = {t: AFloat, opt: false, name : "y value"};
		console.addCommand(Commands.setCanvasPosition, "Sets the position of the canvas", [arg1, arg2], function(_x:Float, _y:Float){
			canvas.addCanvasPosition(_x, _y);
		});
		console.addCommand(Commands.version, "show current build version", [], function() { console.log(Main.build, 0x0000BB); });
		var arg3:ConsoleArgDesc = {t: AInt, opt: true, name : "size"};
		console.addCommand(Commands.setGridSize, "Change editor grid size", [arg3], function(?_value:Int = 64) { viewGridSize = _value; console.log("Set grid size to: " + _value, 0x0000BB);});
		console.addCommand(Commands.gridSizeInc, "Increase grid size by 1", [], function() { viewGridSize += 1;});
		console.addCommand(Commands.gridSizeDec, "Decrease grid size by 1", [], function() { viewGridSize -= 1; viewGridSize = Std.int(Math.max(viewGridSize, 1));});
		console.addCommand(Commands.setScale, "Change editor grid size", [arg3], function(?_value:Int = 2) { viewGridSize = _value; console.log("Set canvas scale to: " + _value, 0x0000BB);});
		var arg5:ConsoleArgDesc = {t: AInt, opt: true, name : "type"};
		var arg6:ConsoleArgDesc = {t: AFloat, opt: true, name : "x1"};
		var arg7:ConsoleArgDesc = {t: AFloat, opt: true, name : "y1"};
		var arg8:ConsoleArgDesc = {t: AFloat, opt: true, name : "x2"};
		var arg9:ConsoleArgDesc = {t: AFloat, opt: true, name : "y2"};
		var arg21:ConsoleArgDesc = {t: ABool, opt: true, name : "inverted"};
		var arg22:ConsoleArgDesc = {t: AInt, opt: true, name : "limit mode"};
		console.addCommand(Commands.drawLine, "add line to track", [arg5, arg6, arg7, arg8, arg9, arg21, arg22], function(?_type:Int, ?_x1:Float, ?_y1:Float, ?_x2:Float, ?_y2:Float, ?_invert:Bool, ?_lim:Int) {
			var type:LineType = LineType.NULL;
			if (_type == null) {
				switch (toolControl.color) {
					case 0:
						type = LineType.FLOOR;
					case 1:
						type = LineType.ACCEL;
					case 2:
						type = LineType.SCENE;
				}
			} else {
				switch (_type) {
					case 0:
						type = LineType.FLOOR;
					case 1:
						type = LineType.ACCEL;
					case 2:
						type = LineType.SCENE;
				}
			}
			var x1 = _x1 == null ? canvas.mouseX : _x1;
			var y1 = _y1 == null ? canvas.mouseY : _y1;
			var x2 = _x2 == null ? x1 + 10 : _x2;
			var y2 = _y2 == null ? y1 : _y2;
			var shifted:Bool = _invert == null ? false : _invert;
			var lim = _lim == null ? -1 : _lim;
			canvas.addLine(type, x1, y1, x2, y2, shifted, lim);
		});
		var arg29:ConsoleArgDesc = {t: AInt, opt: false, name : "Line Index"};
		console.addCommand(Commands.removeLine, "remove specified line", [arg29], function(?_index:Int) {
			if (_index != null) {
				Grid.unregister(Grid.lines[_index]);
			}
		});
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
		console.addCommand(Commands.zoomIn, "Increase zoom by 1", [], function() {canvas.zoomCanvas(-1); });
		console.addCommand(Commands.zoomOut, "Decrease zoom by 1", [], function() {canvas.zoomCanvas(1); });
		console.addCommand(Commands.addCanvasPosition, "Add values to existing canvas position", [arg12, arg13], function(_x:Float, _y:Float) { canvas.addCanvasPosition(_x, _y); });
		var arg14:ConsoleArgDesc = {t: ABool, opt: false, name : "true/false"};
		console.addCommand(Commands.showGrid, "Toggle grid visibility", [arg14], function(_visible:Bool) { ruler.visible = _visible; });
		console.addCommand(Commands.trackInfo, "Print track info", [], function() {
			console.log("===");
			console.log("Lines " + Grid.lineCount);
			console.log("Floor " + Grid.subTypeCount[LineType.FLOOR]);
			console.log("Accel " + Grid.subTypeCount[LineType.ACCEL]);
			console.log("Scene " + Grid.subTypeCount[LineType.SCENE]);
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
			rider.startPos = new h2d.col.Point(_x, _y);
			rider.init();
		});
		var arg27:ConsoleArgDesc = {t: AInt, opt: true, name : "Enable frame"};
		var arg28:ConsoleArgDesc = {t: AInt, opt: true, name : "End frame"};
		console.addCommand(Commands.addNewRider, "Add new rider to sim", [arg15, arg16, arg17, arg27, arg28], function(_name:String, ?_x:Float, ?_y:Float, ?_en:Null<Int>, ?_ds:Null<Int>) {
			var x = _x == null ? canvas.mouseX : _x;
			var y = _y == null ? canvas.mouseY : _y;
			var startFrame = _en == null ? (simulation.frames - 1) : _en;
			riders.addNewRider(_name, new h2d.col.Point(x, y), startFrame, _ds);
		});
		console.addCommand(Commands.listRiderInfo, "Print all riders and info into console", [], function() {
			console.log("===");
			for (rider in riders.riders) {
				console.log('${rider.name} ${rider.startPos.x} ${rider.startPos.y}');
			}
			console.log("===");
		});
		console.addCommand(Commands.setRiderEnable, "Change specified rider's start frame", [arg15, arg27], function(_name:String, ?_frame:Null<Int>) {
			if (riders.riders[_name] == null) {
				console.log('Rider ${_name} does not exist...', 0xFF0000);
				return;
			}
			var frame:Null<Int> = _frame == null ? simulation.frames : (_frame == 0 ? null : _frame);
			if (frame != null && riders.riders[_name].disableFrame != null) {
				if (_frame >= riders.riders[_name].disableFrame) {
					console.log('Enable frame can not be greater than or equal to it\'s disabled frame, ${_frame} >= ${riders.riders[_name].disableFrame} is not valid!', 0xFF0000);
					return;
				}
			}
			riders.riders[_name].enabledFrame = _frame;
		});
		console.addCommand(Commands.setRiderDisable, "Change specified rider's stop frame", [arg15, arg28], function(_name:String, ?_frame:Null<Int>) {
			if (riders.riders[_name] == null) {
				console.log('Rider ${_name} does not exist...', 0xFF0000);
				return;
			}
			var frame:Null<Int> = _frame == null ? simulation.frames : (_frame == -1 ? null : _frame);
			if (frame != null && riders.riders[_name].enabledFrame != null) {
				if (_frame <= riders.riders[_name].enabledFrame) {
					console.log('Disable frame can not be less than or equal to it\'s enabled frame, ${_frame} <= ${riders.riders[_name].enabledFrame} is not valid!', 0xFF0000);
					return;
				}
			}
			riders.riders[_name].disableFrame = _frame;
		});
		console.addCommand(Commands.removeRider, "Remove specified rider", [arg15], function(_name:String) {
			riders.removeRider(_name);
		});
		var arg18:ConsoleArgDesc = {t: AString, opt: false, name : "Track name"};
		var arg19:ConsoleArgDesc = {t: AInt, opt: true, name : "previous version offset"};
		var arg20:ConsoleArgDesc = {t: AString, opt: true, name : "Track name"};
		console.addCommand(Commands.setTrackName, "Set track name", [arg18], function(_name:String) {
			trackName = _name; 
			console.log('Track name set to ${trackName}');
		});
		console.addCommand(Commands.saveTrack, "Save current active track data", [arg20], function(?_name:String) {
			if (_name == null && trackName == null) {
				console.log('Trackname undefined, please use the command /setTrackName or provide name as argument when using /saveTrack', 0xFF0000);
				return;
			} else if (_name == null && trackName != null) {
				saveload.saveTrack(trackName);
				console.log('Saved current track as ${trackName}');
			} else {
				saveload.saveTrack(_name);
				trackName = _name;
				console.log('Saved new track as ${trackName}');
			}
			
		});
		console.addCommand(Commands.loadTrack, "Load track with specified name", [arg18, arg19], function(_name:String, ?_offset:Int = 0) {
			if (trackName != null) console.runCommand("saveTrack");
			Grid.deleteTrack();
			riders.deleteAllRiders();
			saveload.loadTrack(_name, _offset); 
		});
		console.addCommand(Commands.listSavedTracks, "Print any found tracks", [], function() {saveload.listTrackFiles(); });
		var arg23:ConsoleArgDesc = {t: ABool, opt: false, name : "True/False"};
		console.addCommand(Commands.snapToGrid, "Toggle grid snapping", [arg23], function(_toggle:Bool) {
			toolControl.gridSnapping = _toggle;
			console.log(_toggle == true ? 'Grid snapping on!' : 'Grid snapping off!');
		});
		console.addCommand(Commands.snapToLines, "Toggle line snapping", [arg23], function(_toggle:Bool) {
			toolControl.lineSnapping = _toggle;
			console.log(_toggle == true ? 'Line snapping on!' : 'Line snapping off!');
		});
		console.addCommand(Commands.newTrack, "New track. Will save if track name has been set", [], function() {
			if (trackName != null) console.runCommand("saveTrack");
			Grid.deleteTrack();
			riders.deleteAllRiders();
			riders.addNewRider("Bosh", new h2d.col.Point(0, 0));
			trackName = null;
		} );
		var arg24:ConsoleArgDesc = {t: AString, opt: false, name : "Rider name"};
		var arg25:ConsoleArgDesc = {t: AString, opt: false, name : "New name"};
		console.addCommand(Commands.renameRider, "Rename and existing rider", [arg24, arg25], function(_old:String, _new:String){
			riders.renameRider(_old, _new);
		});
		console.addCommand(Commands.importJSONSave, "Load valid JSON tracks", [arg20], function(_name:String) {
			
			if (trackName != null) console.runCommand("saveTrack");
			
			Grid.deleteTrack();
			riders.deleteAllRiders();
			saveload.loadJSON(_name);
		});
		var arg26:ConsoleArgDesc = {t: AString, opt: false, name : "message"};
		console.addCommand(Commands.say, "Relay a message to console", [arg26], function(_msg:String) {
			console.log(_msg);
		});
		var arg30:ConsoleArgDesc = {t: AString, opt: false, name : "Author name"};
		console.addCommand(Commands.setAuthorName, "Set author name", [arg30], function(_name:String) {
			authorName = _name;
			if (authorName.length > 30) {
				authorName = authorName.substr(0, 30);
			}
			saveload.saveUserInfo();
			console.log('Author name set to ${authorName}');
		});
		/*#if hl
		var argMusic:ConsoleArgDesc = {t: AString, opt: false, name : "Song name"};
		var argOffset:ConsoleArgDesc = {t: AFloat, opt: true, name : "Offset"};
		console.addCommand(Commands.loadAudio, "Import a .ogg file to play with track", [argMusic, argOffset], function(_name:String, _offset:Float = 0.0) {
			audio.loadAudio(_name);
			if (_offset < 0) {
				console.log("Offset needs to be zero or greater, ${_offset} is not valid...", 0xFF0000);
				return;
			}
			audio.offset = _offset;
		});
		#elseif js*/
		
		//this does nothing on JS end of things, need to investigate
		var argOffset:ConsoleArgDesc = {t: AFloat, opt: true, name : "Offset"};
		console.addCommand(Commands.loadAudio, "Import a .ogg file to play with track", [argOffset], function(_offset:Float = 0.0) {
			File.browse( function(_file:BrowseSelect) {
				_file.load(
					function(_bytes:Bytes) {
						audio.loadAudioAsBytes(_bytes, _file.fileName);
					}
				);
			},
				{
					title : "Import .ogg file",
					fileTypes : [{
						name : "Vorbis",
						extensions : ['ogg']
					}]
				}
			);
		});
		//#end
		console.addCommand(Commands.setAudioOffset, "Changes start position of song", [argOffset], function(_offset:Float) {
			if (_offset < 0) {
				console.log("Offset needs to be zero or greater, ${_offset} is not valid...", 0xFF0000);
				return;
			}
			audio.offset = _offset;
		});
		var argCamToggle:ConsoleArgDesc = {t: ABool, opt: false, name : "True/False"};
		var argCamFollow:ConsoleArgDesc = {t: AString, opt: true, name : "Rider name"};
		console.addCommand(Commands.enableCamera, "Toggle camera on or off, and set rider to follow", [argCamToggle, argCamFollow], function(_enabled:Bool, ?_name:String ) {
			
			if (!_enabled) {
				camera.enabled == false;
			} else {
				if (_name == null && camera.riderFollow == null) {
					console.log('A rider to follow has not been set, please specify a name.', 0xFF0000);
				} else if (_name == null && camera.riderFollow != null) {
					camera.enabled = true;
				} else if (_name != null) {
					camera.riderFollow = _name;
					camera.enabled = true;
				}
			}
			
		});
	}
	
	var networkDelta:Float = 0.0;
	var riderPhysDelta:Float = 0.0;
	var playing:Bool = false;
	
	override function update(dt:Float):Void 
	{
		super.update(dt);
		
		textinfo.framerate = dt;
		
		if (simulation.playing && !simulation.rewinding) {
			simulation.playSim(dt);
		} else if (simulation.rewinding) {
			simulation.rewindSim(dt);
		}
		
		if (simulation.updating) {
			simulation.liveUpdateTick();
		}
	}
	
	override public function render(e:h3d.Engine):Void 
	{
		ruler.update();
		rulerScene.render(e);
		
		super.render(e);
		
		canvas.drawRiders();
		
		textinfo.update();
		
		timeline.update();
			
		if (camera.enabled && simulation.playing) camera.follow();
	}
	
	override function onResize():Void 
	{
		rulerScene.checkResize();
		
		super.onResize();
		
		ruler.x = ruler.y = 0;
		ruler.resize();
		
		canvas_interaction.width = engine.width;
		canvas_interaction.height = engine.height;
		
		mask.width = engine.width;
		mask.height = engine.height;
		
		textinfo.align();
		
		toolbar.x = (engine.width / 2) - (toolbar.width / 2);
		toolbar.y = 3;
		
		timeline.x = 0;
		timeline.y = s2d.height - 40;
		timeline.resize();
		
		menu.x = menu.y = 5;
		menu.resize();
		
	}
	
	//this function needs to be improved
	static function get_tl():h2d.col.Point 
	{
		var point = canvas.globalToLocal(new h2d.col.Point());
		return point;
	}
	
	static function get_br():h2d.col.Point 
	{
		var point = canvas.globalToLocal(new h2d.col.Point(Main.locengine.width, Main.locengine.height));
		return point;
	}
}