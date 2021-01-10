package file;

import components.lines.Floor;
import components.lines.LineBase;
import components.lines.LineBase.LineSave;
import components.sledder.RiderBase;
import format.abc.Data.Name;
import haxe.Json;
import h2d.col.Point;

import hxd.Save;

#if sys
import sys.FileSystem;
import sys.io.File;
#elseif js

#end

/**
 * ...
 * @author Kaelan
 */
class SaveLoad 
{

	public function new() 
	{
		
	}
	
	public function saveTrack(_name:String) {
		
		var saveObject:SaveData = {
			lines : new Array(),
			riders : new Array(),
			name : Main.trackName,
			author : Main.authorName,
			song : Main.songName
		}
		
		for (line in Main.grid.lines) {
			if (line == null) continue;
			saveObject.lines.push(line.toSaveObject());
		}
		
		for (sledder in Main.riders.riders) {
			var rider:RiderSave = {
				name : sledder.name,
				startPoint : sledder.startPos,
				startFrame : sledder.enabledFrame,
				stopFrame : sledder.disableFrame,
				colora : sledder.colorA,
				colorb : sledder.colorB,
			}
			saveObject.riders.push(rider);
		}
		
		#if sys
		
		var months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUN", "AUG", "SEP", "OCT", "NOV", "DEC"];
		var month:Int = Date.now().getMonth();
		var monthstr:String = months[month] != null ? months[month] : "Lousy Smarch Weather";
		
		if (!FileSystem.isDirectory('./saves/${_name}')) FileSystem.createDirectory('./saves/${_name}');
		Save.save(saveObject, './saves/${_name}/${Date.now().getDate()}${monthstr}${Date.now().getFullYear()}_${Date.now().getHours()}_${Date.now().getMinutes()}', true);
		
		#else
		Save.save(saveObject, _name, true);
		#end
		
	}
	
	public function listTrackFiles() {
		#if sys
		if (FileSystem.isDirectory("./saves")) {
			var list = FileSystem.readDirectory("./saves");
			Main.console.log("===");
			if (list.length == 0) {
				Main.console.log("No saves found...", 0xFF0000);
			}
			for (item in list) {
				var flavorText:String = '';
				if (FileSystem.isDirectory('./saves/${item}')) {
					var subList = FileSystem.readDirectory('./saves/${item}');
					flavorText = ' :: Directory (${subList.length} files)';
				}
				Main.console.log(item + flavorText);
			}
			Main.console.log("===");
		} else {
			Main.console.log("No saves found, there isn't even a save folder...", 0xFF0000);
		}
		#elseif js
		var numItems = js.Browser.window.localStorage.length;
		Main.console.log("===");
		for (item in 0...numItems) {
			Main.console.log('${js.Browser.window.localStorage.key(item)}');
		}
		Main.console.log("===");
		#end
	}
	
	public function loadTrack(_name:String, ?_offset:Int = 0) {
		
		#if sys
		
		var loadObject:SaveData = null;
		
		if (!FileSystem.isDirectory('./saves/${_name}')) {
			if (FileSystem.exists('./saves/${_name}.sav')) {
				loadObject = Save.load(null, './saves/${_name}', true);
			} else {
				Main.console.log('Track load error, "${_name}" directory/file not found...', 0xFF0000);
				return;
			}
		} else {
			var trackList = FileSystem.readDirectory('./saves/${_name}');
		
			if (trackList.length == 0) {
				Main.console.log('Track load error, no files found in "${_name}" directory', 0xFF0000);
				return;
			}
			
			trackList.reverse();
			
			loadObject = Save.load(null, './saves/${_name}/${trackList[_offset].split(".sav")[0]}', true);
		}
		
		#else
		
		var loadObject:SaveData = Save.load(null, _name, true);
		
		
		if (loadObject == null) {
			Main.console.log('Track load error, ${_name}.sav not found...', 0xFF0000);
			return;
		}
		
		#end
		
		Main.trackName = loadObject.name;
		Main.authorName = loadObject.author;
		if (loadObject.song != null) Main.audio.loadAudio(loadObject.song);
		
		for (line in loadObject.lines) {
			Main.canvas.addLine(line.linetype, line.startPoint.x, line.startPoint.y, line.endPoint.x, line.endPoint.y, line.inverted);
		}
		
		for (rider in loadObject.riders) {
			Main.riders.addNewRider(rider.name, rider.startPoint, rider.startFrame, rider.stopFrame);
			Main.riders.riders[rider.name].setColor(rider.colora, rider.colorb);
		}
		
	}
	
	public function loadJSON(_fileName:String) {
		#if js
		//Create when I figure out how to import saves on JS
		return;
		#else
		
		if (!FileSystem.exists('./saves/${_fileName}.json')) return;
		else {
			var str:String = File.getBytes('./saves/${_fileName}.json').toString();
			var loadObject:Dynamic = Json.parse(str);
			
			Main.trackName = loadObject.label;
			Main.authorName = loadObject.creator;
			
			Main.riders.addNewRider("Bosh", new Point(loadObject.startPosition.x, loadObject.startPosition.y));
			
			var lineArray:Array<Dynamic> = loadObject.lines;
			lineArray.reverse();
			for (lineObject in lineArray) {
				var lim:Int = -1;
				if (!lineObject.leftExtended && !lineObject.rightExtended) {
					lim = 0;
				} else if (lineObject.leftExtended && !lineObject.rightExtended) {
					lim = 1;
				} else if (!lineObject.leftExtended && lineObject.rightExtended) {
					lim = 2;
				} else if (lineObject.leftExtended && lineObject.rightExtended) {
					lim = 3;
				}
				Main.canvas.addLine(lineObject.type, lineObject.x1, lineObject.y1, lineObject.x2, lineObject.y2, lineObject.flipped, lim);
			}
		}
		
		#end
	}
	
	public function saveUserInfo() {
		var info:UserInfo = {
			name : Main.authorName
		}
		
		Save.save(info, 'playerdata', true);
	}
	
	public function loadUserInfo() {
		
		var info = Save.load(null, 'playerdata', true);
		
		if (info != null) {
			Main.authorName = info.name;
		}
		
	}
	
}

typedef SaveData = {
	var lines:Array<LineSave>;
	var riders:Array<RiderSave>;
	var name:Null<String>;
	var author:Null<String>;
	var song:Null<String>;
}

typedef UserInfo = {
	var name:String;
}