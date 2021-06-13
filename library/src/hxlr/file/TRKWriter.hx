package hxlr.file;
import haxe.io.Bytes;
import haxe.io.BytesBuffer;
import haxe.io.BytesData;
import hxlr.file.Track;

/**
 * ...
 * @author Kaelan
 */

enum abstract TrackFeatures(String) from String to String {
	var RedMult:String = "REDMULTIPLIER";
	var SceneWidth:String = "SCENERYWIDTH";
	var SixOne:String = "6.1";
	var SongInfo:String = "SONGINFO";
	var IgnoreTrigger:String "IGNORABLE_TRIGGER";
	var ZeroStart:String = "ZEROSTART";
	var Remount:String = "REMOUNT";
	var Frictionless:String = "FRICTIONLESS";
}
class TRKWriter 
{

	public static function toByteData(_track:Track):Bytes
	{
		var features:Array<String> = [];
		
		if (_track.audio) features.push(TrackFeatures.SongInfo);
		for (line in _track.lines) {
			if (line.multiplier != null) {
				features.push(TrackFeatures.RedMult);
				break;
			}
		}
		if (_track.riders[0].startVelocity.x == 0 && _track.riders[0].startVelocity.y) features.push(TrackFeatures.ZeroStart);
		
		
		var out:BytesBuffer = new BytesBuffer();
		out.addString("TRK");
		out.addByte(0xF2);
	}
	
}