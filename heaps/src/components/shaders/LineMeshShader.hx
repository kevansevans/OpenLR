package components.shaders;

import hxsl.Shader;
import hxd.Res;

/**
 * ...
 * @author Kaelan
 */
class LineMeshShader extends Shader 
{

	static  var SRC =
	{
		@input var input : {
			var position : Vec3;
			var uv : Vec2;
			var normal : Vec3;
		};
		
		var output : {
			var position : Vec4;
			var color : Vec4;
			var depth : Float;
		};
		
		@const var editMode:Bool = true;
		@const var showTangible:Bool = true;
		@const var showScenery:Bool = true;
		
		@const var dragMode:Bool = false;
		
		@param var offset:Vec2 = vec2(0, 0);
		@param var scale:Vec2;
		@param var zoom:Float;
		
		@param var lineCap:Sampler2D;
		@param var accelFlag:Sampler2D;
		
		function vertex()
		{
			var tangible:Int = int(input.normal.z) & (1 << 2);
			if (tangible != (1 << 2))
			{
				output.position.z = 0.1;
			} else {
				output.position.z = 0.0;
			}
		}
		
		function fragment()
		{
			output.color = vec4(0, 0, 0, 1);
			
			var distance:Float = input.position.z;
			var lineType:Int = int(input.normal.y);
			var shifted:Int = int(input.normal.z) & 1;
			var flag:Int = int(input.normal.z) & (1 << 1);
			var tangible:Int = int(input.normal.z) & (1 << 2);
			
			//For encoding color data when layers and layer colors are implemented.
			/*var pbColor:Vec4 = vec4(0, 0, 0, 1);
			var inColor = int(input.position.z);
			
			pbColor.r = float((inColor >> 16) & 0xFF) / 255;
			pbColor.g = float((inColor >> 8) & 0xFF);
			pbColor.b = float((inColor & 0xFF)) / 255;*/
			
			if (!showScenery && tangible == 0) discard;
			if (!showTangible && tangible == 4) discard;
			
			var lineTypeColor:Vec4 = vec4(0, 0, 0, 1);
			
			if (!editMode)
			{
				lineTypeColor = vec4(0, 0, 0, 1);
			}
			else {
				if (lineType == 0)
				{
					var G:Float = float(0x66) / float(255);
					lineTypeColor = vec4(0, G, 1, 1);
				}
				else if (lineType == 1)
				{
					var R:Float = float(0xCC) / float(255);
					lineTypeColor = vec4(R, 0, 0, 1);
				}
				else if (lineType == 2)
				{
					var G:Float = float(0xCC) / float(255);
					lineTypeColor = vec4(0, G, 0, 0.5);
				}
				else {
					lineTypeColor = vec4(1, 0, 0, 0.5);
				}
			}
			
			if (flag == (1 << 1))
			{
				if (editMode) {
					if (shifted == 1) { 
						var loc = accelFlag.get(input.uv);
						if (loc.a == 0) discard;
						if (input.uv.y > 0.2) output.color = lineTypeColor;
					} else {
						var loc = accelFlag.get(vec2(input.uv.x, 1 - input.uv.y));
						if (loc.a == 0) discard;
						if (input.uv.y < 0.8) output.color = lineTypeColor;
					}
				} else {
					discard;
				}
			}
			else 
			{
				if (tangible == 4) {
					if (shifted != (1) && input.uv.y < 0.5) output.color = lineTypeColor;
					else if (shifted == (1) && input.uv.y > 0.5) output.color = lineTypeColor;
				} else {
					output.color = lineTypeColor;
				}
				
				var pos = vec2(input.uv.x * (distance + 2), input.uv.y * 2);
				if (pos.x < 1)
				{
					var relativeUV:Vec2 = vec2((pos.x / 2), input.uv.y);
					var loc = lineCap.get(relativeUV);
					if (loc.a == 0) discard;
				} 
				else if (pos.x > input.normal.x + 1)
				{
					var relativeUV:Vec2 = vec2((distance + 2 - pos.x) / 2, input.uv.y);
					var loc = lineCap.get(relativeUV);
					if (loc.a == 0) discard;
				}
				
				if (dragMode)
				{
					if (pos.x < 2) 
					{
						var relativeUV:Vec2 = vec2((pos.x / 2), input.uv.y);
						var loc = lineCap.get(relativeUV);
						if (loc.r == 1) output.color = vec4(1, 1, 1, 1);
					}
					else if (pos.x > input.normal.x)
					{
						var relativeUV:Vec2 = vec2((input.normal.x + 2 - pos.x) / 2, input.uv.y);
						var loc = lineCap.get(relativeUV);
						if (loc.r == 1) output.color = vec4(1, 1, 1, 1);
					}
				}
			}
		}
	}
	
	public function new()
	{
		super();
		
		this.lineCap = Res.lineCap.toTexture();
		this.accelFlag = Res.accelFlag.toTexture();
	}
	
}