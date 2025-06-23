package components.shaders;

import hxsl.Shader;

/**
 * ...
 * @author Kaelan
 */
class ScarfShader extends Shader
{
	public function new()
	{
		super();
	}
	
	static var SRC =
	{
		@:import h3d.shader.Texture;
		
		@param var colors:Array<Int, 5>;
		@param var step:Int = 2;
		
		function vertex() {
			calculatedUV = input.uv;
		}
		
		function fragment()
		{
			var uv:Vec2 = calculatedUV;
			var color:Vec4 = vec4(0, 0, 0, 0); 
			
			if (uv.y >= 0.8 && uv.y < 1) 
			{
				color = vec4(hexToVec3(colors[0]), 1);
			}
			if (uv.y >= 0.6 && uv.y < 0.8) 
			{
				color = vec4(hexToVec3(colors[1]), 1);
			}
			if (uv.y >= 0.4 && uv.y < 0.6) 
			{
				color = vec4(hexToVec3(colors[2]), 1);
			}
			if (uv.y >= 0.2 && uv.y < 0.4) 
			{
				color = vec4(hexToVec3(colors[3]), 1);
			}
			if (uv.y >= 0 && uv.y < 0.2) 
			{
				color = vec4(hexToVec3(colors[4]), 1);
			}
			
			pixelColor = color;
		}
		
		function hexToVec3(_value:Int):Vec3
		{
			var r:Float = (_value >> 16) & 0xFF;
			var g:Float = (_value >> 8) & 0xFF;
			var b:Float = _value & 0xFF;
			
			return vec3(r / 255, g / 255, b / 255);
		}
	}
}