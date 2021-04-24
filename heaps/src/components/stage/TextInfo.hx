package components.stage;
import components.stage.Canvas;
import hxlr.enums.LineType;
import h2d.Text;
import h3d.Engine;
import h3d.Vector;
import hxd.Res;
import hxd.res.DefaultFont;
import hxlr.engine.Grid;

/**
 * ...
 * @author Kaelan
 */
class TextInfo 
{
	public var info:Text;
	
	public var framerate:Float;
	
	public function new() 
	{
		info = new Text(DefaultFont.get());
		info.color = new Vector(0.2, 0.2, 0.2);
		info.textAlign = Align.MultilineRight;
	}
	
	public function update() {
		
		info.text = (Main.trackName == null ? 'Untitled' : Main.trackName) + ' : ${Math.floor(1/framerate)}FPS\n';
		info.text += 'Draw calls: ${Main.locengine.drawCalls}\n';
		info.text += '${timeStamp(Main.simulation.frames)} : ${getSimState()}\n';
		info.text += 'Lines: ${Grid.lineCount}\n';
		info.text += 'Floor: ${Grid.subTypeCount[LineType.FLOOR]}${getLineVisibility(FLOOR)}\n';
		info.text += 'Accel: ${Grid.subTypeCount[LineType.ACCEL]}${getLineVisibility(ACCEL)}\n';
		info.text += 'Scene: ${Grid.subTypeCount[LineType.SCENE]}${getLineVisibility(SCENE)}\n';
		
	}
	
	public function getLineVisibility(_line:LineType):String 
	{
		switch (_line) 
		{
			case FLOOR :
				
				switch (Main.canvas.drawMode) {
					case FULL_EDIT | PLAYBACK | NO_SCENERY_EDIT | NO_SCENERY_PLAYBACK :
						return "";
					default :
						return  "(Not visible)";
				}
				
			case ACCEL :
				
				switch (Main.canvas.drawMode) {
					case FULL_EDIT | PLAYBACK | NO_SCENERY_EDIT | NO_SCENERY_PLAYBACK :
						return "";
					default :
						return  "(Not visible)";
				}
				
			case SCENE :
				
				switch (Main.canvas.drawMode) {
					case NO_SCENERY_EDIT | NO_SCENERY_PLAYBACK :
						return "(Not visible)";
					default :
						return  "";
				}
				
			default :
		}
		
		return  "";
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
	
}