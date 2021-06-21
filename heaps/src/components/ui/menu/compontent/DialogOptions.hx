package components.ui.menu.compontent;

import h2d.Bitmap;
import h2d.Interactive;
import h2d.Object;
import h2d.Text;
import h2d.Tile;
import hxd.Event;
import hxd.res.DefaultFont;
import h3d.Vector;

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
		
		message = new Text(DefaultFont.get(), this);
		message.maxWidth = 320;
		message.x = 50 - (95 / 2);
		message.text = _message;
		message.color = new Vector(); 
		
		options = new Array();
		for (name in _options) {
			var btn:DialogButton = new DialogButton(name, this);
			options.push(btn);
		}
		
		var maxWidth:Float = options.length * 65;
		for (button in options) {
			button.y = 65;
			button.x = (65 * options.indexOf(button)) + (maxWidth / _options.length);
		}
	}
	
}

class DialogButton extends Object
{
	var box:Bitmap;
	var label:Text;
	var clicky:Interactive;
	
	public var onClick:Event -> Void = function(_event:Event) {};
	
	public function new(_label:String, ?_parent:Object) {
		
		super(_parent);
		
		box = new Bitmap(Tile.fromColor(0xF8F8F8, 60, 30), this); 
		
		label = new Text(DefaultFont.get(), this);
		label.text = _label;
		label.x = 30 - (label.calcTextWidth(label.text) / 2);
		label.y = 15 - (label.textHeight / 2);
		label.color = new Vector();
		
		clicky = new Interactive(60, 30, box);
		clicky.onClick = this.onClick;
		clicky.onOver = function(_event:Event) {
			box.tile = Tile.fromColor(0xadec93, 60, 30);
		}
		clicky.onOut = function(_event:Event) {
			box.tile = Tile.fromColor(0xF8F8F8, 60, 30);
		}
	}
}