package hxlr.rider;

import components.sledder.RiderBase;

import hxlr.rider.ContactPoint;
import hxlr.rider.AirPoint;
import hxlr.enums.StickType;

import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */

class Stick 
{
	public var a:ContactPoint;
	public var b:ContactPoint;
	public var restLength:Float;
	
	public var enabled:Bool = true;
	public var breakable:Bool = false;
	public var broken:Bool = false;
	public var crashable:Bool = false;
	
	public var endurance:Float;
	
	public var constrain:Bool -> Bool;
	public var type(default, set):StickType;
	
	public var rider:RiderBase;
	
	
	public function new(_a:ContactPoint, _b:ContactPoint, _type:StickType, _rider:RiderBase) 
	{
		a = _a;
		b = _b;
		
		type = _type;
		
		rider = _rider;
		
		endurance = 0.057 * restLength * 0.5;
		
	}
	
	public function satisfy(?_crashed:Bool)
	{
		if (!enabled) return;
		
		var result = constrain(_crashed);
		
		if (breakable) {
			broken = result;
		}
		
		if (crashable) {
			rider.crashed = result;
		}
	}
	
	public function noConstrain(?_crashed:Bool):Bool 
	{
		return _crashed;
	}
	
	public function standard(?_crashed:Bool):Bool 
	{
		var xDist = a.pos.x - b.pos.x;
		var yDist = a.pos.y - b.pos.y;
		var dist = Math.sqrt(xDist * xDist + yDist * yDist);
		
		var adjust:Float = 0;
		if (dist != 0) adjust = (dist - restLength) / dist * 0.5;
		
		if (crashable || breakable) { //should we even check?
			if (!rider.invincible) { //are we invincible?
				if (adjust > endurance || _crashed || broken) { //are we even crashed?
					return true;
				}
			}
		}
		
		var xAdjust = xDist * adjust;
		var yAdjust = yDist * adjust;
		
		a.pos.x = a.pos.x - xAdjust;
		a.pos.y = a.pos.y - yAdjust;
		b.pos.x = b.pos.x + xAdjust;
		b.pos.y = b.pos.y + yAdjust;
		
		return _crashed;
	}
	
	public function repell(?_crashed:Bool):Bool
	{
		var xDist = a.pos.x - b.pos.x;
		var yDist = a.pos.y - b.pos.y;
		var dist = Math.sqrt(xDist * xDist + yDist * yDist);
		
		if (dist < restLength) {
			
			var adjust:Float = 0;
			if (dist != 0) adjust = (dist - restLength) / dist * 0.5;
			
			if (crashable || breakable) { //should we even check?
				if (!rider.invincible) { //are we invincible?
					if (adjust > endurance || _crashed || broken) { //are we even crashed?
						return true;
					}
				}
			}
			
			var xAdjust = xDist * adjust;
			var yAdjust = yDist * adjust;
			
			a.pos.x = a.pos.x - xAdjust;
			a.pos.y = a.pos.y - yAdjust;
			b.pos.x = b.pos.x + xAdjust;
			b.pos.y = b.pos.y + yAdjust;
		}
		
		return _crashed;
	}
	
	public function attract(?_crashed:Bool) {
		
		var xDist = a.pos.x - b.pos.x;
		var yDist = a.pos.y - b.pos.y;
		var dist = Math.sqrt(xDist * xDist + yDist * yDist);
		
		if (dist > restLength) {
			
			var adjust:Float = 0;
			if (dist != 0) adjust = (dist - restLength) / dist * 0.5;
			
			if (crashable || breakable) { //should we even check?
				if (!rider.invincible) { //are we invincible?
					if (adjust > endurance || _crashed || broken) { //are we even crashed?
						return true;
					}
				}
			}
			
			var xAdjust = xDist * adjust;
			var yAdjust = yDist * adjust;
			
			a.pos.x = a.pos.x - xAdjust;
			a.pos.y = a.pos.y - yAdjust;
			b.pos.x = b.pos.x + xAdjust;
			b.pos.y = b.pos.y + yAdjust;
		}
		
		return _crashed;
	}
	
	public function scarf(?_crashed:Bool):Bool 
	{
		var xDist = a.pos.x - b.pos.x;
		var yDist = a.pos.y - b.pos.y;
		var dist = Math.sqrt(xDist * xDist + yDist * yDist);
		
		var adjust:Null<Float> = null;
		if (dist == 0) adjust = 0;
		else adjust = (dist - restLength) / dist * 0.5;
		
		var xAdjust = xDist * adjust;
		var yAdjust = yDist * adjust;
		
		b.pos.x = b.pos.x + xAdjust;
		b.pos.y = b.pos.y + yAdjust;
		
		return _crashed;
	}
	
	function set_type(value:StickType):StickType 
	{
		
		setRestLength();
		
		if (value == REPELL || value == ATTRACT) restLength *= 0.5;
		
		switch (value) {
			
			case STANDARD :
				
				constrain = standard;
				
			case REPELL :
				
				constrain = repell;
				
			case SCARF :
				
				constrain = scarf;
				
			default :
				
				constrain = noConstrain;
				
		}
		return type = value;
	}
	
	function setRestLength():Void 
	{
		var x = a.pos.x - b.pos.x;
		var y = a.pos.y - b.pos.y;
		restLength = Math.sqrt(x * x + y * y);
	}
}