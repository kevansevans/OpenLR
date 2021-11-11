package hxlr.file;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import hxlr.Common;
import hxlr.engine.Grid;
import hxlr.file.TrackStruct;
import hxlr.lines.Floor;
import hxlr.lines.Accel;
import hxlr.lines.Scenery;
import hxlr.lines.Slow;
import hxlr.lines.LineObject;
import hxlr.rider.RiderBase;
import hxlr.enums.LineType;
import hxlr.math.geom.Point;
import hxlr.enums.Physics;

/**
 * ...
 * @author Kaelan
 */
enum abstract LumpType(String) to String
{
	var LINEBASE; //For lines that need to maintain precision
	var LINEDECO; //For scenery lines where data can be culled
	var LINESPEC; //Data for special line properties
	
	var LAYERDEF; //Layer info
	
	var RIDERDEF; //Minimum rider data needed
	var RIDERMOD; //Non-Standard info for rider
	
	var TRACKDEF;
}
typedef Lump =
{
	type:String,
	position:Int,
}
class LRPKTrack 
{
	static var sceneryCompression:Bool = true;
	
	//To be implemented later
	static inline var saveVersion:Int = 0;
	
	public static function decode(_fileBytes:Bytes, ?_skipScenery:Bool = false):Null<TrackStruct>
	{
		var data = _fileBytes;
		var header = data.getString(0, 4);
		
		var track:TrackStruct;
		
		var label:String = "";
		var creator:String = "";
		var physics:String = "";
		
		var riders:Array<RiderStruct> = [];
		
		var layers:Array<LayerStruct> = [];
		
		var lineStructs:Array<LineStruct> = [];
		var line:LineStruct;
		
		
		if (header == "LRPK") //warning or something
		{
			var numItems = data.getInt32(4);
			var dirPosition = data.getInt32(8);
			
			for (item in 0...numItems)
			{
				var lump:Lump = {
					type : data.getString((item * 12) + dirPosition, 8),
					position : data.getInt32((item * 12) + dirPosition + 8)
				}
				
				switch (lump.type)
				{
					case LINEBASE :
						
						var pos:Int = lump.position;
						
						line = {
							id : data.getInt32(pos),
							x1 : data.getDouble(pos += 4),
							y1 : data.getDouble(pos += 8),
							x2 : data.getDouble(pos += 8),
							y2 : data.getDouble(pos += 8),
							type : data.get(pos += 8),
							flipped : data.get(pos += 1) == 1 ? true : false,
							leftExtended : null,
							rightExtended : null,
							multiplier : null,
							layer : null,
						}
						
						
						var limType:Int = data.get(pos += 1);
						
						switch (limType)
						{
							case 0:
								//nothing
							case 1:
								line.leftExtended = true;
								line.rightExtended = false;
							case 2:
								line.leftExtended = false;
								line.rightExtended = true;
							case 3:
								line.leftExtended = true;
								line.rightExtended = true;
						}
						
						lineStructs[line.id] = line;
						
					case LINEDECO :
						
						if (_skipScenery) continue;
						
						var compressed:Bool = data.get(lump.position) == 1 ? true : false;
						
						if (compressed)
						{
							line = {
								id : -1,
								type : LineType.SCENE,
								x1 : data.getFloat(lump.position + 1),
								y1 : data.getFloat(lump.position + 5),
								x2 : data.getFloat(lump.position + 9),
								y2 : data.getFloat(lump.position + 13),
								flipped : null,
								leftExtended : null,
								rightExtended : null,
								multiplier : null,
								layer : null
							}
						} 
						else 
						{
							line = {
								id : -1,
								type : LineType.SCENE,
								x1 : data.getDouble(lump.position + 1),
								y1 : data.getDouble(lump.position + 5),
								x2 : data.getDouble(lump.position + 9),
								y2 : data.getDouble(lump.position + 13),
								flipped : null,
								leftExtended : null,
								rightExtended : null,
								multiplier : null,
								layer : null
							}
						}
						
						lineStructs.unshift(line);
						
					case RIDERDEF :
						
						var rider:RiderStruct =
						{
							startPosition : {
								x : data.getDouble(lump.position),
								y : data.getDouble(lump.position + 8)
							},
							startVelocity : {
								x : 0.4,
								y : 0.0
							},
							colorList : [],
							remountable : null
						}
						
						riders.push(rider);
						
					case TRACKDEF :
						
						var pos = lump.position;
						
						var nameLength = data.get(pos);
						label = data.getString(pos += 1, nameLength);
						var authorLength = data.get(pos += nameLength);
						creator = data.getString(pos += 1, authorLength);
						
						switch (data.get(pos += authorLength))
						{
							case Physics.VERSION_6 :
								physics = "6.0";
							case Physics.VERSION_6_1 :
								physics = "6.1";
							case Physics.VERSION_6_2 :
								physics = "6.2";
							case Physics.NONSTANDARD :
								physics = "NONSTANDARD";
							default:
								physics = "6.2";
						}
					default :
				}
			}
			
			track  = {
				label : label,
				creator : creator,
				duration : 0,
				version : physics,
				audio : null,
				startPosition : { x : 0, y : 0},
				riders : riders,
				lines : lineStructs,
				layers : []
			}
		} 
		else 
		{
			//File is not an LRPK
			return null;
		}
		
		return track;
	}
	
