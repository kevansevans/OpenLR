package hxlr.file;

import haxe.Json;
import hxlr.file.Track;
import hxlr.math.geom.Line;

/**
 * ...
 * @author Kaelan
 */
class JSONReader 
{
	public static function fromString(_json:String):Track
	{
		var track:Track = Json.parse(_json);
		return track;
	}
	
	public static function toString(_track:Track):String
	{
		return Json.stringify(_track, '/n');
	}
}