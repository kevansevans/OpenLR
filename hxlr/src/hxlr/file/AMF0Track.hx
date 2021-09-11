package hxlr.file;

import haxe.io.Bytes;

/**
 * ...
 * @author Kaelan
 * 
 * Code to read the .sol format for line rider tracks
 */
 
class AMF0Track 
{

	var data:Bytes;
	
	var pos:Int = 0;
	var size:Int;
	var header:Int;
	
	var object:Dynamic = {};
	
	var loadedSOL:Beta2Save;
	
	public function new(_sol:Bytes) 
	{
		data = _sol;
		
		header = data.get(pos) << 8 | data.get(pos += 1);
		size = data.get(pos += 1) << 24 | data.get(pos += 1) << 16 | data.get(pos += 1) << 8 | data.get(pos += 1);
		
		if (size > data.length) {
			trace("Internal size value greater than file size!");
			return;
		}
		
		var tcso:String = data.getString(pos += 1, 4);
		if (tcso.toUpperCase() != "TCSO") {
			trace("Not a valid .sol/AMF0 file!", tcso);
			return;
		}
		pos += 11;
		
		var saveNameSize = data.get(pos);
		var saveNameField = data.getString(pos += 1, saveNameSize);
		if (saveNameField != "savedLines") {
			trace(saveNameSize, saveNameField);
			trace("Unable to locate savedLines!");
			return;
		}
		pos += saveNameSize + 4;
			
		var trackListNameSize = data.get(pos) << 8 | data.get(pos += 1);
		var trackListField = data.getString(pos += 1, trackListNameSize);
		
		if (trackListField != "trackList") {
			trace(trackListNameSize, trackListField);
			trace("Unable to locate trackList!");
			return;
		}
		
		loadedSOL = {
			trackList : []
		}
		
		recursiveRead(data.get(pos += trackListNameSize));
		
	}
	
	function recursiveRead(_code:Int) 
	{
		switch (_code) {
			
			case EMCA_ARRAY :
				
		}
	}
	
	public function loadSOLTrack(_index:Int):Beta2Track
	{
		return { };
	}
}

typedef Beta2Save = {
	var trackList:Array<Beta2Track>;
}

typedef Beta2Track = {
	
}

enum abstract ValidFields(String) to String {
	var data;
	var label;
	var startLine;
	var trackList;
}

enum abstract DataType(Int) to Int
{
	var NUMBER;
	var BOOLEAN;
	var STRING;
	var OBJECT;
	var MOVIECLIP;
	var NULL;
	var UNDEFINED;
	var REFERENCE;
	var EMCA_ARRAY;
	var OBJECTEND;
	var STRICT_ARRAY;
	var DATE;
	var LONG_STRING;
	var UNSUPPORTED;
	var RECORDSET;
	var XML_DOCUMENT;
	var TYPED_OBJECT;
	var AVMPLUS_OBJECT;
}