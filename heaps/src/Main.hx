package;

import components.Assets;
import components.stage.Ruler;
import components.stage.TimeLine;
import h2d.Scene;
import haxe.Json;
import hxd.res.Resource;
import hxlr.Common;
import hxlr.enums.LineType;
import hxlr.file.JSONTrack;
import hxlr.rider.RiderStruct;
import hxlr.engine.Grid;

import components.stage.Camera;
import components.managers.Musicplayer;
import components.managers.Riders;
import components.managers.Simulation;
import components.stage.TextInfo;
import components.tool.ToolBehavior;
import components.ui.Toolbar;
import components.ui.MenuMain;
import enums.Commands;
import h2d.Mask;
import h2d.col.Point;
import components.stage.Canvas;
import h3d.Engine;
import haxe.io.Bytes;
import hxd.res.DefaultFont;
import hxd.File;
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
	
	public static var canvas:Canvas;
	
	public static var input:Interactive;
	
	public static var toolControl:ToolBehavior;
	public static var toolbar:Toolbar;
	public static var timeline:TimeLine;
	
	public static var build:String;
	
	public static var grid:Grid;
	
	public static var riders:Riders;
	
	public static var simulation:Simulation;
	
	public static var textinfo:TextInfo;
	
	public static var audio:Musicplayer;
	
	public static var rng:TableRNG;
	
	public static var camera:Camera;
	
	public static var menu:MenuMain;
	
	public static var ruler:Ruler;
	
	var mask:Mask;
	
	static function main() 
	{
		#if debug
		build = "Debug";
		#else
		build = "Release";
		#end
		
		var month = Date.now().getMonth(); //0 - 11
		var day = Date.now().getDate(); //1 - 31
		
		if (month == 7 && day == 16) Constants.names.unshift("Boo");
				
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
		
		input = new Interactive(engine.width, engine.height, s2d);
		
		toolControl = new ToolBehavior();
		
		grid = new Grid();
		
		riders = new Riders();
		
		simulation = new Simulation();
		
		//must load these last!
		
		textinfo = new TextInfo();
		s2d.addChild(textinfo.info);
		textinfo.info.x = engine.width - textinfo.info.textWidth - 5;
		textinfo.info.y = 5;
		
		#if embeded_track
		toolbar = new Toolbar();
		#else
		toolbar = new Toolbar(s2d);
		#end
		timeline = new TimeLine(s2d);
		toolbar.x = (engine.width / 2) - (toolbar.width / 2);
		toolbar.y = 30;
		
		var firstRider = riders.addNewRider(new Point(0, 0));
		
		camera = new Camera();
		camera.riderFollow = firstRider.name;
		
		#if !embeded_track
		
		hxd.Window.getInstance().title = "OpenLR - " + Main.build;
		
		#else
		
		hxd.Window.getInstance().title = "OpenLR - " + Main.trackName;
		
		canvas.drawMode = DrawMode.PLAYBACK;
		#end
		
		onResize();
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
		
		input.width = engine.width;
		input.height = engine.height;
		input.y = 35;
		
		mask.width = engine.width;
		mask.height = engine.height;
		
		textinfo.align();
		
		toolbar.x = (engine.width / 2) - (toolbar.width / 2);
		toolbar.y = 40;
		
		timeline.x = 0;
		timeline.y = s2d.height - 40;
		timeline.resize();
		
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