	static inline var headerSize:Int = 12;
	public static function encode(_track:TrackStruct):Bytes
	{
		var directories:Array<Lump>;
		var header:BytesBuffer = new BytesBuffer();
		var data:BytesBuffer = new BytesBuffer();
		var directory:BytesBuffer = new BytesBuffer();
		
		directories = new Array();
		
		for (line in _track.lines)
		{
			if (line == null) continue;
			
			var bytes:Bytes;
			var lump:Lump;
			
			switch (line.type)
			{
				case FLOOR | ACCEL | SLOW :
					
					lump = {
						type : LINEBASE,
						position : data.length + headerSize
					};
					
					bytes = lineToBytes(line);
					
				case SCENE :
					
					lump = {
						type : LINEDECO,
						position : data.length + headerSize
					};
					
					bytes = decoLineToBytes(line);
				default :
					continue;
			}
			
			directories.push(lump);
			data.addBytes(bytes, 0, bytes.length);
			
			if (Grid.lines[line.id].special) 
			{
				var bytes:Bytes = specLineToBytes(line);
				var lump = {
					type : LINESPEC,
					position : data.length + headerSize
				}
				
				directories.push(lump);
				data.addBytes(bytes, 0, bytes.length);
			}
		}
		
		for (rider in _track.riders)
		{
			
			directories.push({
				type : RIDERDEF,
				position : data.length + headerSize
			});
			
			var bytes:Bytes = riderToBytes(rider);
			
			data.addBytes(bytes, 0, bytes.length);
		}
		
		directories.push({
			
			type : TRACKDEF,
			position : data.length + headerSize
			
		});
		
		var trackData = trackDataToByes();
		data.addBytes(trackData, 0, trackData.length);
		
		for (item in directories) 
		{
			directory.addString(item.type);
			directory.addInt32(item.position);
		}
		
		header.addString("LRPK");
		header.addInt32(directories.length);
		header.addInt32(data.length + headerSize);
		if (header.getBytes().length != headerSize)
		{
			throw "!!!HUGE PROBLEM!!! Header size mismatch. " + 'Calculated size: ${header.getBytes().length}, specified size: ${headerSize}';
		}
		
		var bytes:BytesBuffer = new BytesBuffer();
		bytes.addBytes(header.getBytes(), 0, header.getBytes().length);
		bytes.addBytes(data.getBytes(), 0, data.getBytes().length);
		bytes.addBytes(directory.getBytes(), 0, directory.getBytes().length);
		
		return bytes.getBytes();
		
	}
	
	static function riderToBytes(_rider:RiderStruct):Bytes
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//!!!WARNING!!!
		//Do not change! This lump does not need it's format changed!
		////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var data:BytesBuffer = new BytesBuffer();
		
		data.addDouble(_rider.startPosition.x);
		data.addDouble(_rider.startPosition.y);
		
		return data.getBytes();
	}
	
	static function lineToBytes(_line:LineStruct):Bytes
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//!!!WARNING!!!
		//Do not change! This lump does not need it's format changed!
		////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var data:BytesBuffer = new BytesBuffer();
		
		data.addInt32(_line.id);
		data.addDouble(_line.x1);
		data.addDouble(_line.y1);
		data.addDouble(_line.x2);
		data.addDouble(_line.y2);
		data.addByte(_line.type);
		data.addByte(_line.flipped == true ? 1 : 0);
		data.addByte(Grid.lines[_line.id].limType);
		
		return data.getBytes();
	}
	
	static function decoLineToBytes(_line:LineStruct):Bytes
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//!!!WARNING!!!
		//Do not change! This lump does not need it's format changed!
		////////////////////////////////////////////////////////////////////////////////////////////////////
		
		var data:BytesBuffer = new BytesBuffer();
		
		if (sceneryCompression) {
			data.addByte(1);
			data.addFloat(_line.x1);
			data.addFloat(_line.y1);
			data.addFloat(_line.x2);
			data.addFloat(_line.y2);
			
		} else {
			data.addByte(0);
			data.addDouble(_line.x1);
			data.addDouble(_line.y1);
			data.addDouble(_line.x2);
			data.addDouble(_line.y2);
		}
		
		return data.getBytes();
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//!!!WARNING!!!
	//What lies ahead is NON-STANDARD data.
	//Be very VERY careful about modifying these functions!
	//The safest option is to add new info to parts AFTER what's already defined.
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	static function trackDataToByes():Bytes
	{
		var data:BytesBuffer = new BytesBuffer();
		
		var name:BytesBuffer = new BytesBuffer();
		name.addString(Common.CVAR.trackName);
		
		data.addByte(Common.CVAR.trackName.length);
		data.addString(Common.CVAR.trackName);
		data.addByte(Common.CVAR.authorName.length);
		data.addString(Common.CVAR.authorName);
		data.addByte(Common.CVAR.physics);
		
		return data.getBytes();
	}
	
	static function specLineToBytes(_line:LineStruct):Bytes
	{
		var data:BytesBuffer = new BytesBuffer();
		
		data.addByte(_line.multiplier);
		data.addDouble(Grid.lines[_line.id].thickness);
		data.addByte(Grid.lines[_line.id].grindable == true ? 1 : 0);
		data.addByte(_line.layer);
		
		return data.getBytes();
	}
	
	static function layerStructToByes(_layer:LayerStruct):Bytes
	{
		var data:BytesBuffer = new BytesBuffer();
		
		data.addByte(_layer.id);
		data.addInt32(_layer.name.length);
		data.addString(_layer.name);
		data.addByte(_layer.visible == true ? 1 : 0);
		data.addByte(_layer.editable == true ? 1 : 0);
		
		return data.getBytes();
	}
}