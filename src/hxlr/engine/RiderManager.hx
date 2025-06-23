package hxlr.engine;

import hxlr.Common;
import hxlr.math.geom.Point;
import hxlr.rider.RiderBase;

/**
 * ...
 * @author Kaelan
 */
class RiderManager 
{
	public static var riderList:Array<RiderBase> = [];
	
	public static var riderCount:Int = 0;
	
	public function new() 
	{
		
	}
	
	public static function clearRiderList()
	{
		for (rider in riderList)
		{
			rider.delete();
			riderList.remove(rider);
		}
		
		riderList = new Array();
	}
	
	public static function addNewRider(_start:Point, _type:Class<RiderBase>)
	{
		var rider = Type.createInstance(_type, [Common.defaultRider(), _start]);
		rider.name = "Bosh";
		rider.id = riderCount;
		riderList.push(rider);
		
		++riderCount;
	}
	
	public static function deleteAllRiders()
	{
		for (rider in riderList)
		{
			removeRider(rider);
		}
		
		riderCount = 0;
	}
	
	public static function removeRider(_rider:RiderBase)
	{
		_rider.delete();
		riderList.remove(_rider);
	}
	
	public static function stepRiders()
	{
		for (rider in riderList)
		{
			rider.step();
		}
	}
	
	public static function resetRiders()
	{
		for (rider in riderList)
		{
			rider.reset();
			rider.refreshRider();
		}
	}
	
}