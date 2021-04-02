package hxlr.rider;

import haxe.PosInfos;
import hxlr.enums.StickType;
import hxlr.math.Point;
import hxlr.rider.AirPoint;
import hxlr.rider.ContactPoint;
import hxlr.rider.RiderStruct;
import hxlr.rider.Stick;
import hxlr.engine.Cell;

/**
 * ...
 * @author Kaelan
 */
class RiderBase
{
	var struct:RiderStruct;
	
	public var startPos:Point;
	public var startVel:Point;
	public var gravity:Point;
	
	public var contactPoints:Array<ContactPoint>;
	public var airPoints:Array<AirPoint>;
	
	public var constraints:Array<Stick>;
	public var scarves:Array<Stick>;
	
	public var limits:Array<FakieLimit>;
	
	public var crashed(default, set):Null<Bool> = false;
	public var invincible:Bool = false;
	
	public var enabledFrame:Null<Int>;
	public var disableFrame:Null<Int>;
	public var enabled:Bool = true;
	
	public var focusPoint:ContactPoint;
	
	public var name:String;
	
	public function new(_struct:RiderStruct, _start:Point, _name:String) {
		
		struct = _struct;
		startPos = _start;
		startVel = new Point(struct.x_vel, struct.y_vel);
		gravity = new Point(struct.x_grav, struct.y_grav);
		name = _name;
		
		init();
	}
	
	public function init() {
		
		contactPoints = new Array();
		for (dot in struct.contactPoints) {
			contactPoints.push(new ContactPoint(dot.x, dot.y, dot.fr));
		}
		
		airPoints = new Array();
		for (dot in struct.scarfPoints) {
			airPoints.push(new AirPoint(dot.x, dot.y, dot.fr));
		}
		
		for (point in contactPoints) {
			
			point.pos.x *= struct.scale;
			point.pos.y *= struct.scale;
			
			point.pos.x += startPos.x;
			point.pos.y += startPos.y;
			
			point.vel.x = point.pos.x - startVel.x;
			point.vel.y = point.pos.y;
			
		}
		
		for (point in airPoints) {
			
			point.pos.x *= struct.scale;
			point.pos.y *= struct.scale;
			
			point.pos.x += startPos.x;
			point.pos.y += startPos.y;
			
			point.vel.x = point.pos.x - startVel.x;
			point.vel.y = point.pos.y;
			
		}
		
		constraints = new Array();
		for (edge in struct.bones) {
			var stick:Stick = new Stick(contactPoints[edge.a], contactPoints[edge.b], edge.type, this);
			stick.crashable = edge.crashable;
			constraints.push(stick);
		}
		
		scarves = new Array();
		for (point in 0...airPoints.length) {
			if (airPoints[point + 1] == null) break;
			scarves.push(new Stick(airPoints[point], airPoints[point + 1], StickType.SCARF, this));
		}
		scarves.unshift(new Stick(contactPoints[struct.scarfAnchor], airPoints[0], StickType.SCARF, this));
		
		limits = struct.limits;
		
		focusPoint = contactPoints[struct.camera];
		
		crashed = false;
	}
	public function reset() {}
	
	public function step() {}
	
	public function iterate() {}
	
	public function checkLimits() {}
	
	public function constrain() {}
	
	public function constrainScarf() {}
	
	public function collide() {
		
		for (point in contactPoints) {
			var gridPos = Cell.getInfo(point.pos.x, point.pos.y);
			for (_x in -1...2) for (_y in -1...2) {
				var key:String = 'x${gridPos.x + _x}y${gridPos.y + _y}';
				if (Main.grid.registry[key] == null) continue;
				else {
					var register = Main.grid.registry[key];
					for (line in register.collidable) {
						
						if (line == null) continue;
						
						line.collide(point);
					}
				}
			}
		}
		
	}
	public function renderRider() {};
	
	public function set_crashed(_value:Bool):Bool
	{
		if (invincible) return crashed = null;
		return crashed = _value;
	}
	
}