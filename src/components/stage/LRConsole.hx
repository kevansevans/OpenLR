package components.stage;

import h2d.Console;
import haxe.PosInfos;

/**
 * ...
 * @author Kaelan
 * 
 * This is a slightly tweaked h2d.console. The changes I need aren't significant enough for a
 * pull request imo, maybe someday later in the future.
 */
class LRConsole extends Console 
{

	public function new(font:h2d.Font, ?parent) 
	{
		super(font, parent);
		
		Console.HIDE_LOG_TIMEOUT = 5;
		
		tf.textColor = 0xFF111111;
	}
	
	//Remove the scroll event because it's use is more important elsewhere
	@:privateAccess override function onEvent( e : hxd.Event ) {
		switch( e.kind ) {
		case ETextInput:
			if( e.charCode == shortKeyChar && !bg.visible )
				show();
		default:
		}
	}
	
	//For engine calls the user DOES NOT call. Internal engine calls to the console should
	//not clog up the history.
	//
	//More or less a copy and paste from original source
	public function runCommandNoLog(_command:String) {
		//I plan on letting the user make scripts to create effects. If I add a "destructive"
		//command, we don't want that to be a command that executes through a user made script.
		var items = _command.split(" ");
		switch (items[0]) {
			//for future work
			//case "drawLine" :
				//log('Illegal intnternal and or user script command "${items[0]}" called', 0xFF0000);
			default :
				handleCommand(_command);
		}
	}
}