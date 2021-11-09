package hxlr.file;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import hxlr.Constants;
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

/**
 * ...
 * @author Kaelan
 */
enum abstract LumpType(String) to String
{
	var LINEBASE; //For lines that need to maintain precision
	var LINEDECO; //For scenery lines where data can be culled
	var LINESPEC; //Data for special line properties
	
	var RIDERDEF; //Minimum rider data needed
	var RIDERMOD; //Non-Standard info for rider
	
	var TRACKDEF;
}
class LRPKTrack 
{
	static var sceneryCompression:Bool = true;
	
	//To be implemented later
	static inline var saveVersion:Int = 0;
	
	public static function decode(_fileBytes:Bytes)
	{
		var data = _fileBytes;
		var header = data.getString(0, 4);
		
		if (header == "LRPK") //warning or something
		{
			var numItems = data.getInt32(4);
			var dirPosition = data.getInt32(8);
			
			var lines:Array<LineObject> = new Array();
			
			for (pos in 0...numItems)
			{
				var lump:Lump = {
					type : data.getString((pos * 12) + dirPosition, 8),
					position : data.getInt32((pos * 12) + dirPosition + 8)
				}
				
				switch (lump.type)
				{
					case LINEBASE :
						
						var pos:Int = lump.position;
						
						var id:Int = data.getInt32(pos);
						var x1:Float = data.getDouble(pos += 4);
						var y1:Float = data.getDouble(pos += 8);
						var x2:Float = data.getDouble(pos += 8);
						var y2:Float = data.getDouble(pos += 8);
						var type:Int = data.get(pos += 8);
						var shifted:Bool = data.get(pos += 1) == 1 ? true : false;
						var limType:Int = data.get(pos += 1);
						
						var line:LineObject = null;
						switch (type)
						{
							case FLOOR :
								line = new Floor(new Point(x1, y1), new Point(x2, y2), shifted, limType);
							case ACCEL :
								line = new Accel(new Point(x1, y1), new Point(x2, y2), shifted, limType);
							case SLOW :
								line = new Slow(new Point(x1, y1), new Point(x2, y2), shifted, limType);
						}
						
						line.id = id;
						lines[id] = line;
						
					case LINEDECO :
						
						continue;
						
						var compressed:Bool = data.get(lump.position) == 1 ? true : false;
						
						var x1:Float;
						var y1:Float;
						var x2:Float;
						var y2:Float;
						
						if (compressed)
						{
							x1 = data.getFloat(lump.position + 1);
							y1 = data.getFloat(lump.position + 5);
							x2 = data.getFloat(lump.position + 9);
							y2 = data.getFloat(lump.position + 13);
						} 
						else 
						{
							x1 = data.getDouble(lump.position + 1);
							y1 = data.getDouble(lump.position + 9);
							x2 = data.getDouble(lump.position + 17);
							y2 = data.getDouble(lump.position + 35);
						}
						
						var line:Scenery = new Scenery(new Point(x1, y1), new Point(x2, y2));
						lines.unshift(line);
						
					case RIDERDEF :
						
						var x:Float = data.getDouble(lump.position);
						var y:Float = data.getDouble(lump.position + 8);
						
						Main.riders.addNewRider(new Point(x, y));
						
					case TRACKDEF :
						
						var pos = lump.position;
						
						var nameLength = data.get(pos);
						Constants.CVAR.trackName = data.getString(pos += 1, nameLength);
						var authorLength = data.get(pos += nameLength);
						Constants.CVAR.authorName = data.getString(pos += 1, authorLength);
						Grid.switchPhysicsModel(data.get(pos += authorLength));
						
					default :
				}
			}
		}
		
		
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
		name.addString(Constants.CVAR.trackName);
		
		data.addByte(Constants.CVAR.trackName.length);
		data.addString(Constants.CVAR.trackName);
		data.addByte(Constants.CVAR.authorName.length);
		data.addString(Constants.CVAR.authorName);
		data.addByte(Constants.CVAR.physics);
		
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
}

typedef Lump =
{
	type:String,
	position:Int,
}

typedef RiderData =
{
	id:Int,
	pos_x:Float,
	pos_y:Float,
	vel_x:Float,
	vel_y:Float,
	name:String,
}