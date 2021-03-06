package hxlr.rider;

import hxlr.math.Point;

/**
 * ...
 * @author Kaelan
 */
class RiderBase
{

	public var startPos:Point;
	public var startVel:Point;
	public var gravity:Point;
	
	public var contactPoints:Array<ContactPoint>;
	public var airPoints:Array<AirPoint>;
	
	public var constraints:Array<Stick>;
	public var scarves:Array<Stick>;
	
	public var scaleDown:Float = 0.5;
	
	public var crashed(default, set):Null<Bool> = false;
	public var invincible:Bool = false;
	
	public var enabledFrame:Null<Int>;
	public var disableFrame:Null<Int>;
	public var enabled:Bool = true;
	
	public var focusPoint:ContactPoint;
	
	public var name:String;
	
	public function new() {
		
		startPos = new Point(0, 0);
		
		contactPoints = new Array();
		airPoints = new Array();
		
		constraints = new Array();
		scarves = new Array();
	}
	
	public function init() {}
	public function reset() {}
	public function step() {}
	public function iterate() {}
	public function constrain() {}
	public function constrainScarf() {}
	public function collide() {}
	public function renderRider() {};
	
	public function delete() {}
	
	public function set_crashed(_value:Bool):Bool
	{
		if (invincible) return crashed = null;
		return crashed = _value;
	}
	
}