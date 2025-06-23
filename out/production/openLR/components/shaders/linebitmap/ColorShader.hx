package components.shaders.linebitmap;

import hxsl.Shader;
import hxsl.Types.Vec;

/**
 * ...
 * @author Kaelan
 * 
 * older code, need to replace/remove
 */

class ColorShader extends Shader
{
	
	static var SRC = {
		
		@global var render : {
			var mode:Int;
		}
		
		@:import h3d.shader.Texture;
		
		@param var editColor:Vec3 = vec3(1, 0, 0);
		@param var playColor:Vec3 = vec3(0, 0, 0);
		@param var editMode:Int = 0;
		@param var inv:Int = 0;
		
		function vertex() {
			calculatedUV = input.uv;
		}
		
		function fragment() {
			
			var uv:Vec2 = calculatedUV;
			
			pixelColor = vec4(playColor, 1);
			if (render.mode == 0) {
				
				if (editMode == 0) {
					
					if (inv == 0) {
						
						if (uv.y > 0.5) {
							pixelColor = vec4(editColor, 1);
						}
						
					} else {
						
						if (uv.y < 0.5) {
							pixelColor = vec4(editColor, 1);
						}
						
					}
					
				} else {
					pixelColor = vec4(editColor, 0.25);
				}
				
			} else {
				pixelColor = vec4(playColor, 1);
			}
			
		}
	}
	
	public function new(_editColor:Vec, _editMode:Int = 0, ?_playColor:Vec = null)
	{
		super();
		
		this.editColor = _editColor;
		this.editMode = _editMode;
		this.playColor = _playColor == null ? new Vec() : _playColor;
	}
	
	static function set_drawMode(value:Int):Int 
	{
		@:PrivateAccess Main.rootScene.renderer.globals.set("render.mode", value);
		return drawMode = value;
	}
	
	public static var drawMode(default, set):Int;
	
}