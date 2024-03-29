package;

import components.shaders.ScaleShader;
import h2d.col.Point;
import h2d.Interactive;
import h2d.Scene;
import h2d.Mask;
import h3d.Engine;
import haxe.ui.components.TextField;
import haxe.ui.events.UIEvent;
import hxd.App;
import hxd.Math;
import hxd.Res;

import hxlr.Common;
import hxlr.engine.Grid;
import hxlr.engine.RiderManager;
import hxlr.engine.Simulation;

import components.Assets;
import components.managers.Musicplayer;
import components.stage.LineCanvas;
import components.stage.Ruler;
import components.stage.TimeLine;
import components.stage.RiderLayer;
import components.stage.Camera;
import components.stage.TextInfo;
import components.tool.ToolBehavior;
import components.ui.Toolbar;
import components.ui.MenuMain;
import components.sledder.Bosh;
import utils.TableRNG;

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
	
	public static var riderLayer:RiderLayer;
	public static var lineCanvas:LineCanvas;
	public static var scaleShader:ScaleShader;
	
	public static var input:Interactive;
	
	public static var toolControl:ToolBehavior;
	public static var toolbar:Toolbar;
	public static var timeline:TimeLine;
	
	public static var build:String;
	
	public static var grid:Grid;
	
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
		
		if (month == 7 && day == 16) Common.names.unshift("Boo");
		
		Engine.ANTIALIASING = 4;
				
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
		
		scaleShader = new ScaleShader();
		
		Main.locengine = engine;
		Main.rootScene = s2d;
		
		Res.initEmbed();
		
		new Assets();
		
		engine.backgroundColor = 0xFFCCCCCC;
		
		s2d.defaultSmooth = true;
		
		rulerScene = new Scene();
		ruler = new Ruler(rulerScene);
		
		riderLayer = new RiderLayer(s2d);
		
		lineCanvas = new LineCanvas(s3d);
		Common.lightLinesUp = lineCanvas.lightUpLines;
		Common.clearLitLines = lineCanvas.resetLines;
		
		riderLayer.x = engine.width / 2;
		riderLayer.y = engine.height / 2;
		
		RiderManager.addNewRider(new Point(0, 0), Bosh);
		
		input = new Interactive(engine.width, engine.height, s2d);
		
		toolControl = new ToolBehavior();
		
		grid = new Grid();
		
		Simulation.init();
		
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
		
		camera = new Camera();
		
		#if !embeded_track
		
		hxd.Window.getInstance().title = "OpenLR - " + Main.build;
		
		#else
		
		hxd.Window.getInstance().title = "OpenLR - " + Main.trackName;
		
		canvas.drawMode = DrawMode.PLAYBACK;
		#end
		
		textinfo.update();
		
		menu = new MenuMain(s2d);
		
		onResize();
	}
	
	var networkDelta:Float = 0.0;
	var riderPhysDelta:Float = 0.0;
	var playing:Bool = false;
	
	override function update(dt:Float):Void 
	{
		super.update(dt);
		
		textinfo.framerate = dt;
		
		if (Simulation.playing && !Simulation.rewinding) {
			Simulation.playSim(dt);
		} else if (Simulation.rewinding) {
			Simulation.rewindSim(dt);
		}
		
		s3d.camera.screenRatio = engine.width / engine.height;
		scaleShader.update(engine);
	}
	
	override public function render(e:h3d.Engine):Void 
	{
		ruler.update();
		rulerScene.render(e);
		
		super.render(e);
		
		riderLayer.drawRiders();
		
		textinfo.update();
		
		timeline.update();
			
		if (camera.enabled && Simulation.playing) camera.follow();
	}
	
	override function onResize():Void 
	{
		rulerScene.checkResize();
		
		super.onResize();
		
		ruler.x = ruler.y = 0;
		ruler.resize();
		
		input.width = engine.width;
		input.height = engine.height;
		
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
		var point = riderLayer.globalToLocal(new h2d.col.Point());
		return point;
	}
	
	static function get_br():h2d.col.Point 
	{
		var point = riderLayer.globalToLocal(new h2d.col.Point(Main.locengine.width, Main.locengine.height));
		return point;
	}
}