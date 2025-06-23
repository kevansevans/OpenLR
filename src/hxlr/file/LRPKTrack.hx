package hxlr.file;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import hxlr.Common;
import hxlr.engine.Grid;
import hxlr.engine.Simulation;
import hxlr.file.TrackStruct;
import hxlr.lines.LineObject;
import hxlr.enums.LineType;
import hxlr.enums.Physics;

/**
 * ...
 * @author Kaelan
 */
enum abstract LumpType(String) to String
{
	var VERSINFO;
	
	var TRACKDEF; //The start of a track and header info
	
	var LINEDEF; //For lines that need to maintain precision
	var LINEDECO; //For scenery lines where data can be culled
	var LINESPEC; //Data for special line properties
	
	var LAYERDEF; //Layer info
	
	var FLAGDEF; //Checkpoint save
	
	var RIDERDEF; //Minimum rider data needed
	var RIDERMOD; //Non-Standard info for rider
	
	var STRTRACK; //Defines the start of a track, for multi-save support
	var ENDTRACK; //Defines the end of a track, for multi-save support
}

enum abstract EngineType(Int) to Int
{
	var OpenLR;
	var LineRiderAdvanced;
	var DotCom;
	var Other;
}

typedef VersionInfo =
{
	indev:Bool,
	engine:Int,
	library:Int,
	saveRevision:Int,
	portVersion:Int
}

enum abstract HXLR_VER(Int) to Int
{
	var PreRelease; //0
}

enum abstract SaveRevision(Int) to Int
{
	var PreRelease;
}

typedef Lump =
{
	type:String,
	position:Int,
}

class LRPKTrack 
{
	static inline var engi_version:Int = EngineType.OpenLR; 		//What source port was the save made in?
	static inline var hxlr_version:Int = HXLR_VER.PreRelease; 		//What supported features are we expecting?
	static inline var save_version:Int = SaveRevision.PreRelease;	//What save revision are we expecting?
	static inline var game_version:Int = 1;							//If we're using the same source port, is the port up to date? Devs of their respective source ports are to use their own definitions and define behavior.
	#if debug														//Was this save generated with an indev version?
	static inline var indev_save = true;
	#else
	static inline var indev_save = false;
	#end
	
	static inline function formatString(_value:LumpType):String
	{
		var copy:String = _value;
		while (copy.length < 8) copy += " ";
		return copy;
	}
	
	static inline function decodeString(_value:String):String
	{
		var copy:String = _value;
		while (copy.lastIndexOf(" ") != -1) copy = copy.substr(0, copy.length - 1);
		return copy;
	}
	
