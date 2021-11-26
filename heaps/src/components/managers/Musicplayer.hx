package components.managers;

import hxd.fs.BytesFileSystem.BytesFileEntry;
import haxe.io.Bytes;
import hxd.File;
import hxd.res.Sound;
import hxd.snd.Channel;
import hxd.snd.effect.Pitch;
import hxlr.engine.Simulation;

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
		if (!FileSystem.exists('${_name}')) {
			return;
		}
		
		var bytes:Bytes = File.getBytes('${_name}');
		var bFileEntry = new BytesFileEntry('${_name}', bytes);
		bFileEntry.load( function() {
			sound = new Sound(bFileEntry);
		});
		#end
	}
	
	public function loadAudioAsBytes(_bytes:Bytes, _name:String) {
		var bFileEntry = new BytesFileEntry('', _bytes);
		bFileEntry.load( function() {
			sound = new Sound(bFileEntry);
		});
	}
	
	public function playMusic(_offset:Int) {
		if (sound == null) return;
		if (!Simulation.playing) return;
		mixer = sound.play();
		mixer.volume = 0.25;
		mixer.addEffect(speedfilter);
		mixer.position = (_offset / 40) + offset;
		mixer.onEnd = function() {
			
		}
		playing = true;
	}
	
	public function stopMusic() {
		if (sound == null) return;
		if (playing) mixer.stop();
		playing = false;
	}
	
}