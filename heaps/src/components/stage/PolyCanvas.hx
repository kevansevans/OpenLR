package components.stage;
import h3d.Vector;
import h3d.col.Point;
import h3d.mat.Texture;
import h3d.prim.Cube;
import h3d.prim.Polygon;
import h3d.prim.Sphere;
import h3d.prim.UV;
import h3d.scene.Mesh;
import h3d.scene.Object;
import h3d.scene.Scene;
import hxsl.Shader;

import hxd.Res;

/**
 * ...
 * @author Kaelan
 */
class PolyCanvas extends Object
{
	
	var stage:Scene;
	var cube:Cube;
	var mesh:Mesh;
	var lineTexture:Texture;
	
	static var shader:LRCanvasShader;
	
	public function new(_parent:Scene) 
	{
		super(_parent);
		
		stage = _parent;
		
		stage.camera.up = new Vector(0, -1, 0, 0);
		stage.camera.pos = new Vector(0, 0, -1);
		//stage.camera.target = new Vector(0, 0, 1);
		
		var line:PolyLine = new PolyLine(new Point(-0.5, 0), new Point(0.5, 0));
		line.addNormals();
		
		mesh = new Mesh(line, null, this);
		
		lineTexture = Res.lines.lineBlue.toTexture();
		mesh.material.texture = lineTexture;
		
		shader = new LRCanvasShader();
		shader.texture = lineTexture;
		mesh.material.mainPass.addShader(shader);
	}
	
	var delta:Float = 0;
	public function update(_delta:Float) {
		
		delta += _delta;
		
		//shader.xpos = Math.sin(delta) * 0.1;
		//shader.ypos = Math.cos(delta) * 0.1;
		
	}
}

class PolyLine extends Polygon
{
	static inline var ratio:Float = 0.05;
	
	var locpoints:Array<Point>;
	
	public function new(_start:Point, _end:Point) {
		
		locpoints = new Array();
		
		//left top tri;
		
		locpoints.push(new Point(_start.x - 0.1, _start.y - 0.1, -0.01));
		locpoints.push(new Point(_start.x + 0.1, _start.y - 0.1, -0.01));
		locpoints.push(new Point(_start.x - 0.1, _start.y + 0.1, -0.01));
		
		//left bottom tri
		
		locpoints.push(new Point(_start.x + 0.1, _start.y - 0.1, -0.01));
		locpoints.push(new Point(_start.x + 0.1, _start.y + 0.1, -0.01));
		locpoints.push(new Point(_start.x - 0.1, _start.y + 0.1, -0.01));
		
		//right top tri
		
		locpoints.push(new Point(_end.x - 0.1, _end.y - 0.1, -0.01));
		locpoints.push(new Point(_end.x + 0.1, _end.y - 0.1, -0.01));
		locpoints.push(new Point(_end.x - 0.1, _end.y + 0.1, -0.01));
		
		//right bottom tri
		
		locpoints.push(new Point(_end.x + 0.1, _end.y - 0.1, -0.01));
		locpoints.push(new Point(_end.x + 0.1, _end.y + 0.1, -0.01));
		locpoints.push(new Point(_end.x - 0.1, _end.y + 0.1, -0.01));
		
		//mid top tri
		
		locpoints.push(new Point(_start.x + 0.1, _start.y - 0.1, -0.01));
		locpoints.push(new Point(_end.x - 0.1, _end.y - 0.1, -0.01));
		locpoints.push(new Point(_start.x + 0.1, _start.y + 0.1, -0.01));
		
		//mid bottom tri
		
		locpoints.push(new Point(_end.x - 0.1, _end.y - 0.1, -0.01));
		locpoints.push(new Point(_end.x - 0.1, _end.y + 0.1, -0.01));
		locpoints.push(new Point(_start.x + 0.1, _start.y + 0.1, -0.01));
		
		for (point in locpoints) {
			//point.x *= ratio;
			//point.y *= ratio;
		}
		
		super(locpoints);
		
		uvs = [
			//left top
			new UV(0, 0),
			new UV(0.25, 0),
			new UV(0, 1),
			
			//left bottom
			new UV(0.25, 0),
			new UV(0.25, 1),
			new UV(0, 1),
			
			//right top
			new UV(0.25, 0),
			new UV(0.5, 0),
			new UV(0.25, 1),
			
			//right bottom
			new UV(0.5, 0),
			new UV(0.5, 1),
			new UV(0.25, 1),
			
			//mid top
			new UV(0.25, 0),
			new UV(0.25, 0),
			new UV(0.25, 1),
			
			//mid bottom
			new UV(0.25, 0),
			new UV(0.25, 1),
			new UV(0.25, 1),
		];
		
		for (uv in uvs) {
			uv.u += 0.5;
		}
		
	}
}

class LRCanvasShader extends Shader 
{
	
	public function new() {
		
		super();
		
	}
	
	static var SRC = {
		
		@:import h3d.shader.Texture;
		
		@global var global : {
			var time : Float;
		};
		
		@param var xpos:Float;
		@param var ypos:Float;
		
		@param var texture:Sampler2D;
		
		@param var mode:Int = 0;
		
		var relativePosition:Vec3;
		
		function vertex() {
			relativePosition.z = cos(global.time) * 0.1;
			
			calculatedUV = input.uv;
		}
		
		function fragment() {
			
			if (texture.get(calculatedUV).a == 0) {
				discard;
				return;
			}
			
			if (mode == 0) {
				calculatedUV.x += 0.5;
			} else {
				
			}
		}
	}
	
}