package components.ui.menus;

import haxe.ui.components.Button;
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
import hxlr.file.LRFileSystem;
import hxlr.file.TrackStruct;
import hxlr.Constants;
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
	
	public var trackName:TextField;
	public var authorName:TextField;
	
	public var advancedSettings:PropertyGroup;
	
	public var saveNoPrompt:Button;
	public var saveToLocation:Button;
	
	public function new() 
	{
		box = new Dialog();
		box.title = "Save Track";
		Screen.instance.addComponent(box);
		
		box.width = 400;
		box.height = 200;
		
		box.onDialogClosed = function(event:DialogEvent):Void
		{
			box = null;
		}
		
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
		trackName.text = Constants.CVAR.trackName;
		
		var labelAuthorName:Label = new Label();
		left.addComponent(labelAuthorName);
		labelAuthorName.text = "Author name: ";
		
		authorName = new TextField();
		left.addComponent(authorName);
		authorName.text = Constants.CVAR.authorName;
		
		var saveRow:HBox = new HBox();
		box.addComponent(saveRow);
		
		saveNoPrompt = new Button();
		saveNoPrompt.text = "Save";
		saveRow.addComponent(saveNoPrompt);
		saveNoPrompt.onClick = function(e:UIEvent)
		{
			promptlessSave();
		}
		
		saveToLocation = new Button();
		saveToLocation.text = "Save as...";
		saveRow.addComponent(saveToLocation);
	}
	
	function promptlessSave():Void 
	{
		#if sys
		
		var track:TrackStruct = LRFileSystem.generateTrackStruct();
		var directory:String = getSaveDirectory();
		
		if (!File.exists(directory + 'OpenLR/saves/${track.label}/'))
		{
			trace("nuh");
		} else {
			trace("yuh");
		}
		
		#elseif js
		
		#end
	}
	
	static function generateName():String {
		var date:String = '${Date.now().getDay()}_${Date.now().getMonth()}_${Date.now().getFullYear()}.${Date.now().getTime()}';
		var name = '${Constants.CVAR.trackName}.${Constants.CVAR.authorName}.${date}.json';
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