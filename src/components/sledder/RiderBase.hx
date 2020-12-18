package components.sledder;
import components.managers.Grid;
import components.physics.RidePoint;
import components.physics.Stick;
import h2d.Graphics;
import h2d.HtmlText;
import h2d.col.Point;
import h3d.Vector;
import haxe.PosInfos;
import hxd.res.DefaultFont;

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
	
	public var nameField:HtmlText;
	
	public var gravity:Point = new Point(0, 0.175);
	
	public var ENDURANCE = 0.057;
	
	public var crashed:Bool = false;
	
	public var startPos:Point = new Point();
	
	@:isVar public var name(get, set):String;
	
	public var drawContactPoints:Bool = true;
	
	public var enabledFrame:Null<Int>;
	public var disableFrame:Null<Int>;
	public var enabled:Bool = true;
	
	static public var WHITE:Vector = new Vector(1, 1, 1, 1);
	static public var BLACK:Vector = new Vector(0, 0, 0, 1);
	static public var RED:Vector = new Vector(1, 0, 0, 1);
	
	public function new(?_x:Float = 0.0, ?_y:Float = 0.0, ?_name:String = "Bosh", ?_enable:Null<Int> = null, ?_disable:Null<Int> = null) 
	{
		startPos = new Point(_x, _y);
		
		gfx = new Graphics();
		Main.canvas.sledderLayer.addChild(gfx);
		nameField = new HtmlText(DefaultFont.get());
		Main.canvas.sledderLayer.addChild(nameField);
		
		name = _name;
		
		ridePoints = new Array();
		
		bones = new Array();
		
		enabledFrame = _enable;
		disableFrame = _disable;
	}
	
	public function init() {}
	public function reset() {}
	
	public function delete() {
		Main.canvas.sledderLayer.removeChild(gfx);
		Main.canvas.sledderLayer.removeChild(nameField);
		Main.riders.riders.remove(name);
		Main.riders.riderCount -= 1;
	}
	
	public function renderRider() {
		
		nameField.scaleX = nameField.scaleY = 1 * (1 / Main.canvas.scaleX);
		
		nameField.x = ridePoints[5].pos.x;
		nameField.y = ridePoints[5].pos.y;
		
		if (crashed) {
			nameField.color = RED;
		} else {
			nameField.color = WHITE;
		}
		
		if (!drawContactPoints) return;
		
		gfx.clear();
		gfx.lineStyle(1, 0xCC00CC);
		for (dot in ridePoints) {
			gfx.drawCircle(dot.pos.x, dot.pos.y, 0.1, 5);
		}
	}
	
	public function stepRider() {
		if (enabled) {
			if ((enabledFrame == null || Main.simulation.frames >= enabledFrame) && (disableFrame == null || Main.simulation.frames < disableFrame)) {
				iterate();
				for (iteration in 0...6) {
					constrainBones();
					collision();
				}
			}
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
					var register = Main.grid.registry[key];
					for (line in register.colliders) {
						line.collide(point);
					}
					if (register.lowFrame == null || Main.simulation.frames < register.lowFrame) register.lowFrame = Main.simulation.frames;
				}
			}
		}
	}
	
	function get_name():String 
	{
		return name;
	}
	
	function set_name(value:String):String 
	{
		nameField.text = value;
		return name = value;
	}
}

typedef RiderSave = {
	var name:String;
	var startPoint:Point;
	var startFrame:Null<Int>;
	var stopFrame:Null<Int>;
}