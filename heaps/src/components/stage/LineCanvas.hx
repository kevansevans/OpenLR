package components.stage;

import h3d.Camera;
import h3d.Engine;
import h3d.col.Point;
import h3d.scene.Scene;
import hxlr.engine.CanvasBase;
import h3d.prim.Quads;
import h3d.scene.Mesh;
import h3d.mat.Data.Face;
import h3d.Vector;
import hxlr.lines.LineObject;
import hxsl.Shader;
import h3d.prim.UV;
import hxsl.Types.Vec;

/**
 * ...
 * @author Kaelan
 */
class LineCanvas extends CanvasBase 
{

	var s3d:Scene;
	var quad:Quads;
	var mesh:Mesh;
	var camera:Camera;
	
	public var screen:CanvasShader;
	
	public var pointMap:Map<LineObject, Array<Point>>;
	public var points:Array<Point>;
	public var normals:Array<Point>;
	public var uvs:Array<UV>;
	
	public function new(_scene:Scene) 
	{
		super();
		
		s3d = _scene;
		camera = s3d.camera;
		
		pointMap = new Map();
		points = new Array();
		normals = new Array();
		uvs = new Array();
		
		camera.up = new Vector(0, 1, 0);
		camera.pos.set(0, 0, -1);
		
		var quad:Quads = new Quads([
			new Point( 0, 0, 0),
			new Point( 1, 0, 0),
			new Point( 0, 1, 0),
			new Point( 1, 1, 0),
		]);
		
		quad.addUVs();
		quad.addNormals();
		
		mesh = new Mesh(quad);
		
		s3d.addChild(mesh);
		
		screen = new CanvasShader();
	}
	
	public function addLine(_line:LineObject)
	{
		pointMap[_line] = new Array();
		
		var s = Math.sin(_line.angle);
		var c = Math.cos(_line.angle);
		
		var tl:Point = new Point( -1, -1);
		var tr:Point = new Point( _line.distance + 1, -1);
		var bl:Point = new Point( -1, 1);
		var br:Point = new Point( _line.distance + 1, 1);
		
		pointMap[_line].push(tl);
		pointMap[_line].push(tr);
		pointMap[_line].push(bl);
		pointMap[_line].push(br);
		
		for (point in pointMap[_line])
		{
			normals.push(new Point(_line.distance, _line.type, _line.shifted == true ? 0 : 1));
			
			var x:Float = point.x * c - point.y * s;
			var y:Float = point.x * s + point.y * c;
			
			point.x = x + _line.start.x;
			point.y = y + _line.start.y;
			point.y *= -1;
			
			points.push(point);
		}
		
	}
	
	public function removeLine(_line:LineObject)
	{
		if (pointMap[_line] == null) return;
		
		for (point in pointMap[_line])
		{
			points.remove(point);
		}
		
		pointMap[_line] = null;
	}
	
	public function updateMesh()
	{
		if (s3d.contains(mesh)) s3d.removeChild(mesh);
		
		quad = new Quads(points, null, normals);
		//quad.addNormals();
		quad.addUVs();
		
		mesh = new Mesh(quad);
		s3d.addChild(mesh);
		
		mesh.material.mainPass.addShader(screen);
		//mesh.material.mainPass.addShader(new LineShader(2));
		mesh.material.mainPass.culling = Face.None;
	}
	
	public function updateScreenScale(_engine:Engine, _scale:Float)
	{
		camera.screenRatio = _engine.width / _engine.height;
		
		screen.offset = new Vec(Main.canvas.x - (_engine.width / 2), -(Main.canvas.y - (_engine.height / 2)));
		
		if (_engine.width >= _engine.height)
		{
			screen.scale = new Vec((1 / _engine.height), (1 / _engine.height));
		}
		else
		{
			screen.scale = new Vec((1 / _engine.width), (1 / _engine.width));
		}
		
		screen.zoom = Main.canvas.scaleX;
		
	}
	
}

class CanvasShader extends Shader
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
		
		@param var offset:Vec2;
		@param var scale:Vec2;
		@param var zoom:Float;
		
		function vertex()
		{
			output.position.xy += (offset / zoom);
			output.position.xy *= scale;
			output.position.xy *= zoom;
		}
		
		function fragment()
		{
			output.color = vec4(0, 0, 0, 1);
			
			if (int(input.normal.y) == 0)
			{
				var G:Float = float(0x66) / float(255);
				if (input.normal.z == 0 && input.uv.y > 0.5) {
					output.color = vec4(0, G, 1, 1);
				} else if (input.normal.z == 1 && input.uv.y < 0.5) {
					output.color = vec4(0, G, 1, 1);	
				}
			}
			if (input.normal.y == 1)
			{
				var R:Float = float(0xCC) / float(255);
				if (input.normal.z == 0 && input.uv.y > 0.5) {
					output.color = vec4(R, 0, 0, 1);
				} else if (input.normal.z == 1 && input.uv.y < 0.5) {
					output.color = vec4(R, 0, 0, 1);	
				}
			}
			if (int(input.normal.y) == 2)
			{
				var G:Float = float(0xCC) / float(255);
				output.color = vec4(0, G, 0, float(0.5));
			}
			
			var pos = input.uv * vec2(input.normal.x, 2);
			
			if (input.normal.x > 2) {
				if (pos.x < 1 && length(pos - vec2(1, 1)) > 1) discard;
				else if (pos.x > input.normal.x - 1 && length(pos - vec2(input.normal.x - 1, 1)) > 1) discard;
			}
			
		}
	}
	
	public function new()
	{
		super();
	}
}