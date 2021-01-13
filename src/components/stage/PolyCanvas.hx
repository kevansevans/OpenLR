package components.stage;
import h3d.Vector;
import h3d.col.Point;
import h3d.prim.Cube;
import h3d.prim.Polygon;
import h3d.prim.Sphere;
import h3d.scene.Mesh;
import h3d.scene.Object;
import h3d.scene.Scene;

/**
 * ...
 * @author Kaelan
 */
class PolyCanvas extends Object
{
	
	var stage:Scene;
	
	public function new(_parent:Scene) 
	{
		super(_parent);
		
		stage = _parent;
		
		stage.camera.up = new Vector(0, 0, 1, 1);
		
		var cube:Cube = new Cube();
		var mesh:Mesh = new Mesh(cube, null, this);
	}
	
	
}
