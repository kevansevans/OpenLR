package components.sledder;
import components.managers.Grid;
import components.physics.RidePoint;
import components.physics.ScarfStick;
import components.physics.Stick;
import h2d.Anim;
import h2d.Bitmap;
import h2d.Graphics;
import h2d.HtmlText;
import h2d.Object;
import h2d.Tile;
import h2d.col.Point;
import h3d.Vector;
import haxe.PosInfos;
import haxe.io.Bytes;
import hxd.PixelFormat;
import hxd.Pixels;
import hxd.res.DefaultFont;
import hxd.Res;

/**
 * ...
 * @author Kaelan
 */
class RiderBase 
{
	public var ridePoints:Array<RidePoint>;
	public var scarfPoints:Array<RidePoint>;
	
	public var colorA(get, null):Int;
	public var colorB(get, null):Int;
	public var neckscarf:RiderScarf;
	
	public var bones:Array<Stick>;
	public var scarves:Array<ScarfStick>;
	
	public var gfx:Graphics;
	
	public var nameField:HtmlText;
	
	public var gravity:Point = new Point(0, 0.175);
	
	public var invincible:Bool = false;
	public var crashed(default, set):Null<Bool> = false;
	public var undead:Bool = false;
	
	public var startPos:Point = new Point();
	
	@:isVar public var name(get, set):String;
	
	public var drawContactPoints:Bool = true;
	
	public var enabledFrame:Null<Int>;
	public var disableFrame:Null<Int>;
	public var enabled:Bool = true;
	
	public var cameraPoint:RidePoint;
	
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
		scarves = new Array();
		
		enabledFrame = _enable;
		disableFrame = _disable;
	}
	
	public function init() {}
	public function reset() {}
	
	public function moveToStart() {
		
		for (point in ridePoints) {
			point.pos.x += startPos.x;
			point.pos.y += startPos.y;
			point.vel.x = point.pos.x - 0.4;
			point.vel.y = point.pos.y;
		}
		
		for (point in scarfPoints) {
			point.pos.x += startPos.x;
			point.pos.y += startPos.y;
			point.vel.x = point.pos.x - 0.4;
			point.vel.y = point.pos.y;
		}
	}
	
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
				constrainScarf();
			}
		}
	}
	
	public function constrainScarf():Void 
	{
		for (edge in scarves) {
			edge.satisfy(crashed);
		}
	}
	
	public function iterate() {
		for (point in ridePoints) {
			point.step(gravity);
		}
		for (point in scarfPoints) {
			point.step(gravity);
		}
	}
	
	public function constrainBones() 
	{
		for (edge in bones) {
			edge.satisfy(crashed);
		}
	}
	
	public function setColor(?_a:Null<Int>, ?_b:Null<Int>) {
		
		neckscarf.setColor(_a, _b);
		
	};
	
	public function collision() {
		for (point in ridePoints) {
			var gridPos = Grid.registryPosition(point.pos.x, point.pos.y);
			for (_x in -1...2) for (_y in -1...2) {
				var key = 'x${_x + gridPos.x}y${_y + gridPos.y}';
				if (Main.grid.registry[key] == null) continue;
				else {
					var register = Main.grid.registry[key];
					for (line in register.colliders) {
						
						if (line == null) continue;
						
						line.collide(point);
					}
				}
			}
		}
	}
	
	function get_name():String 
	{
		return name;
	}
	
	function get_colorA():Int 
	{
		return neckscarf.colorA;
	}
	
	function get_colorB():Int 
	{
		return neckscarf.colorB;
	}
	
	function set_name(value:String):String 
	{
		nameField.text = value;
		return name = value;
	}
	
	function set_crashed(value:Bool):Bool 
	{
		if (invincible) return crashed = null;
		return crashed = value;
	}
	
	public static var RiderNames = [
		"Bosh", "Bish", "Chaz", "Finn", "Coco", "Essi", 
		"Dorry", "Ella", "Blizzy", "Bailey", "Roh", "Sham", 
		"Bo", "The Forbidden One", "<######>", "Ranger", "Flynn",
		
	];
}

class RiderScarf extends Object {
	
	public var colorA:Null<Int> = 0x0A0A8;
	public var colorB:Null<Int>;
	
	var bitmap:Bitmap;
	var pixels:Pixels;
	
	public function new() {
		super();
		
		setColor();
	}
	
	public function setColor(?_a:Null<Int>, ?_b:Null<Int>):Void 
	{
		if (_a == null && _a == null) {
			var r = Std.int(0xFF * Main.rng.getRandomNormal());
			var g = Std.int(0xFF * Main.rng.getRandomNormal());
			var b = Std.int(0xFF * Main.rng.getRandomNormal());
			colorA = r << 16 | g << 8 | b;
		} else if (_a != null) {
			colorA = _a;
		}
		
		if (_b == null && _b == null) {
			var r = Std.int(0xFF * Main.rng.getRandomNormal());
			var g = Std.int(0xFF * Main.rng.getRandomNormal());
			var b = Std.int(0xFF * Main.rng.getRandomNormal());
			colorB = r << 16 | g << 8 | b;
		} else if (_b != null) {
			colorB = _b;
		}
		
		pixels = Pixels.alloc(40, 100, PixelFormat.ARGB);
		
		for (x in 0...40) for (y in 0...100) {
			if (y > 80) {
				pixels.setPixel(x, y, 0xFF << 24 | colorA);
			} else if (y > 60) {
				pixels.setPixel(x, y, 0xFF << 24 | colorB);
			} else if (y > 40) {
				pixels.setPixel(x, y, 0xFF << 24 | colorA);
			} else if (y > 20) {
				pixels.setPixel(x, y, 0xFF << 24 | colorB);
			} else {
				pixels.setPixel(x, y, 0xFF << 24 | colorA);
			}
		}
		
		bitmap = new Bitmap(Tile.fromPixels(pixels), this);
	}
	
}

class RiderPart extends Object {
	
	public var bitmap:Bitmap;
	public var anim:Anim;
	
	public function new (_part:BodyPart) {
		
		super();
		
		switch (_part) {
			case BODY :
				bitmap = new Bitmap(Res.rider.body.toTile(), this);
				bitmap.x = -2;
				bitmap.y = -62;
			case ARM :
				bitmap = new Bitmap(Res.rider.arm.toTile(), this);
				bitmap.x = -15;
				bitmap.y = -25;
			case LEG :
				bitmap = new Bitmap(Res.rider.leg.toTile(), this);
				bitmap.x = -15;
				bitmap.y = -38;
			case SLED :
				bitmap = new Bitmap(Res.rider.sled.toTile(), this);
				bitmap.x = -16;
				bitmap.y = -45.5;
			case EYE :
				anim = new Anim([
					Res.rider.eye0001.toTile(), //Open
					Res.rider.eye0002.toTile(), //Blink
					Res.rider.eye0003.toTile(), //Dead
				], 0, this);
				anim.loop = false;
				anim.x = 165;
				anim.y = 11;
		}
		
		if (_part != EYE) this.scale(0.05);
		
	}
	
}

enum BodyPart {
	BODY;
	ARM;
	LEG;
	SLED;
	EYE;
}

typedef RiderSave = {
	var name:String;
	var startPoint:Point;
	var startFrame:Null<Int>;
	var stopFrame:Null<Int>;
	var colora:Int;
	var colorb:Int;
}