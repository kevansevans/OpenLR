package components.stage;

import h3d.Camera;
import h3d.Engine;
import h3d.Matrix;
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
import h3d.shader.LineShader;
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
	public var uvs:Array<UV>;
	
	public function new(_scene:Scene) 
	{
		super();
		
		s3d = _scene;
		camera = s3d.camera;
		
		pointMap = new Map();
		points = new Array();
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
		
		quad = new Quads(points, uvs);
		quad.addNormals();
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
		
		camera.pos = new Vector(-Main.canvas.x + 1, Main.canvas.y + 1, -1000);
		camera.target = new Vector( -Main.canvas.x + 1, Main.canvas.y + 1, 1);
		//camera.zoom = -1000;
		
		screen.scale = new Vec(1 / _engine.width / 2, 1 / _engine.height / 2);
	}
	
}

class CanvasShader extends Shader
{
	
	static  var SRC =
	{
		@:import h3d.shader.BaseMesh;
		
		@param var scale:Vec2;
		
		function vertex()
		{
			//output.position.xy *= scale;
		}
		
		function fragment()
		{
		
		}
	}
	
	public function new()
	{
		super();
	}
}