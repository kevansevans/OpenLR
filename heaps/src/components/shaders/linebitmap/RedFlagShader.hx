package components.shaders.linebitmap;

import hxsl.Shader;

/**
 * ...
 * @author Kaelan
 * 
 * older code, need to replace/remove
 */

class RedFlagShader extends Shader
{
	static var SRC = {
		
		@global var render : {
			var mode:Int;
		}
		
		function vertex() {
			calculatedUV = input.uv;
		}
		
		@:import h3d.shader.Texture;
		
		function fragment() {
			
			if (render.mode == 1) discard;
			
			else {
				
				var uv:Vec2 = calculatedUV;
				
				if (uv.x + uv.y > 1) discard;
				
			}
			
		}
	}
}