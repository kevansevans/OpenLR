package components.stage;
import h2d.Bitmap;
import h2d.Object;
import h2d.Tile;
import components.shaders.RulerShader;

/**
 * ...
 * @author Kaelan
 */
class Ruler extends Object
{

	var bitmap:Bitmap;
	var shader:RulerShader;
	
	public var color:Int = 0xCCCCCC;
	public var enabled:Bool = true;
	public var rulerSize:Int = 14;
	
	public var originEnabled:Bool = true;
	public var hatchEnabled:Bool = true;
	
	public function new(?_parent:Object) 
	{
		super(_parent);
		
		bitmap = new Bitmap(Tile.fromColor(0), this);
		bitmap.addShader(shader = new RulerShader());
	}
	
	public function resize() {
		
		bitmap.tile = Tile.fromColor(0, Main.rootScene.width, Main.rootScene.height);
		
	}
	public function update() {
		
		shader.ratioX = (1 / Main.rootScene.width);
		shader.ratioY = (1 / Main.rootScene.height);
		
		shader.bg_r = (color >> 16) / 255;
		shader.bg_g = ((color >> 8) & 0xFF) / 255;
		shader.bg_b = (color & 0xFF) / 255;
		
		shader.offsetX = (Main.canvas.x - (Main.rootScene.width / 2)) * (1 / Main.rootScene.width);
		shader.offsetY = (Main.canvas.y - (Main.rootScene.height / 2)) * (1 / Main.rootScene.height);
		
		shader.scale = 1 / Main.canvas.scaleX;
		shader.size = rulerSize;
		
		if (!originEnabled && !hatchEnabled)
		{
			shader.enabled = 0;
		} else {
			shader.enabled = 1;
			
			shader.hatch = hatchEnabled == false ? 0 : 1;
			shader.origin = originEnabled == false ? 0 : 1;
		}
		
	}
	
}