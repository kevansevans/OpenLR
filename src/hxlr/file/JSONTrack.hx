package hxlr.file;

import haxe.Json;
import hxlr.file.TrackStruct;
import hxlr.math.geom.Line;

/**
 * ...
 * @author Kaelan
 */
class JSONTrack 
{
	public static function fromString(_json:String):TrackStruct
	{
		var track:TrackStruct = Json.parse(_json);
		return track;
	}
	
	public static function toString(_track:TrackStruct):String
	{
		
		return Json.stringify(_track, '/n');
	}
	
	public static function hxlrToJSON(_track:TrackStruct):String
	{
		return '';
	}
	
	static inline function flostToString(_value:Float):String
	{
		if (Math.isNaN(_value)) return "NaN";
		
		var sign:String = _value < 0 ? '-' : '';
		
		if (!Math.isFinite(_value)) return sign + "inf";
		
		return "0";
	}
}