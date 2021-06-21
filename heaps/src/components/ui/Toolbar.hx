package components.ui;

import h2d.Bitmap;
import h2d.Interactive;
import h2d.Object;
import h2d.Tile;
import hxd.Event;
import hxd.Res;
import hxlr.engine.Grid;

/**
 * ...
 * @author Kaelan
 */

enum Icon {
	PENCIL;
	LINE;
	ERASER;
	PLAY;
	PAUSE;
	STOP;
	SWATCH_BLUE;
	SWATCH_RED;
	SWATCH_GREEN;
}

class Toolbar extends Object 
{
	var icons:Array<UIButton>;
	var swatches:Array<UIButton>;
	
	public var pencil:UIButton;
	public var line:UIButton;
	public var eraser:UIButton;
	public var gear:UIButton;
	
	public var blue:UIButton;
	public var red:UIButton;
	public var green:UIButton;
	
	var activetool:UIButton;
	
	public var width(get, null):Float;
	
	public function new(?parent:Object) 
	{
		super(parent);
		
		icons = new Array();
		swatches = new Array();
		
		icons.push(pencil = new UIButton(Res.icon.pencil.toTile(), 0.1));
		icons.push(line = new UIButton(Res.icon.line.toTile(), 0.1));
		icons.push(eraser = new UIButton(Res.icon.eraser.toTile(), 0.1));
		icons.push(gear = new UIButton(Res.icon.gear.toTile(), 0.1));
		
		swatches.push(blue = new UIButton(Tile.fromColor(0x0066FF, 30, 15)));
		swatches.push(red = new UIButton(Tile.fromColor(0xCC0000, 30, 15)));
		swatches.push(green = new UIButton(Tile.fromColor(0x00CC00, 30, 15)));
		
		pencil.selected = true;
		activetool = pencil;
		
		pencil.onClick = function() {
			activetool.selected = false;
			pencil.selected = true;
			activetool = pencil;
			Main.toolControl.setToolPencil();
		}
		
		line.onClick = function() {
			activetool.selected = false;
			line.selected = true;
			activetool = line;
			Main.toolControl.setToolLine();
		}
		
		eraser.onClick = function() {
			activetool.selected = false;
			eraser.selected = true;
			activetool = eraser;
			Main.toolControl.setToolEraser();
		}
		
		gear.onClick = function() {
			if (Main.menu.open) Main.menu.toggleOff();
			else Main.menu.toggleOn();
		}
		
		blue.onClick = function() {
			Main.toolControl.setColorMode(FLOOR);
		}
		
		red.onClick = function() {
			Main.toolControl.setColorMode(ACCEL);
		}
		
		green.onClick = function() {
			Main.toolControl.setColorMode(SCENE);
		}
		
		sort();
	}
	
	public function externalUpdate(_tool:Icon) {
		
		
		activetool.selected = false;
		
		switch (_tool) {
			case PENCIL :
				pencil.selected = true;
			case LINE :
				line.selected = true;
			case ERASER :
				eraser.selected = true;
			default :
		}
	}
	
	function sort() {
		for (ix in 0...icons.length) {
			var icon = icons[ix];
			addChild(icon);
			icon.x = (30 * ix) + (3 * ix);
		}
		
		for (ix in 0...swatches.length) {
			var icon = swatches[ix];
			addChild(icon);
			icon.y = 35;
			icon.x = pencil.x + (30 * ix) + (3 * ix);
		}
	}
	
	function get_width():Float 
	{
		return (30 * icons.length) + (3 * icons.length); 
	}
	
}

class UIButton extends Object
{
	public var onClick:Void -> Void = function(){};
	
	var underlay:Bitmap;
	var btn_up:Bitmap;
	var btn_over:Bitmap;
	var btn_down:Bitmap;
	var btn_selected:Bitmap;
	var btn_icon:Bitmap;
	var clicky:Interactive;
	
	public var enabled:Bool = true;
	public var selected(default, set):Bool = false;
	
	public function new(_icon:Tile, _scale:Float = 1.0) 
	{
		super();
		
		btn_icon = new Bitmap(_icon);
		btn_icon.setScale(_scale);
		
		var cal_width = Std.int(_icon.width * _scale);
		var cal_height = Std.int(_icon.height * _scale);
		
		btn_up = new Bitmap(Tile.fromColor(0xFFFFFF, cal_width, cal_height), this);
		btn_over = new Bitmap(Tile.fromColor(0xDDDDDD, cal_width, cal_height), this);
		btn_down = new Bitmap(Tile.fromColor(0xBBBBBB, cal_width, cal_height), this);
		btn_selected = new Bitmap(Tile.fromColor(0x00CCFF, cal_width, cal_height), this);
		btn_selected.visible = false;
		
		addChild(btn_icon);
		
		btn_over.visible = btn_down.visible = false;
	
		
		clicky = new Interactive(cal_width, cal_height, this);
		clicky.onOver = function(e:Event) {
			btn_up.visible = false;
			btn_down.visible = false;
			btn_selected.visible = false;
			btn_over.visible = true;
		}
		clicky.onOut = function(e:Event) {
			btn_up.visible = true;
			btn_down.visible = false;
			btn_over.visible = false;
			if (!selected) {
				btn_selected.visible = false;
			} else {
				btn_selected.visible = true;
			}
		}
		clicky.onPush = function(e:Event) {
			btn_up.visible = false;
			btn_down.visible = true;
			btn_selected.visible = false;
			btn_over.visible = false;
			onClick();
		}
		clicky.onRelease = function(e:Event) {
			btn_up.visible = false;
			btn_down.visible = false;
			btn_selected.visible = false;
			btn_over.visible = true;
		}
		clicky.onReleaseOutside = function(e:Event) {};
	}
	
	function set_selected(value:Bool):Bool 
	{
		btn_selected.visible = value;
		return selected = value;
	}
}