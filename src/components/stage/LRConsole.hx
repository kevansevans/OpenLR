package components.stage;

import h2d.Console;
import haxe.PosInfos;
import hxd.Key;

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
		
		Console.HIDE_LOG_TIMEOUT = 30;
		
		tf.textColor = 0xFF111111;
	}
	
	//Remove the scroll event because it's use is more important elsewhere
	@:privateAccess override function onEvent( e : hxd.Event ) {
		switch( e.kind ) {
		case ETextInput:
			if ( e.charCode == shortKeyChar && !bg.visible )
				show();
		default:
		}
	}
	
	@:privateAccess override function handleCommand( command : String ) {
		command = StringTools.trim(command);
		if( command.charCodeAt(0) == "/".code ) command = command.substr(1);
		if( command == "" ) {
			hide();
			return;
		}
		logs.push(command);
		logIndex = -1;

		var errorColor = 0xC00000;

		var args = [];
		var c = '';
		var i = 0;

		function readString(endChar:String) {
			var string = '';

			while (i < command.length) {
				c = command.charAt(++i);
				if (c == endChar) {
					++i;
					return string;
				}
				string += c;
			}

			return null;
		}

		inline function skipSpace() {
			c = command.charAt(i);
			while (c == ' ' || c == '\t') {
				c = command.charAt(++i);
			}
			--i;
		}

		var last = '';
		while (i < command.length) {
			c = command.charAt(i);

			switch (c) {
			case ' ' | '\t':
				skipSpace();

				args.push(last);
				last = '';
			case "'" | '"':
				var string = readString(c);
				if (string == null) {
					log('Bad formated string', errorColor);
					return;
				}

				args.push(string);
				last = '';

				skipSpace();
			default:
				last += c;
			}

			++i;
		}
		args.push(last);

		var cmdName = args[0];
		if( aliases.exists(cmdName) ) cmdName = aliases.get(cmdName);
		var cmd = commands.get(cmdName);
		if ( cmd == null ) {
			
			#if js
			
			if (Main.p2p.connected) {
				Main.p2p.relayChatMessage(command);
				return;
			}
			
			#end
			
			log('Unknown command "${cmdName}"',errorColor);
			return;
		}
		var vargs = new Array<Dynamic>();
		for( i in 0...cmd.args.length ) {
			var a = cmd.args[i];
			var v = args[i + 1];
			if( v == null ) {
				if( a.opt ) {
					vargs.push(null);
					continue;
				}
				log('Missing argument ${a.name}',errorColor);
				return;
			}
			switch( a.t ) {
			case AInt:
				var i = Std.parseInt(v);
				if( i == null ) {
					log('$v should be Int for argument ${a.name}',errorColor);
					return;
				}
				vargs.push(i);
			case AFloat:
				var f = Std.parseFloat(v);
				if( Math.isNaN(f) ) {
					log('$v should be Float for argument ${a.name}',errorColor);
					return;
				}
				vargs.push(f);
			case ABool:
				switch( v ) {
				case "true", "1": vargs.push(true);
				case "false", "0": vargs.push(false);
				default:
					log('$v should be Bool for argument ${a.name}',errorColor);
					return;
				}
			case AString:
				// if we take a single string, let's pass the whole args (allows spaces)
				vargs.push(cmd.args.length == 1 ? StringTools.trim(command.substr(args[0].length)) : v);
			case AEnum(values):
				var found = false;
				for( v2 in values )
					if( v == v2 ) {
						found = true;
						vargs.push(v2);
					}
				if( !found ) {
					log('$v should be [${values.join("|")}] for argument ${a.name}', errorColor);
					return;
				}
			}
		}
		try {
			Reflect.callMethod(null, cmd.callb, vargs);
		} catch( e : String ) {
			log('ERROR $e', errorColor);
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