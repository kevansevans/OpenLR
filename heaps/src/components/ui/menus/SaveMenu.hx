package components.ui.menus;

import haxe.ui.components.Button;
import haxe.ui.components.CheckBox;
import haxe.ui.components.Label;
import haxe.ui.components.TextField;
import haxe.ui.containers.HBox;
import haxe.ui.containers.VBox;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.containers.properties.PropertyGroup;
import haxe.ui.containers.properties.Property.PropertyBuilder;
import haxe.ui.core.Screen;
import haxe.ui.events.UIEvent;
import hxd.File;
import hxd.Save;
import hxlr.file.LRFileSystem;
import hxlr.file.LRPKTrack;
import hxlr.file.TrackStruct;
import hxlr.Common;
import haxe.io.Bytes;

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
class SaveMenu 
{
	public var box:Dialog;
	public var warning:Dialog;
	
	public var trackName:TextField;
	public var authorName:TextField;
	
	public var advancedSettings:PropertyGroup;
	
	public var saveNoPrompt:Button;
	public var saveToLocation:Button;
	
	public var skipScenery:CheckBox;
	
	public function new() 
	{
		box = new Dialog();
		box.title = "Save Track";
		box.destroyOnClose = false;
		
		box.width = 400;
		box.height = 200;
		
		var hboxRoot:HBox = new HBox();
		box.addComponent(hboxRoot);
		
		var left:VBox = new VBox();
		hboxRoot.addComponent(left);
		
		var right:VBox = new VBox();
		hboxRoot.addComponent(right);
		
		var labelTrackName:Label = new Label();
		left.addComponent(labelTrackName);
		labelTrackName.text = "Track name: ";
		
		trackName = new TextField();
		left.addComponent(trackName);
		trackName.text = Common.CVAR.trackName;
		
		var labelAuthorName:Label = new Label();
		left.addComponent(labelAuthorName);
		labelAuthorName.text = "Author name: ";
		
		authorName = new TextField();
		left.addComponent(authorName);
		authorName.text = Common.CVAR.authorName;
		
		var saveRow:HBox = new HBox();
		box.addComponent(saveRow);
		
		saveNoPrompt = new Button();
		saveNoPrompt.text = "Save";
		saveRow.addComponent(saveNoPrompt);
		saveNoPrompt.onClick = function(e:UIEvent)
		{
			promptlessSave();
			box.hideDialog(DialogButton.OK);
		}
		
		saveToLocation = new Button();
		saveToLocation.text = "Save as...";
		saveRow.addComponent(saveToLocation);
		saveToLocation.onClick = function(e:UIEvent)
		{
			saveFileAs();
		}
		
		skipScenery = new CheckBox();
		right.addComponent(skipScenery);
		skipScenery.text = "Skip scenery lines";
	}
	
	function promptlessSave():Void 
	{
		var track:TrackStruct = LRFileSystem.generateTrackStruct(skipScenery.value);
		track.label = Common.CVAR.trackName = trackName.value;
		track.creator = Common.CVAR.authorName = authorName.value;
		
		#if sys
		var directory:String = getSaveDirectory();
		
		if (!File.exists(directory + 'OpenLR/saves/${track.label}/'))
		{
			File.createDirectory(directory + 'OpenLR/saves/${Common.CVAR.trackName}');
			Common.CVAR.trackDir = directory + 'OpenLR/saves/${track.label}/';
		} 
		else 
		{
			warning = new Dialog();
			Screen.instance.addComponent(warning);
			box.visible = false;
		}
		
		var trackName = generateName();
		File.saveBytes(directory + 'OpenLR/saves/${Common.CVAR.trackName}/${trackName}.lrpk', LRPKTrack.encode(track));
		
		#elseif js
		
		Save.save(LRPKTrack.encode(track), track.label, true);
		
		#end
	}
	
	function saveFileAs():Void 
	{
		var track:TrackStruct = LRFileSystem.generateTrackStruct(skipScenery.selected);
		
		track.label = trackName.value;
		track.creator = authorName.value;
		
		File.saveAs(LRPKTrack.encode(track), {
			title : "Save Track as",
			defaultPath : '/${track.label}.lrpk',
			saveFileName : finalize,
			fileTypes : [{name : "OpenLR Package", extensions : ['lrpk']}]
		});
	}
	
	function finalize(string:String):Void
	{
		Common.CVAR.trackName = trackName.value;
		Common.CVAR.authorName = authorName.value;
		
		box.visible = false;
		box = null;
	}
	
	static function generateName():String {
		var date:String = '${Date.now().getDay()}_${Date.now().getMonth()}_${Date.now().getFullYear()}.${Date.now().getTime()}';
		var name = '${Common.CVAR.trackName}.${Common.CVAR.authorName}.${date}';
		return name;
	}
	
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
	
}