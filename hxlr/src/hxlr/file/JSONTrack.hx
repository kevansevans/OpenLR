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
}