package components.shaders;

import h3d.Engine;
import hxsl.Shader;
import hxsl.Types.Vec;

/**
 * ...
 * @author Kaelan
 * 
 * Handles normalizing meshes so they look appropriate
 * 
 */
class ScaleShader extends Shader 
{
	static var SRC = {
		
		@param var offset:Vec2 = vec2(0, 0);
		@param var scale:Vec2;
		@param var zoom:Float;
		
		@input var input : {
			var position : Vec3;
		}
		
		var output : {
			var position : Vec4;
		};
		
		var relativePosition:Vec3;
		
		function __init__() {
			relativePosition = vec3(input.position.xy, 0);
		}
		
		function vertex()
		{
			output.position.xy *= scale;
			output.position.xy *= zoom;
			output.position.xy += offset;
		}
	}
	
	public function new() 
	{
		super();
	}
	
	public function update(_engine:Engine)
	{
		//magic number bullshit
		var magicRatio:Float = 2.25535;
		
		var xOffset:Float = (Main.canvas.x / Main.canvas.scaleX - (_engine.width / 2 / Main.canvas.scaleX)) / (_engine.width / 2 / Main.canvas.scaleX);
		var yOffset:Float = -(Main.canvas.y / Main.canvas.scaleX - (_engine.height / 2 / Main.canvas.scaleX)) / (_engine.height / 2 / Main.canvas.scaleX);
		
		this.offset = new Vec(xOffset, yOffset);
		
		if (_engine.width >= _engine.height)
		{
			this.scale = new Vec(1 / (_engine.height * magicRatio), 1 / (_engine.height * magicRatio));
		}
		else
		{
			this.scale = new Vec(1 / (_engine.width * magicRatio), 1 / (_engine.width * magicRatio));
		}
		
		this.zoom = Main.canvas.scaleX;
	}
	
}