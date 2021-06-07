package components.sledder;

import h2d.Object;
import h2d.Bitmap;
import hxd.Pixels;
import hxd.PixelFormat;
import h2d.Tile;

/**
 * ...
 * @author Kaelan
 */
class RiderScarf extends Object {
	
	public var colorA:Null<Int> = 0x0A0A8;
	public var colorB:Null<Int>;
	
	var bitmap:Bitmap;
	var pixels:Pixels;
	
	public function new() {
		super();
		
		setColor();
	}
	
	public function setColor(?_a:Null<Int>, ?_b:Null<Int>):Void 
	{
		if (_a == null) {
			var r = Std.int(0xFF * Main.rng.getRandomNormal());
			var g = Std.int(0xFF * Main.rng.getRandomNormal());
			var b = Std.int(0xFF * Main.rng.getRandomNormal());
			colorA = r << 16 | g << 8 | b;
		} else if (_a != null) {
			colorA = _a;
		}
		
		if (_b == null) {
			var r = Std.int(0xFF * Main.rng.getRandomNormal());
			var g = Std.int(0xFF * Main.rng.getRandomNormal());
			var b = Std.int(0xFF * Main.rng.getRandomNormal());
			colorB = r << 16 | g << 8 | b;
		} else if (_b != null) {
			colorB = _b;
		}
		
		pixels = Pixels.alloc(40, 100, PixelFormat.ARGB);
		
		for (x in 0...40) for (y in 0...100) {
			if (y > 80) {
				pixels.setPixel(x, y, 0xFF << 24 | colorA);
			} else if (y > 60) {
				pixels.setPixel(x, y, 0xFF << 24 | colorB);
			} else if (y > 40) {
				pixels.setPixel(x, y, 0xFF << 24 | colorA);
			} else if (y > 20) {
				pixels.setPixel(x, y, 0xFF << 24 | colorB);
			} else {
				pixels.setPixel(x, y, 0xFF << 24 | colorA);
			}
		}
		
		bitmap = new Bitmap(Tile.fromPixels(pixels), this);
	}
	
}