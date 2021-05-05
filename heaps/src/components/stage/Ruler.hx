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
		
		shader.midFloatX = (1 / Main.rootScene.width) * ((Main.rootScene.width % 2 == 0 ? Main.rootScene.width - 1 : Main.rootScene.width)  / 2); 
		shader.midFloatY = (1 / Main.rootScene.height) * ((Main.rootScene.height % 2 == 0 ? Main.rootScene.height - 1 : Main.rootScene.height) / 2); 
		
		shader.bg_r = (color >> 16) / 255;
		shader.bg_g = ((color >> 8) & 0xFF) / 255;
		shader.bg_b = (color & 0xFF) / 255;
		
		shader.offsetX = (Main.canvas.x - (Main.rootScene.width / 2)) * (1 / Main.rootScene.width);
		shader.offsetY = (Main.canvas.y - (Main.rootScene.height / 2)) * (1 / Main.rootScene.height);
		
		shader.scale = 1 / Main.canvas.scaleX;
		shader.size = Main.viewGridSize;
		
		shader.enabled = enabled ? 1 : 0;
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
		
		@param var midFloatX:Float = 0.5;
		@param var midFloatY:Float = 0.5;
		
		@param var ratioX:Float = 1;
		@param var ratioY:Float = 1;
		
		@param var enabled:Int = 1;
		
		function vertex() {
			calculatedUV = input.uv;
		}
		
		function fragment() {
			var uvOffset:Vec2 = calculatedUV;
			
			uvOffset.x -= offsetX;
			uvOffset.y -= offsetY;
			
			var tol:Int = 1000;
			
			pixelColor = vec4(bg_r, bg_g, bg_b, 1);
			
			if (enabled == 0) return;
				
			var copy:Vec4 = pixelColor;
			
			var alph:Float = min((size * (1 / scale)) / 3, 0.5);
			
			if (((uvOffset.x - 0.5) / ratioX) % (size * (1 / scale)) <= 1) {
				pixelColor = vec4(1 - copy.r, 1 - copy.g, 1 - copy.b, alph);
			}
				
			if (((uvOffset.y - 0.5) / ratioY) % (size * (1 / scale)) <= 1) {
				pixelColor = vec4(1 - copy.r, 1 - copy.g, 1 - copy.b, alph);
			}
			
			if ((uvOffset.x - 0.5) / ratioX <= 1 && (uvOffset.x - 0.5) / ratioX >= -1) {
				pixelColor = vec4(0, 0, 0.75, 1);
			}
			if ((uvOffset.y - 0.5) / ratioY <= 1 && (uvOffset.y - 0.5) / ratioY >= -1) {
				pixelColor = vec4(0, 0, 0.75, 1);
			}
			
		}
		
	};
	
	public function new()
	{
		super();
	}
}