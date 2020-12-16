package file;

import components.lines.LineBase.LineSave;
import haxe.macro.Expr.Var;

import hxd.Save;

#if sys
import sys.FileSystem;
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
			lines : new Array()
		}
		
		for (line in Main.grid.lines) {
			saveObject.lines.push(line.toSaveObject());
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
				var flavorText:String = '.sav';
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
		
		for (line in loadObject.lines) {
			Main.canvas.addLine(line.linetype, line.startPoint.x, line.startPoint.y, line.endPoint.x, line.endPoint.y, line.inverted);
		}
		
	}
	
}

typedef SaveData = {
	var lines:Array<LineSave>;
}