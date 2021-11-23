package components.stage;

import components.shaders.LineMeshShader;
import components.shaders.ScaleShader;
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
import components.stage.Canvas.DrawMode;

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
	
	public var lineShader:LineMeshShader;
	
	public var pointMap:Map<LineObject, Array<Point>>;
	public var normalMap:Map<LineObject, Array<Point>>;
	public var points:Array<Point>;
	public var normals:Array<Point>;
	public var uvs:Array<UV>;
	
	@:isVar public var drawMode(get, set):DrawMode = FULL_EDIT;
	
	public function new(_scene:Scene) 
	{
		super();
		
		s3d = _scene;
		camera = s3d.camera;
		
		pointMap = new Map();
		normalMap = new Map();
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
		
		lineShader = new LineMeshShader();
	}
	
	public function addLine(_line:LineObject)
	{
		//Per vertex:
		//x y = line position
		//z = lineDistance
		
		pointMap[_line] = new Array();
		normalMap[_line] = new Array();
		
		var s = Math.sin(_line.angle);
		var c = Math.cos(_line.angle);
		
		var tl:Point = new Point( -1, -1, _line.distance);
		var tr:Point = new Point( _line.distance + 1, -1, _line.distance);
		var bl:Point = new Point( -1, 1, _line.distance);
		var br:Point = new Point( _line.distance + 1, 1, _line.distance);
		
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
				var npoint = new Point(_line.distance, _line.type, flags | LineFlag.FLAG);
				normals.push(npoint);
				normalMap[_line].push(npoint);
			} else {
				var npoint = new Point(_line.distance, _line.type, flags);
				normals.push(npoint);
				normalMap[_line].push(npoint);
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
		
		for (point in normalMap[_line])
		{
			normals.remove(point);
		}
		
		pointMap.remove(_line);
		normalMap.remove(_line);
	}
	
	public function updateMesh()
	{
		if (s3d.contains(mesh)) s3d.removeChild(mesh);
		
		quad = new Quads(points, null, normals);
		quad.addUVs();
		
		mesh = new Mesh(quad);
		s3d.addChild(mesh);
		
		mesh.material.mainPass.addShader(Main.scaleShader);
		mesh.material.mainPass.addShader(lineShader);
		mesh.material.blendMode = BlendMode.Alpha;
		mesh.material.mainPass.culling = Face.None;
	}
	
	function get_drawMode():DrawMode 
	{
		return drawMode;
	}
	
	public function set_drawMode(_mode:DrawMode):DrawMode 
	{
		switch (_mode) {
			
			case FULL_EDIT :
				
				lineShader.editMode = true;
				lineShader.showTangible = true;
				lineShader.showScenery = true;
				
			case PLAYBACK :
				
				lineShader.editMode = false;
				lineShader.showTangible = true;
				lineShader.showScenery = true;
				
			case NO_SCENERY_EDIT :
				
				lineShader.editMode = true;
				lineShader.showTangible = true;
				lineShader.showScenery = false;
				
			case NO_SCENERY_PLAYBACK :
				
				lineShader.editMode = false;
				lineShader.showTangible = true;
				lineShader.showScenery = false;
				
			case SCENERY_EDIT :
				
				lineShader.editMode = true;
				lineShader.showTangible = false;
				lineShader.showScenery = true;
				
			case SCENERY_PLAYBACK :
				
				lineShader.editMode = false;
				lineShader.showTangible = false;
				lineShader.showScenery = true;
				
		}
		
		Main.textinfo.align();
		
		return drawMode = _mode;
	}
	
}

class CanvasShader extends Shader
{
	
	
}