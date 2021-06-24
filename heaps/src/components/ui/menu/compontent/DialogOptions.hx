package components.ui.menu.compontent;

import h2d.Bitmap;
import h2d.Interactive;
import h2d.Object;
import h2d.Text;
import h2d.Tile;
import hxd.Event;
import hxd.res.DefaultFont;
import h3d.Vector;

import components.Assets;

/**
 * ...
 * @author Kaelan
 */
 
class DialogOptions extends Object
{

	public var options:Array<DialogButton>;
	
	var box:Bitmap;
	var message:Text;
	
	public function new(_message:String, _options:Array<String>, ?_parent:Object)
	{
		super(_parent);
		
		box = new Bitmap(Tile.fromColor(0xFFFFFF, 330, 100), this);
		
		message = new Text(Assets.f_verdana_16, this);
		message.maxWidth = 320;
		message.x = 50 - (95 / 2);
		message.text = _message;
		message.color = new Vector(); 
		
		options = new Array();
		var maxWidth:Float = 0;
		for (name in _options) {
			var btn:DialogButton = new DialogButton(name, this);
			options.push(btn);
			maxWidth += btn.width;
		}
		
		var prevBtn:DialogButton = null;
		for (button in options) {
			
			if (prevBtn == null) {
				button.x = (330 / 2) - (maxWidth / 2);
				button.y = 65;
				prevBtn = button;
			} else {
				button.x = prevBtn.x + prevBtn.width + 5;
				button.y = 65;
				prevBtn = button;
			}
			
		}
	}
	
}

class DialogButton extends Object
{
	var box:Bitmap;
	var boxwidth:Int;
	var label:Text;
	var clicky:Interactive;
	
	public var width(get, null):Float;
	
	function get_width():Float 
	{
		return box.tile.width;
	}
	
	public var onClick:Event -> Void = function(?_event:Event) {};
	
	public function new(_label:String, ?_parent:Object) {
		
		super(_parent);
		
		label = new Text(Assets.f_verdana_20);
		var textwidth = label.calcTextWidth(_label);
		boxwidth = textwidth > 65 ? Std.int(textwidth) + 20 : 65;
		box = new Bitmap(Tile.fromColor(0xAFAFAF, boxwidth, 30), this); 
		addChild(label);
		
		label.text = _label;
		label.x = (boxwidth / 2) - (label.calcTextWidth(label.text) / 2);
		label.y = 15 - (label.textHeight / 2);
		label.color = new Vector();
		
		clicky = new Interactive(boxwidth, 30, box);
		clicky.onClick = function(_event:Event) {
			onClick(_event);
		}
		clicky.onOver = function(_event:Event) {
			box.tile = Tile.fromColor(0xadec93, boxwidth, 30);
		}
		clicky.onOut = function(_event:Event) {
			box.tile = Tile.fromColor(0xAFAFAF, boxwidth, 30);
		}
	}
}