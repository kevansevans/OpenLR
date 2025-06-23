package components.sledder;

import h2d.Object;
import h2d.Bitmap;
import h2d.Tile;
import components.shaders.ScarfShader;

/**
 * ...
 * @author Kaelan
 */
class RiderScarf extends Object {
	
	var bitmap:Bitmap;
	
	public var scarfShader:ScarfShader;
	var colors:Array<Int>;
	
	public function new(_colors:Array<Int>) {
		super();
		
		bitmap = new Bitmap(Tile.fromColor(0, 40, 100, 1), this);
		
		scarfShader = new ScarfShader();
		bitmap.addShader(scarfShader);
		
		setColors(_colors);
	}
	
	public function setColors(_colors:Array<Int>)
	{
		colors = _colors.copy();
		if (colors.length > 5) colors.resize(5);
		else {
			var count:Int = 0;
			var length = _colors.length;
			while (colors.length < 5)
			{
				colors.push(_colors[count % length]);
				++count;
			}
		}
		
		scarfShader.colors = colors;
	}
}