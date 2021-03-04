package components.lines;

import hxlr.scripts.PhysFloor;

import hxlr.components.ContactPoint;

import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class Floor extends LineBase 
{
	
	public function new(_start:Point, _end:Point, _shift:Bool) 
	{
		super(_start, _end, _shift);
		
		type = FLOOR;
	}
	
	override public function collide(_point:ContactPoint):Void 
	{
		
		PhysFloor.interp.variables.set("dx", dx);
		PhysFloor.interp.variables.set("dy", dy);
		PhysFloor.interp.variables.set("nx", nx);
		PhysFloor.interp.variables.set("ny", ny);
		PhysFloor.interp.variables.set("start", start);
		PhysFloor.interp.variables.set("end", end);
		PhysFloor.interp.variables.set("invSqrDistance", invSqrDistance);
		PhysFloor.interp.variables.set("zone", zone);
		PhysFloor.interp.variables.set("limStart", limStart);
		PhysFloor.interp.variables.set("limEnd", limEnd);
		PhysFloor.interp.variables.set("_point", _point);
		
		PhysFloor.interp.execute(PhysFloor.program);
		
	}
	
}