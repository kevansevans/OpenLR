package components.stage;
import components.ui.Toolbar.UIButton;
import h2d.Bitmap;
import h2d.Interactive;
import h2d.Object;
import h2d.Tile;
import h2d.col.IPolygon.OffsetKind;
import h2d.col.Point;
import hxd.Event;
import hxsl.Shader;
import hxd.Res;

/**
 * ...
 * @author Kaelan
 */
class TimeLine extends Object
{

	public var scrubber:Bitmap;
	public var shader:ScrubberShader;
	public var clicky:Interactive;
	
	public var dragging:Bool = false;
	public var righty:Bool = false;
	public var mouseStart:Point;
	public var toAdjust:Int = 0;
	
	public var camera:UIButton;
	
	public function new(?_parent:Object) 
	{
		super(_parent);
		
		scrubber = new Bitmap(Tile.fromColor(0xFFFFFF), this);
		scrubber.addShader(shader = new ScrubberShader());
		
		clicky = new Interactive(0, 40, scrubber);
		clicky.enableRightButton = true;
		clicky.onPush = function(info:Event) {
			dragging = true;
			mouseStart = new Point(Main.rootScene.mouseX, Main.rootScene.mouseY);
			
			if (info.button == 1) righty = true;
		}
		clicky.onRelease = clicky.onReleaseOutside = function(info:Event) {
			dragging = false;
			righty = false;
		}
		
		camera = new UIButton(Res.icon.camera.toTile(), 0.1);
		addChild(camera);
		camera.onClick = function() {
			camera.selected = Main.camera.enabled = !camera.selected;
		}
	}
	
	public function resize() {
		scrubber.tile = Tile.fromColor(0xFF00DD, Main.rootScene.width, 40);
		clicky.width = Main.rootScene.width;
		update();
		
		camera.y = -35;
		camera.x = (Main.rootScene.width / 2) - 15;
	}
	
	public function update() {
		
		shader.ratio = 8 / Main.rootScene.width;
		shader.frame = Main.simulation.frames;
		shader.minLeftValue = Std.int(Main.rootScene.width / 2 / 8);
		
		var moved:Bool = false;
		
		if (toAdjust != 0) {
			updateSim();
		}
		
		if (dragging) {
			
			var distance:Float = mouseStart.x - Main.rootScene.mouseX;
			var forward:Bool = distance > 0;
			var distAbs:Float = Math.abs(distance);
			
			while (distAbs >= 8) {
				
				if (forward) {
					if (!righty) {
						++toAdjust;
					} else {
						toAdjust += 40;
					}
					moved = true;
				} else {
					
					if (!righty) {
						--toAdjust;
					} else {
						toAdjust -= 40;
					}
					
					moved = true;
				}
				
				distAbs -= 8;
				
			}
			
			if (moved) mouseStart = new Point(Main.rootScene.mouseX, Main.rootScene.mouseY);
			
		}
	}
	
	function updateSim():Void 
	{
		if (toAdjust > 0) {
			if (toAdjust <= 40) {
				Main.simulation.stepSim();
				--toAdjust;
			} else {
				for (a in 0...40) {
					Main.simulation.stepSim();
					--toAdjust;
				}
			}
		} else {
			if (Main.simulation.frames > 0) {
				if (toAdjust >= -40) {
					Main.simulation.backSim();
					++toAdjust;
				} else {
					for (a in 0...40) {
						Main.simulation.backSim();
						++toAdjust;
					}
				}
			} else if (Main.simulation.frames == 0) {
				toAdjust = 0;
			}
			
		}
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