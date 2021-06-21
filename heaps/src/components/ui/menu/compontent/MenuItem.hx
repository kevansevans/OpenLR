package components.ui.menu.compontent;

import h2d.Object;
import h2d.Interactive;
import h2d.Text;
import components.Assets;
import h2d.Bitmap;
import h3d.Vector;
import h2d.Tile;
import hxd.Event;

/**
 * ...
 * @author Kaelan
 */
class MenuItem extends Object
{
	var bg:Bitmap;
	public var clicky:Interactive;
	var text:Text;
	var activated:Bool = false;
	
	public var width(get, null):Float;
	
	public var onClick:Void -> Void;
	
	public function new(_name:String, ?parent:Object) 
	{
		super(parent);
		
		text = new Text(Assets.f_verdana_16);
		text.text = _name;
		text.color = new Vector(1, 1, 1, 1);
		
		bg = new Bitmap(Tile.fromColor(0x999999, Std.int(10 + text.textWidth), 30), this);
		addChild(text);
		text.x = text.y = 5;
		
		clicky = new Interactive(bg.tile.width, bg.tile.height, this);
		clicky.onClick = function(info:Event) {
			onClick();
		}
		
		onClick = function() {
			
		}
	}
	
	public function activate() {
		bg.tile = Tile.fromColor(0xAAAAAA, Std.int(10 + text.textWidth), 30);
		text.color = new Vector();
	}
	
	function get_width():Float 
	{
		return bg.tile.width;
	}
	
	public function deactivate() {
		bg.tile = Tile.fromColor(0x999999, Std.int(10 + text.textWidth), 30);
		text.color = new Vector(1, 1, 1, 1);
	}
}