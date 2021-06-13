package hxlr.file;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import haxe.io.BytesData;
import hxlr.file.TrackStruct;
import hxlr.enums.LineType;

/**
 * ...
 * @author Kaelan
 */

enum abstract TrackFeatures(String) from String to String {
	var RedMult:String = "REDMULTIPLIER";
	var SceneWidth:String = "SCENERYWIDTH";
	var SixOne:String = "6.1";
	var SongInfo:String = "SONGINFO";
	var IgnoreTrigger:String = "IGNORABLE_TRIGGER";
	var ZeroStart:String = "ZEROSTART";
	var Remount:String = "REMOUNT";
	var Frictionless:String = "FRICTIONLESS";
}
class TRKTrack 
{

	public static function toByteData(_track:TrackStruct):Bytes
	{
		var RedMulti:Bool = false;
		var SceneryWidth:Bool = false;
		
		var out:BytesBuffer = new BytesBuffer();
		out.addString("TRK");
		out.addByte(0xF2);
		out.addByte(1);
		
		var features:Array<String> = [];
		if (_track.audio != null) features.push(TrackFeatures.SongInfo);
		for (line in _track.lines) {
			if (line.multiplier != null) {
				features.push(TrackFeatures.RedMult);
				RedMulti = true;
				break;
			}
		}
		if (_track.riders[0].startVelocity.x == 0 && _track.riders[0].startVelocity.y == 0) features.push(TrackFeatures.ZeroStart);
		//if scenery width
		if (_track.version == "6.1") features.push(TrackFeatures.SixOne);
		//if ignoreable trigger
		//if remount
		//if frictionless
		
		var featureString = '';
		for (item in features) {
			featureString += (item + ';');
		}
		
		//writeUInt16(featureString.length, out);
		//out.addString(featureString);
		
		if (_track.audio != null) {
			
		}
		
		out.addDouble(_track.startPosition.x);
		out.addDouble(_track.startPosition.y);
		out.addInt32(_track.lines.length);
		
		for (line in _track.lines)
		{
			var type:Int = line.type;
			if (line.type == FLOOR || line.type == ACCEL) {
				if (line.fliped) type |= 1 << 7;
				
				var ext:Int = 0;
				if (line.leftExtended && !line.rightExtended) ext = 1;
				else if (!line.leftExtended && line.rightExtended) ext = 2;
				else if (line.leftExtended && line.rightExtended) ext = 3;
				type |= ((ext & 0x03) << 5);
				
				out.addByte(type);
				
				if (RedMulti && line.type == ACCEL) {
					out.addByte(line.multiplier);
				}
				out.addInt32(line.id);
				if (!line.leftExtended || !line.rightExtended) {
					for (a in 0...8) out.addByte(0xFF);
				}
			} 
			else {
				out.addByte(type);
				if (SceneryWidth && line.type == SCENE) {
					//scenery width writing
				}
			}
			out.addDouble(line.x1);
			out.addDouble(line.y1);
			out.addDouble(line.x2);
			out.addDouble(line.y2);
		}
		
		return out.getBytes();
	}
	
	static function writeUInt16(_value:Int, _buffer:BytesBuffer)
	{
		_buffer.addByte((_value & 0xFF00) >> 8);
		_buffer.addByte((_value & 0xFF));
	}
}