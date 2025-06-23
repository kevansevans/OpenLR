package components.io;

import haxe.io.Bytes;
import hxd.File;
import hxlr.file.JSONTrack;
import hxlr.file.LRFileSystem;
import hxlr.file.LRPKTrack;
import hxlr.file.TrackStruct;
import hxlr.engine.Grid;
import hxlr.lines.LineObject;
import hxlr.math.geom.Point;
import hxlr.enums.Physics;

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

	public static function saveToLocation()
	{
		var track = LRFileSystem.generateTrackStruct();
		
		#if sys
		
		File.saveAs(LRPKTrack.encode(track), {
			title : "Save a LRPK File",
			fileTypes : [
				{name : "OpenLR Package", extensions : ["lrpk"]},
			],
			defaultPath : './' + generateName()
		});
		
		#elseif js
		
		downloadJSFile(LRPKTrack.encode(track), generateName());
		
		#end
		
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
			
			title : "Load a Line Rider track",
			fileTypes : [
				{name : "OpenLR package", extensions : ["LRPK"]},
				{name : "JSON", extensions : ["json"]},
			],
			
		});
		
	}
	
	static function loadTrackFromStruct(_track:TrackStruct) {
		
		Main.CVAR.trackName = _track.label == null ? "Untitled" : _track.label;
		Main.CVAR.trackAuthor = _track.creator == null ? "Anonymous" : _track.creator;
		
		switch (_track.version)
		{
			case "6.2" :
				Grid.switchPhysicsModel(Physics.VERSION_6_2);
			case "6.1" :
				Grid.switchPhysicsModel(Physics.VERSION_6_1);
			case "6.0" :
				Grid.switchPhysicsModel(Physics.VERSION_6);
			default :
				Grid.switchPhysicsModel(Physics.VERSION_6_2);
		}
		
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