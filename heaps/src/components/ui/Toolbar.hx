package components.ui;

import h2d.Bitmap;
import h2d.Interactive;
import h2d.Object;
import h2d.Tile;
import hxd.Event;
import hxd.Res;

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
	
	public var pencil:UIButton;
	public var line:UIButton;
	public var eraser:UIButton;
	
	var activetool:UIButton;
	
	public var width(get, null):Float;
	
	public function new(?parent:Object) 
	{
		super(parent);
		
		icons = new Array();
		
		icons.push(pencil = new UIButton(PENCIL));
		icons.push(line = new UIButton(LINE));
		icons.push(eraser = new UIButton(ERASER));
		
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
	
	public function new(_icon:Icon) 
	{
		super();
		
		btn_up = new Bitmap(Tile.fromColor(0xFFFFFF, 30, 30), this);
		btn_over = new Bitmap(Tile.fromColor(0xDDDDDD, 30, 30), this);
		btn_down = new Bitmap(Tile.fromColor(0xBBBBBB, 30, 30), this);
		btn_selected = new Bitmap(Tile.fromColor(0x00CCFF, 30, 30), this);
		btn_selected.visible = false;
		
		switch (_icon) {
			case PENCIL :
				
				btn_icon = new Bitmap(Res.icon.pencil.toTile(), this);
				
			case LINE :
				
				btn_icon = new Bitmap(Res.icon.line.toTile(), this);
				
			case ERASER :
				
				btn_icon = new Bitmap(Res.icon.eraser.toTile(), this);
				
			default :
				
		}
		
		btn_over.visible = btn_down.visible = false;
		
		if (btn_icon != null) btn_icon.scale(0.1);
		
		clicky = new Interactive(30, 30, this);
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