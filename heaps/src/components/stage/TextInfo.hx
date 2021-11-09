package components.stage;
import components.Assets;
import components.stage.Canvas;
import hxlr.enums.LineType;
import h2d.Text;
import h3d.Engine;
import h3d.Vector;
import hxd.Res;
import hxd.res.DefaultFont;
import hxlr.engine.Grid;
import hxlr.Constants;

/**
 * ...
 * @author Kaelan
 */
class TextInfo 
{
	public var info:Text;
	
	public var framerate:Float;
	
	public static var showTrackName:Bool = true;
	public static var showTimeStamp:Bool = true;
	public static var showSpeedometer:Bool = true;
	public static var showTotalLineCounts:Bool = true;
	public static var showLineCounts:Bool = true;
	public static var showFrameRate:Bool = true;
	
	public function new() 
	{
		info = new Text(Assets.f_verdana_20);
		info.color = new Vector(0.2, 0.2, 0.2);
		info.textAlign = Align.MultilineRight;
	}
	
	public function update() {
		
		info.text = "";
		
		if (showTrackName) info.text += Constants.CVAR.trackName + "\n";
		if (showTimeStamp) info.text += '${timeStamp(Main.simulation.frames)} : ${getSimState()}\n';
		
		if (Main.camera.enabled && showSpeedometer) 
		{
			var speed:Float = Main.riders.riders[Main.camera.riderFollow].speed;
			info.text += '${speed} p/f\n';
		}
		
		if (showTotalLineCounts) info.text += 'Lines: ${Grid.lineCount}\n';
		
		if (showLineCounts) {
			if (getMode(FLOOR)) info.text += 'Floor: ${Grid.subTypeCount[LineType.FLOOR] == null ? 0 : Grid.subTypeCount[LineType.FLOOR]}\n';
			if (getMode(ACCEL)) info.text += 'Accel: ${Grid.subTypeCount[LineType.ACCEL] == null ? 0 : Grid.subTypeCount[LineType.ACCEL]}\n';
			if (getMode(SCENE)) info.text += 'Scene: ${Grid.subTypeCount[LineType.SCENE] == null ? 0 : Grid.subTypeCount[LineType.SCENE]}\n';
			if (getMode(SLOW)) info.text += 'Slow: ${Grid.subTypeCount[LineType.SLOW] == null ? 0 : Grid.subTypeCount[LineType.SLOW]}\n';
		}
		
		if (showFrameRate) info.text += '${Math.round(Main.locengine.fps)}:FPS';
		
		info.x = Main.locengine.width - info.textWidth - 5;
		info.y = 40;
		
	}
	
	public function getMode(_lineType:LineType):Bool
	{
		var mode = Main.canvas.drawMode;
		
		switch (mode) {
			case FULL_EDIT | PLAYBACK :
				return true;
			case NO_SCENERY_EDIT | NO_SCENERY_PLAYBACK :
				if (_lineType == SCENE) {
					return false;
				}
				return  true;
			case SCENERY_EDIT | SCENERY_PLAYBACK :
				if (_lineType != SCENE) {
					return false;
				}
				return  true;
			default :
				trace("hwat?");
				return true;
		}
		return true;
	}
	
	public function timeStamp(_frames:Int):String
	{
		var negative:Bool = false;
		var frames = _frames;
		if (_frames < 0) {
			negative = true;
			frames *= -1;
		}
		var seconds:Int = Std.int(frames / 40);
		var minutes:Int = Std.int(seconds / 60);
		var hours:Int = Std.int(minutes / 60);
		var remFrames:Int = frames % 40;
		var remSeconds:Int = seconds % 60;
		var remMinutes:Int = minutes % 60;
		var _returnString:String = "";
		if (frames < 40)
		{
			_returnString = (frames < 10) ? "0:0" + frames : "0:" + frames;
		}
		else if (frames >= 40 && seconds < 60)
		{
			_returnString = (remFrames < 10) ? seconds + ":" + "0" + remFrames : seconds + ":" + remFrames;
		}
		else if (seconds >= 60 && minutes < 60)
		{
			_returnString = minutes + ":" + ((remSeconds < 10) ? "0" + remSeconds : '$remSeconds') + ":" + ((remFrames < 10) ? "0" + remFrames : '$remFrames');
		} else if (minutes >= 60) {
			_returnString = hours + ":" + ((minutes < 10) ? "0" + remMinutes : '$remMinutes') + ":" + ((remSeconds < 10) ? "0" + remSeconds : '$remSeconds') + ":" + ((remFrames < 10) ? "0" + remFrames : '$remFrames');
		}
		if (negative) {
			_returnString = "-" + _returnString;
		}
		return (_returnString);
	}
	
	public function getSimState():String
	{
		var sim = Main.simulation;
		if (sim.rewinding) {
			return  "Rewinding";
		}
		if (!sim.playing && !sim.paused && !sim.rewinding) {
			return "Stopped";
		}
		if (sim.playing && !sim.paused && !sim.rewinding) {
			return  "Playing";
		}
		if (sim.paused && !sim.rewinding) {
			return "Paused";
		}
		
		return "lousy smarch weather";
	}
	
	public function align() 
	{
		update();
	}
	
}