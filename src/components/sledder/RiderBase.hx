package components.sledder;
import components.managers.Grid;
import components.physics.RidePoint;
import components.physics.Stick;
import h2d.Graphics;
import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class RiderBase 
{
	public var ridePoints:Array<RidePoint>;
	public var scarfPoints:Array<RidePoint>;
	
	public var bones:Array<Stick>;
	
	public var gfx:Graphics;
	
	public var gravity:Point = new Point(0, 0.175);
	
	public var ENDURANCE = 0.057;
	
	public var crashed:Bool = false;
	
	public function new() 
	{
		gfx = new Graphics();
		
		ridePoints = new Array();
		
		bones = new Array();
		
		Main.canvas.sledderLayer.addChild(gfx);
	}
	
	public function init() {}
	public function reset() {}
	
	public function drawContactPoints() {
		gfx.clear();
		gfx.lineStyle(1, 0xCC00CC);
		for (dot in ridePoints) {
			gfx.drawCircle(dot.pos.x, dot.pos.y, 0.1, 5);
		}
	}
	
	public function iterate() {
		for (point in ridePoints) {
			point.step(gravity);
		}
	}
	
	public function constrainBones() 
	{
		for (edge in bones) {
			crashed = edge.satisfy(crashed);
		}
	}
	
	public function collision() {
		for (point in ridePoints) {
			var gridPos = Grid.registryPosition(point.pos.x, point.pos.y);
			for (_x in -1...2) for (_y in -1...2) {
				var key = 'x${_x + gridPos.x}y${_y + gridPos.y}';
				if (Main.grid.registry[key] == null) continue;
				else {
					for (line in Main.grid.registry[key].colliders) {
						line.collide(point);
					}
				}
			}
		}
	}
}