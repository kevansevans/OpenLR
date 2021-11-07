package components.io;

import haxe.io.Bytes;
import hxd.File;
import hxlr.file.JSONTrack;
import hxlr.file.LRPKTrack;
import hxlr.file.TrackStruct;
import hxlr.engine.Grid;
import hxlr.lines.LineObject;
import hxlr.math.geom.Point;

#if js

import haxe.Timer;
import js.html.Blob;
import js.html.URL;
import js.Browser;
import js.lib.ArrayBuffer;

#end

/**
 * ...
 * @author Kaelan
 */
class SaveLoad 
{

	static function generateSave():TrackStruct {
		
		
		var save:TrackStruct = {
			label : Main.CVAR.trackName,
			creator : Main.CVAR.trackAuthor,
			duration : 0,
			version : "6.2",
			startPosition : {
				x : 0,
				y : 0,
			},
			riders : [
				
			],
			lines : [],
			audio : null,
			layers : null
		}
		
		for (rider in Main.riders.riders) {
			save.riders.push(
				{
					startPosition : {x : rider.startPos.x, y : rider.startPos.y},
					startVelocity : {x : 0.4, y : 0},
					colorA : null,
					colorB : null
				}
			);
		}
		
		for (line in Grid.lines) {
			if (line == null) continue;
			save.lines.unshift(line.toLineStruct());
		}
		
		return save;
		
	}
	
	public static function saveToLocation()
	{
		var track = generateSave();
		var json = JSONTrack.toString(track);
		
		#if sys
		
		File.saveAs(LRPKTrack.encode(), {
			title : "Save a LRPK File",
			fileTypes : [
				{name : "LR Package", extensions : ["lrpk"]},
			],
			defaultPath : './' + generateName()
		});
		
		#elseif js
		
		downloadJSFile(LRPKTrack.encode(), generateName());
		
		#end
		
	}
	
	#if js
	
	static function downloadJSFile(_bytes:Bytes, _name:String) {
		
		var buffer:ArrayBuffer = _bytes.getData();
		var file:Blob = new Blob([buffer]);
		var a = Browser.document.createAnchorElement();
		var url = URL.createObjectURL(file);
		a.href = url;
		a.download = _name;
		Browser.document.body.appendChild(a);
		a.click();
		var timer = Timer.delay(function() {
			Browser.document.body.removeChild(a);
			URL.revokeObjectURL(url);
		}, 0);
		
	}
	
	#end
	
	static function generateName():String {
		var date:String = '${Date.now().getDay()}_${Date.now().getMonth()}_${Date.now().getFullYear()}.${Date.now().getTime()}';
		var name = '${Main.CVAR.trackName}.${Main.CVAR.trackAuthor}.${date}.json';
		return name;
	}
	
	public static function browseForSave(?_onSucess:Null<Void -> Void>, ?_onCancel:Null<Void -> Void>)
	{
		
		File.browse(function(_browse:BrowseSelect) {
			
			_browse.load(function(_bytes:Bytes) {
				
				if (_browse.fileName.indexOf(".json") != -1) {
				
				var track:TrackStruct = JSONTrack.fromString(_bytes.toString());
				
				if (_onSucess != null) _onSucess();
				
				loadTrackFromStruct(track);
				
				}
				
				if (_browse.fileName.indexOf(".lrpk") != -1)
				{
					Main.riders.deleteAllRiders();
					
					LRPKTrack.decode(_bytes);
					
					Main.camera.riderFollow = "Bosh";
				}
				
			}
			
			);
			
		}, 
		{
			
			title : "Load a Line Rider JSON file",
			fileTypes : [
				{name : "JSON", extensions : ["json"]},
				{name : "LR package", extensions : ["LRPK"]},
			],
			
		});
		
	}
	
	static function loadTrackFromStruct(_track:TrackStruct) {
		
		Main.CVAR.trackName = _track.label == null ? "Untitled" : _track.label;
		Main.CVAR.trackAuthor = _track.creator == null ? "Anonymous" : _track.creator;
		
		var lineArray = _track.lines;
		lineArray.reverse();
		for (line in lineArray) {
			var lineObj:LineObject = Grid.createLineFromStruct(line);
			Grid.register(lineObj);
			Main.canvas.addVisLine(lineObj);
		}
		
		Main.riders.deleteAllRiders();
		
		if (_track.riders != null) {
			for (rider in _track.riders) {
				var riderObj = Main.riders.addNewRider(new Point(rider.startPosition.x, rider.startPosition.y));
				riderObj.startVel = new Point(rider.startVelocity.x, rider.startVelocity.y);
				
				Main.camera.riderFollow = riderObj.name;
			}
		} else {
			var riderObj = Main.riders.addNewRider(new Point(_track.startPosition.x, _track.startPosition.y));
			Main.camera.riderFollow = riderObj.name;
		}
		
	}
	
}