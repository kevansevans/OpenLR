package components.ui.menus;

import components.sledder.Bosh;
import haxe.Json;
import haxe.io.Bytes;
import haxe.ui.backend.ImageData;
import haxe.ui.components.Button;
import haxe.ui.components.CheckBox;
import haxe.ui.containers.HBox;
import haxe.ui.containers.ListView;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.core.Screen;
import haxe.ui.data.DataSource;
import haxe.ui.events.UIEvent;
import hxd.File;
import hxd.Res;
import hxd.Save;
import hxlr.Common;
import hxlr.engine.Grid;
import hxlr.engine.RiderManager;
import hxlr.enums.LineType;
import hxlr.enums.Physics;
import hxlr.file.AMF0Track;
import hxlr.file.JSONTrack;
import hxlr.file.LRFileSystem;
import hxlr.file.LRPKTrack;
import hxlr.file.TrackStruct;
import hxlr.math.geom.Point;

#if sys
import sys.FileSystem;
#end
/**
 * ...
 * @author Kaelan
 */
class LoadMenu 
{
	public var box:Dialog;
	
	var trackList:ListView;
	var foundTracks:Array<String>;
	
	var skipScenery:CheckBox;
	
	var load:Button;
	var browse:Button;
	var delete:Button;
	
	public function new() 
	{
		box = new Dialog();
		box.title = "Load Track";
		box.destroyOnClose = false;
		
		box.width = 360;
		box.height = 330;
		
		trackList = new ListView();
		box.addComponent(trackList);
		trackList.width = 345;
		trackList.height = 240;
		
		skipScenery = new CheckBox();
		box.addComponent(skipScenery);
		skipScenery.text = "Skip scenery";
		
		var hboxload:HBox = new HBox();
		box.addComponent(hboxload);
		
		load = new Button();
		hboxload.addComponent(load);
		load.text = "Load";
		load.onClick = function(e:UIEvent)
		{
			if (trackList.selectedIndex == -1) return;
			else {
				Main.riderLayer.trashTrack();
				RiderManager.deleteAllRiders();
				Grid.deleteTrack();
				loadTrackFromList();
			}
		}
		
		delete = new Button();
		//hboxload.addComponent(delete);
		delete.text = "Delete";
		
		browse = new Button();
		hboxload.addComponent(browse);
		browse.text = "Browse";
		browse.onClick = function(e:UIEvent)
		{
			File.browse(function(item:BrowseSelect)
			{
				item.load(function(_data:Bytes) {
					box.hideDialog(DialogButton.OK);
					Main.riderLayer.trashTrack();
					RiderManager.deleteAllRiders();
					Grid.deleteTrack();
					
					switch (solveFileTypeByExtension(item.fileName))
						{
							case '.lrpk' :
								decodeLRPK(_data);
							case '.sol' :
								new AMF0Track(_data);
							case '.json':
								decodeJSON(_data.toString());
							default :
								throw "Kev what the fuck?";
						}
				});
			}, {
				title : "Load a Line Rider track",
				fileTypes : [	{name : 'OpenLR Package', extensions : ['lrpk']},
								//{name : 'AMF0/Beta 2', extensions : ['sol']},
								{name : 'JSON', extensions : ['json']}
				]
			});
		}
		
		populateList();
	}
	
	public function populateList()
	{
		foundTracks = [];
		trackList.dataSource.clear();
		
		#if js
		var numItems = js.Browser.window.localStorage.length;
		
		for (item in 0...numItems) {
			trackList.dataSource.add({
				item : '${js.Browser.window.localStorage.key(item)}',
				image: 'ui/lrpk.png',
				
			});
			foundTracks.push('${js.Browser.window.localStorage.key(item)}');
		}
		#else
		
		var path = LoadMenu.getSaveDirectory();
		var items:Array<String> = File.listDirectory(path + '/OpenLR/saves/');
		
		for (folder in items)
		{
			if (folder.indexOf(".lrpk") != -1 || folder.indexOf(".sol") != -1)
			{
				foundTracks.unshift(folder);
			} else {
				foundTracks.push(folder);
			}
		}
		
		foundTracks.reverse();
		
		for (track in foundTracks)
		{
			var fileIcon:String = solveFileTypeByExtension(track);
			fileIcon = fileIcon.substr(0, fileIcon.length - 1);
			
			trackList.dataSource.add({
				text : track,
				icon : 'ui/${fileIcon}.png',
				
			});
		}
		
		#end
		
	}
	
	#if sys
	public function populateDepth(_path:String)
	{
		trackList.dataSource = new DataSource();
		var items:Array<String> = File.listDirectory(_path);
		
		trackList.dataSource.add('<< Return <<');
		
		for (folder in items)
		{
			trackList.dataSource.add(folder);
		}
	}
	#end
	
