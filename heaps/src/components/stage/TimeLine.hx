package components.stage;
import h2d.Bitmap;
import h2d.Interactive;
import h2d.Object;
import h2d.Tile;
import h2d.col.IPolygon.OffsetKind;
import hxsl.Shader;

/**
 * ...
 * @author Kaelan
 */
class TimeLine extends Object
{

	public var scrubber:Bitmap;
	public var shader:ScrubberShader;
	public var clicky:Interactive;
	
	public function new(?_parent:Object) 
	{
		super(_parent);
		
		scrubber = new Bitmap(Tile.fromColor(0xFFFFFF), this);
		scrubber.addShader(shader = new ScrubberShader());
		
		clicky = new Interactive(0, 40, scrubber);
	}
	
	public function resize() {
		scrubber.tile = Tile.fromColor(0xFF00DD, Main.rootScene.width, 40);
		update();
	}
	
	public function update() {
		shader.ratio = 8 / Main.rootScene.width;
		shader.frame = Main.simulation.frames;
		shader.minLeftValue = Std.int(Main.rootScene.width / 2 / 8);
		
		clicky.width = Main.rootScene.width;
	}
	
}

class ScrubberShader extends Shader
{
	static var SRC = {
		
		@:import h3d.shader.Texture;
		
		@param var frame:Int = 0;
		@param var minLeftValue:Int = 0;
		@param var ratio:Float = 0.1;
		
		function vertex() {
			calculatedUV = input.uv;
		}
		
		function fragment() {
			var uvOffset:Vec2 = calculatedUV;
			
			var offset = (frame - minLeftValue) + (floor(uvOffset.x / ratio)); 
			
			pixelColor = vec4(0.75, 0.75, 0.75, 1);
			
			if (offset < 0) {
				pixelColor = vec4(0.65, 0.35, 0.35, 1);
			} else if (offset == frame) {
				pixelColor = vec4(0.15, 0.75, 0.15, 1);
			} else if (offset % 14400 == 0) {
				pixelColor = vec4(0.6, 0.2, 1, 1);
			} else if (offset % 2400 == 0) {
				pixelColor = vec4(0.65, 0.35, 0.35, 1);
			} else if (offset % 40 == 0) {
				pixelColor = vec4(0.35, 0.35, 0.65, 1);
			} else if (offset % 10 == 0) {
				pixelColor = vec4(0.45, 0.45, 0.45, 1);
			} else if (offset % 2 == 0) {
				pixelColor = vec4(0.65, 0.65, 0.65, 1);
			}
		}
		
	};
	
	public function new()
	{
		super();
	}
}