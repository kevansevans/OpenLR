package hxlr.export;

import haxe.Json;

import hxlr.engine.Grid;
import hxlr.lines.LineObject.LineStruct;

/**
 * ...
 * @author Kaelan
 */
class JSONFile 
{

	static function save():String
	{
		var lines:Array<LineStruct> = new Array();
		
		var save:SaveStruct = {
			lines : lines
		};
		
		var json = Json.stringify(save);
		return json;
	}
	
}

typedef SaveStruct = {
	var lines:Array<LineStruct>;
}