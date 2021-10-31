package components.stage;
import h2d.Bitmap;
import h2d.Object;
import h2d.Tile;
import hxsl.Shader;

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

class RulerShader extends Shader
{
	static var SRC = {
		
		@:import h3d.shader.Texture;
		
		@param var bg_r:Float;
		@param var bg_g:Float;
		@param var bg_b:Float;
		
		@param var offsetX:Float = 0;
		@param var offsetY:Float = 0;
		
		@param var scale:Float = 0;
		@param var size:Int = 0;
		
		@param var ratioX:Float = 1;
		@param var ratioY:Float = 1;
		
		@param var enabled:Int = 1;
		@param var hatch:Int = 1;
		@param var origin:Int = 1;
		
		function vertex() {
			calculatedUV = input.uv;
		}
		
		function fragment() {
			
			if (enabled == 0) return;
			
			var uvOffset:Vec2 = calculatedUV;
			
			uvOffset.x -= offsetX;
			uvOffset.y -= offsetY;
			
			pixelColor = vec4(bg_r, bg_g, bg_b, 1);
				
			var copy:Vec4 = pixelColor;
			
			var alph:Float = min((size * (1 / scale)) / 3, 0.5);
			
			if (hatch == 1) {
				
				if (((uvOffset.x - 0.5) / ratioX) % (size * (1 / scale)) <= 1) {
					pixelColor = vec4(1 - copy.r, 1 - copy.g, 1 - copy.b, alph);
				}
				
				else if (((uvOffset.y - 0.5) / ratioY) % (size * (1 / scale)) <= 1) {
					pixelColor = vec4(1 - copy.r, 1 - copy.g, 1 - copy.b, alph); 
				}
			}
			
			if (origin == 1) {
				
				var originThickness:Float = 1.25;
				
				if ((uvOffset.x - 0.5) / ratioX <= originThickness && (uvOffset.x - 0.5) / ratioX >= -originThickness) {
					pixelColor = vec4(0, 0, 0.75, 1);
				}
				else if ((uvOffset.y - 0.5) / ratioY <= originThickness && (uvOffset.y - 0.5) / ratioY >= -originThickness) {
					pixelColor = vec4(0, 0, 0.75, 1);
				}
				
			}
			
		}
		
	};
	
	public function new()
	{
		super();
	}
}