package network;
import h2d.HtmlText;
import h2d.Object;
import h2d.Graphics;
import hxd.res.DefaultFont;

/**
 * ...
 * @author Kaelan
 */
class PeerCursor extends Object
{
	var nameField:HtmlText;
	var gfx:Graphics;
	
	public var peername:String;
	
	public function new(_name:String) 
	{
		super();
		
		peername = _name;
		
		nameField = new HtmlText(DefaultFont.get(), this);
		nameField.x = 6;
		nameField.y = -(nameField.textHeight / 2);
		nameField.text = _name;
		gfx = new Graphics(this);
		gfx.clear();
		gfx.lineStyle(2, 0xCC00CC, 0.75);
		gfx.drawCircle(0, 0, 1, 10);
	}
	
	public function update(_x:Float, _y:Float) {
		
		this.x = _x;
		this.y = _y;
		
	}
	
	public function delete() {
		Main.canvas.removeChild(this);
	}
	
}