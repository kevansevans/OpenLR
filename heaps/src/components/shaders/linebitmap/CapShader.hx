package components.shaders.linebitmap;

import hxsl.Shader;

/**
 * ...
 * @author Kaelan
 * 
 * older code, need to replace/remove
 */
class CapShader extends Shader
{
	static var SRC = {
		
		@:import h3d.shader.Texture;
		
		@param var lineLength:Float = 0;
		@param var cap:Int = 1;
		@param var dirDependant:Int = 0;
		
		function vertex() {
			calculatedUV = input.uv;
		}
		
		function fragment() {
			
			var uv:Vec2 = calculatedUV;
			var size:Vec2 = vec2(lineLength, 2);
			
			var pos = uv * size;
			
			if (cap == 1) {
				if (pos.x < 1 && length(pos - vec2(1, 1)) > 1) discard;
				if (pos.x > lineLength - 1 && length(pos - vec2(lineLength - 1, 1)) > 1) discard;
			}
			
			if (dirDependant != 0) {
				
				
				
			}
		}
	}
}