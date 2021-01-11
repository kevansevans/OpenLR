package network;

import h2d.Bitmap;
import h2d.HtmlText;
import h2d.Object;
import h2d.Graphics;
import hxd.Res;
import hxd.res.DefaultFont;

/**
 * ...
 * @author Kaelan
 */
class PeerCursor extends Object
{
	var nameField:HtmlText;
	var cursor:Bitmap;
	
	public var peername:String;
	
	public function new(_name:String) 
	{
		super();
		
		peername = _name;
		
		nameField = new HtmlText(DefaultFont.get(), this);
		nameField.x = 14;
		nameField.y = -30;
		nameField.text = _name;
		
		cursor = new Bitmap(Res.tool.pencilmp.toTile(), this);
		cursor.x = -1;
		cursor.y = -25;
	}
	
	public function update(_x:Float, _y:Float) {
		
		this.x = _x;
		this.y = _y;
		
		this.scaleX = this.scaleY = 1 / Main.canvas.scaleX;
		
	}
	
	public function delete() {
		Main.canvas.removeChild(this);
	}
	
}