	public static function decode(_fileBytes:Bytes, ?_skipScenery:Bool = false):Null<TrackStruct>
	{
		var data = _fileBytes;
		var header = data.getString(0, 4);
		
		var version:VersionInfo;
		
		var track:TrackStruct;
		
		var metadata:Map<String, Any> = new Map();
		metadata['NonStandard'] = false;
		
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
				
				var lumpType:String = decodeString(lump.type);
				
				switch (lumpType)
				{
					case 'VERSINFO' :
						
						var position:Int = lump.position + 4;
						
						version = 
						{
							indev : data.get(position) > 0 ? true : false,
							engine : data.get(position + 1),
							library : data.get(position + 2),
							saveRevision : data.get(position + 3),
							portVersion : data.get(position + 4),
						}
						
						metadata['VERSIONINFO'] = version;
						
					case 'LINEDEF' :
						
						var numLines:Int = _fileBytes.getInt32(lump.position);
						var position:Int = lump.position + 4;
						
						for (a in 0...numLines)
						{
							var lineStruct:LineStruct =
							{
								id : data.getInt32(position),
								x1 : data.getDouble(position + 4),
								y1 : data.getDouble(position + 12),
								x2 : data.getDouble(position + 20),
								y2 : data.getDouble(position + 28),
								type : data.get(position + 36),
								flipped : data.get(position + 37) == 1 ? true : false,
								leftExtended : null,
								rightExtended : null,
								multiplier : null,
								layer : null,
							}
							
							var limType:Int = data.get(position + 38);
							
							switch (limType)
							{
								case 0:
									//nothing
								case 1:
									lineStruct.leftExtended = true;
									lineStruct.rightExtended = false;
								case 2:
									lineStruct.leftExtended = false;
									lineStruct.rightExtended = true;
								case 3:
									lineStruct.leftExtended = true;
									lineStruct.rightExtended = true;
							}
							
							lineStructs.push(lineStruct);
							
							position += 39;
						}
						
					case 'LINEDECO' :
						
						var numLines:Int = _fileBytes.getInt32(lump.position);
						var position:Int = lump.position + 4;
						
						for (a in 0...numLines)
						{
							var lineStruct:LineStruct =
							{
								id : data.getInt32(position),
								x1 : data.getFloat(position + 4),
								y1 : data.getFloat(position + 8),
								x2 : data.getFloat(position + 12),
								y2 : data.getFloat(position + 16),
								type : 2,
								flipped : false,
								leftExtended : null,
								rightExtended : null,
								multiplier : null,
								layer : null,
							}
							lineStructs.push(lineStruct);
								
							position += 20;
						}
						
					case 'RIDERDEF' :
						
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
						
					case 'TRACKDEF' :
						
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
						
						Common.CVAR.authorName = creator;
						Common.CVAR.trackName = label;
						
					default :
						metadata['NonStandard'] = true;
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
				layers : [],
				meta : metadata
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
		
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//Lumps made here
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//Versinfo
		//Trackdef
		////////////////////////////////////////////////////////////////////////////////////////////////////
		
		directories.push({
			type : formatString(VERSINFO),
			position : data.length + headerSize
		});
		
		var versionBytes = new BytesBuffer();
		var versionData = versionInfoToBytes();
		
		data.addBytes(versionData, 0, versionData.length); 
		
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//Lumps made here
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//Linedef
		//Linedeco
		//linespec
		////////////////////////////////////////////////////////////////////////////////////////////////////
		
		directories.push({
			type : formatString(LINEDEF),
			position : data.length + headerSize
		});
		
		var specLines:Array<LineObject> = [];
		
		var baseLineData:BytesBuffer = new BytesBuffer();
		var sceneLineData:BytesBuffer = new BytesBuffer();
		var specialLineData:BytesBuffer = new BytesBuffer();
		
		var lineCount:Int = 0;
		var sceneCount:Int = 0;
		var specLineCount:Int = 0;
		
		for (line in _track.lines) 
		{
			if (line == null) continue;
			
			switch (line.type)
			{
				case SCENE:
					var infoBytes:Bytes = decoLineToBytes(line);
					sceneLineData.addBytes(infoBytes, 0, infoBytes.length);
					++sceneCount;
				default :
					var infoBytes:Bytes = lineToBytes(line);
					baseLineData.addBytes(infoBytes, 0, infoBytes.length);
					++lineCount;
			}
			
			//Reformat this into a thing that stores json data
			/*(if (Grid.lines[line.id].special) 
			{
				var infoBytes:Bytes = specLineToBytes(line);
				specialLineData.addBytes(infoBytes, 0, infoBytes.length);
				++specLineCount;
			}*/
		}
		
		data.addInt32(lineCount);
		data.addBytes(baseLineData.getBytes(), 0, baseLineData.getBytes().length);
		
		directories.push({
			type : formatString(LINEDECO),
			position : data.length + headerSize,
		});
		
		data.addInt32(sceneCount);
		data.addBytes(sceneLineData.getBytes(), 0, sceneLineData.getBytes().length);
		
		if (specLineCount > 0) {
			
			directories.push({
				type : formatString(LINESPEC),
				position : data.length + headerSize,
			});
			
			data.addInt32(specLineCount);
			data.addBytes(specialLineData.getBytes(), 0, specialLineData.getBytes().length);
			
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//Lumps made here
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//Riderdef
		//Ridermod (to do)
		//Flagdef (to do)
		////////////////////////////////////////////////////////////////////////////////////////////////////
		
		for (rider in _track.riders)
		{
			
			directories.push({
				type : formatString(RIDERDEF),
				position : data.length + headerSize
			});
			
			var riderBytes:Bytes = riderToBytes(rider);
			
			data.addBytes(riderBytes, 0, riderBytes.length);
		}
		
		directories.push({
			
			type : formatString(TRACKDEF),
			position : data.length + headerSize
			
		});
		
		/*if (Simulation.flagged)
		{
			directories.push({
				type : formatString(FLAGDEF),
				position : data.length + headerSize;
			});
			
			var flagBytes:Bytes = flagDataToBytes();
			
			data.addBytes(flagBytes, 0, flagBytes.length);
		}*/
		
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//Data finalization
		////////////////////////////////////////////////////////////////////////////////////////////////////
		
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
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//
	//!!!WARNING!!!
	//
	//The following lumps are STANDARD data. It is within your best interests to ignore these lumpdefs,
	//and instead create special lumps akin to the LINESPEC lump. Modifying these lump types can and
	//will break compatibility, as reading them is hard coded.
	//
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	static function versionInfoToBytes():Bytes
	{
		var data:BytesBuffer = new BytesBuffer();
		
		data.addByte(indev_save == true ? 1 : 0);
		data.addByte(engi_version);
		data.addByte(hxlr_version);
		data.addByte(save_version);
		data.addByte(game_version);
		
		return data.getBytes();
	}
	
	static function riderToBytes(_rider:RiderStruct):Bytes
	{
		var data:BytesBuffer = new BytesBuffer();
		
		data.addDouble(_rider.startPosition.x);
		data.addDouble(_rider.startPosition.y);
		
		return data.getBytes();
	}
	
	static function lineToBytes(_line:LineStruct):Bytes
	{
		
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
		var data:BytesBuffer = new BytesBuffer();
		
		data.addInt32(_line.id);
		data.addFloat(_line.x1);
		data.addFloat(_line.y1);
		data.addFloat(_line.x2);
		data.addFloat(_line.y2);
		
		return data.getBytes();
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	//
	//!!!WARNING!!!
	//
	//What lies ahead is NON-STANDARD data.
	//Be very VERY careful about modifying these functions!
	//The safest option is to add new info to parts AFTER what's already defined.
	//
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
		
		data.addInt32(_line.id);
		data.addByte(_line.multiplier);
		data.addDouble(Grid.lines[_line.id].thickness);
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
	
	//static function flagDataToBytes():Bytes
	//{
		
	//}
}