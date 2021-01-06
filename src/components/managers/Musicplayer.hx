package components.managers;

import hxd.fs.BytesFileSystem.BytesFileEntry;
import haxe.io.Bytes;
import hxd.File;
import hxd.res.Sound;
import hxd.Res;
import hxd.snd.Channel;
import hxd.snd.effect.Pitch;

#if hl
import sys.FileSystem;
#end


/**
 * ...
 * @author Kaelan
 */
class Musicplayer 
{
	public var offset:Float = 0;
	public var speedfilter:Pitch;
	public function new() 
	{
		speedfilter = new Pitch();
	}
	var sound:Sound;
	var mixer:Channel;
	public var playing:Bool = false;
	public function loadAudio(_name:String) {
		
		#if hl
		if (!FileSystem.isDirectory("./music")) {
			Main.console.log("Music directory not found. One has been created for you...", 0xFF0000);
			FileSystem.createDirectory("./music");
			return;
		}
		
		if (!FileSystem.exists('./music/${_name}.ogg')) {
			Main.console.log("./music/${_name}.ogg is not present...", 0xFF0000);
			return;
		}
		
		var bytes:Bytes = File.getBytes('./music/${_name}.ogg');
		var bFileEntry = new BytesFileEntry('./music/${_name}.ogg', bytes);
		bFileEntry.load( function() {
			sound = new Sound(bFileEntry);
		});
		
		Main.songName = _name;
		#end
	}
	
	public function playMusic(_offset:Int) {
		if (sound == null) return;
		if (!Main.simulation.playing) return;
		mixer = sound.play();
		mixer.addEffect(speedfilter);
		mixer.position = (_offset / 40) + offset;
		mixer.onEnd = function() {
			Main.console.log("Audio has ended...");
		}
		playing = true;
	}
	
	public function stopMusic() {
		if (sound == null) return;
		if (playing) mixer.stop();
		playing = false;
	}
	
}