	#if sys
	public static function getSaveDirectory():String {
        var platform:String = LRFileSystem.getPlatform();
        switch (platform)
        {
            #if sys
            case 'Windows' | 'Linux' | 'Mac' :
                var env = Sys.environment();
                switch (platform) {
                    case 'Windows' :
                        var dir = 'C:/users/${env['USERNAME']}/documents/';
                        if (!File.exists(dir + 'OpenLR')) {
                            File.createDirectory(dir + 'OpenLR');
                            File.createDirectory(dir + 'OpenLR/export');
                            File.createDirectory(dir + 'OpenLR/saves');
                        }
						return dir;
                    default :
                        return 'AAAAAHHHHH';
                }
            #end
            default:
                return 'ERROR: Unaccounted for environment, saving disabled!';
        }
        return 'ERROR: Unaccounted for environment, saving disabled!';
    }
	#end
	
	function solveFileTypeByExtension(_name:String):String
	{
		var fileExt5:String = _name.substr(_name.length - 5);
		
		if (fileExt5 == '.json' || fileExt5 == '.lrpk') return fileExt5;
		
		var fileExt4:String = _name.substr(_name.length - 4);
		
		if (fileExt4 == '.sol' || fileExt4 == '.trk') return fileExt4;
		
		return 'UNKNOWN';
	}
	
	function loadTrackFromList()
	{
		var item = foundTracks[trackList.selectedIndex];
		
		#if sys
			
			if (FileSystem.isDirectory(getSaveDirectory() + '/OpenLR/saves/${item}'))
			{
				var items = File.listDirectory(getSaveDirectory() + '/OpenLR/saves/${item}');
				File.load(getSaveDirectory() + '/OpenLR/saves/${item}/' + items[items.length - 1], 
					function(_data:Bytes) {
						
						switch (solveFileTypeByExtension(items[items.length - 1]))
						{
							case '.lrpk' :
								decodeLRPK(_data);
							case '.sol' :
								new AMF0Track(_data);
							default :
								throw "Kev what the fuck?";
						}
						
						box.hideDialog(DialogButton.OK);
					}
				,
					function(_error:String) {
						trace(_error);
					}
				);
			} else {
				File.load(getSaveDirectory() + '/OpenLR/saves/${item}', 
					function(_data:Bytes) {
						
						switch (solveFileTypeByExtension(item))
						{
							case '.lrpk' :
								decodeLRPK(_data);
							case '.sol' :
								new AMF0Track(_data);
							case '.json':
								decodeJSON(_data.toString());
							default :
								throw "Kev what the fuck?";
						}
						
						box.hideDialog(DialogButton.OK);
					}
				,
					function(_error:String) {
						trace(_error);
					}
				);
			}
			
		#elseif js
		
		var data:Null<Bytes> = Save.load(null, item, true);
		if (data != null)
		{
			decodeLRPK(data);
			box.hideDialog(DialogButton.OK);
		}
		
		#end
	}
	
	function decodeLRPK(_bytes:Bytes)
	{
		var track:TrackStruct = LRPKTrack.decode(_bytes, skipScenery.value);
		
		switch (track.version)
		{
			case "6.0" :
				Grid.switchPhysicsModel(Physics.VERSION_6);
			case "6.1" :
				Grid.switchPhysicsModel(Physics.VERSION_6_1);
			case "6.2" :
				Grid.switchPhysicsModel(Physics.VERSION_6_2);
			default :
				Grid.switchPhysicsModel(Physics.VERSION_6_2);
		}
		
		for (lineStruct in track.lines)
		{
			if (lineStruct == null) continue;
			
			var line = Grid.createLineFromStruct(lineStruct);
			Grid.register(line);
			Main.lineCanvas.addLine(line);
		}
		
		Main.lineCanvas.updateMesh();
		
		for (riderStruct in track.riders)
		{
			RiderManager.addNewRider(new Point(riderStruct.startPosition.x, riderStruct.startPosition.y), Bosh);
		}
	}
	
	function decodeJSON(_data:String)
	{
		var track:TrackStruct = cast(Json.parse(_data));
		
		switch (track.version)
		{
			case "6.0" :
				Grid.switchPhysicsModel(Physics.VERSION_6);
			case "6.1" :
				Grid.switchPhysicsModel(Physics.VERSION_6_1);
			case "6.2" :
				Grid.switchPhysicsModel(Physics.VERSION_6_2);
			default :
				Grid.switchPhysicsModel(Physics.VERSION_6_2);
		}
		
		track.lines.reverse();
		for (lineStruct in track.lines)
		{
			if (lineStruct == null) continue;
			if (lineStruct.type == SCENE && skipScenery.value) continue;
			
			var line = Grid.createLineFromStruct(lineStruct);
			Grid.register(line);
			Main.lineCanvas.addLine(line);
		}
		
		if (track.riders != null)
		{
			for (riderStruct in track.riders)
			{
				RiderManager.addNewRider(new Point(riderStruct.startPosition.x, riderStruct.startPosition.y), Bosh);
			}
		} else {
			RiderManager.addNewRider(new Point(track.startPosition.x, track.startPosition.y), Bosh);
		}
	}
	
}