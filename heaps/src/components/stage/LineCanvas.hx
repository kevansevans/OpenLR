package components.stage;

import h3d.Camera;
import h3d.Engine;
import h3d.col.Point;
import h3d.mat.BlendMode;
import h3d.scene.Scene;
import hxd.Res;
import hxlr.engine.CanvasBase;
import h3d.prim.Quads;
import h3d.scene.Mesh;
import h3d.mat.Data.Face;
import h3d.Vector;
import hxlr.lines.LineObject;
import hxsl.Shader;
import h3d.prim.UV;
import hxsl.Types.Vec;
import hxlr.enums.LineType;

/**
 * ...
 * @author Kaelan
 */
enum abstract LineFlag(Int) from Int to Int
{
	var SHIFTED:Int = 1; 					//is the line flipped?
	var FLAG:Int = 1 << 1;					//is the quad part of a directional dependant line?
	var TANGIBLE:Int = 1 << 2;				//Can this line be ridden?
}
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
		camera.target.set(0, 0, 1);
		//camera.zNear = -1;
		
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
		//Per vertex:
		//x y = line position
		//z = RGB color. Relative Z Position is set to 0 in shader.
		
		
		pointMap[_line] = new Array();
		
		var s = Math.sin(_line.angle);
		var c = Math.cos(_line.angle);
		
		var tl:Point = new Point( -1, -1, 0);
		var tr:Point = new Point( _line.distance + 1, -1, 0);
		var bl:Point = new Point( -1, 1, 0);
		var br:Point = new Point( _line.distance + 1, 1, 0);
		
		if (_line.directional)
		{
			if (_line.shifted)
			{
				pointMap[_line].push(new Point(br.x - 5, br.y - 5));
				pointMap[_line].push(new Point(br.x, br.y - 5));
				pointMap[_line].push(new Point(br.x - 5, br.y));
				pointMap[_line].push(new Point(br.x, br.y));
			}
			else
			{
				pointMap[_line].push(new Point(tr.x - 5, tr.y));
				pointMap[_line].push(new Point(tr.x, tr.y));
				pointMap[_line].push(new Point(tr.x - 5, tr.y + 5));
				pointMap[_line].push(new Point(tr.x, tr.y + 5));
			}
		}
		
		pointMap[_line].push(tl);
		pointMap[_line].push(tr);
		pointMap[_line].push(bl);
		pointMap[_line].push(br);
		
		var flags:Int = 0;
		if (_line.shifted) flags |= LineFlag.SHIFTED;
		if (_line.tangible) flags |= LineFlag.TANGIBLE;
		
		var count:Int = 0;
		for (point in pointMap[_line])
		{
			if (count < 4 && _line.type == ACCEL)
			{
				normals.push(new Point(_line.distance, _line.type, flags | LineFlag.FLAG));
			} else {
				normals.push(new Point(_line.distance, _line.type, flags));
			}
			
			var x:Float = point.x * c - point.y * s;
			var y:Float = point.x * s + point.y * c;
			
			point.x = x + _line.start.x;
			point.y = y + _line.start.y;
			point.y *= -1;
			
			points.push(point);
			
			++count;
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
		mesh.material.blendMode = BlendMode.Alpha;
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
		
			@const var dragMode:Bool = false;
		
		@param var offset:Vec2;
		@param var scale:Vec2;
		@param var zoom:Float;
		
		@param var lineCap:Sampler2D;
		@param var accelFlag:Sampler2D;
		
		var relativePosition:Vec3;
		
		function __init__() {
			relativePosition = vec3(input.position.xy, 0);
		}
		
		function vertex()
		{
			output.position.xy += (offset / zoom);
			output.position.xy *= scale;
			output.position.xy *= zoom;
		}
		
		function fragment()
		{
			output.color = vec4(0, 0, 0, 1);
			
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
			
			var lineTypeColor:Vec4 = vec4(0, 0, 0, 1);
			
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
			
			if (flag == (1 << 1))
			{
				if (shifted == 1) { 
					var loc = accelFlag.get(input.uv);
					if (loc.a == 0) discard;
					if (input.uv.y > 0.2) output.color = lineTypeColor;
				} else {
					var loc = accelFlag.get(vec2(input.uv.x, 1 - input.uv.y));
					if (loc.a == 0) discard;
					if (input.uv.y < 0.8) output.color = lineTypeColor;
				}
			}
			else 
			{
				if (tangible == (1 << 2))
				{
					if (shifted != (1) && input.uv.y < 0.5) output.color = lineTypeColor;
					else if (shifted == (1) && input.uv.y > 0.5) output.color = lineTypeColor;
				}
				else
				{
					output.color = lineTypeColor;
				}
				
				var pos = vec2(input.uv.x * (input.normal.x + 2), input.uv.y * 2);
				if (pos.x < 1)
				{
					var relativeUV:Vec2 = vec2((pos.x / 2), input.uv.y);
					var loc = lineCap.get(relativeUV);
					if (loc.a == 0) discard;
				} 
				else if (pos.x > input.normal.x + 1)
				{
					var relativeUV:Vec2 = vec2((input.normal.x + 2 - pos.x) / 2, input.uv.y);
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