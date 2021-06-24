package components.ui.menu;

import components.Assets;
import components.io.SaveLoad;
import components.ui.menu.MenuBase;
import components.ui.menu.compontent.DialogOptions;
import components.ui.menu.compontent.MenuItem;
import hxlr.engine.Grid;

import h2d.TextInput;
import h2d.Object;
import h2d.Text;
import hxd.Event;
import hxd.res.DefaultFont;
import hxd.Event;

/**
 * ...
 * @author Kaelan
 */
class FileSettings extends Object 
{

	public var trackName:TextInput;
	public var trackAuthor:TextInput;
	public var trackDesc:TextInput;
	
	public var newTrackButton:DialogButton;
	public var newTrackBox:DialogOptions;
	public var loadTrackButton:DialogButton;
	public var loadTrackBox:DialogOptions;
	public var saveTrackButton:DialogButton;
	public var saveTrackBox:DialogOptions;
	
	public function new(?parent:Object) 
	{
		super(parent);
		
		newTrackButton = new DialogButton("New Track", this);
		newTrackButton.onClick = askNewTrack;
		newTrackButton.y = 5;
		newTrackButton.x = 5;
		
		loadTrackButton = new DialogButton("Load Track", this);
		loadTrackButton.onClick = loadTracPre;
		loadTrackButton.y = 5;
		loadTrackButton.x = newTrackButton.x + newTrackButton.width + 5;
		
		var infoLabel:Text = new Text(Assets.f_verdana_20, this);
		infoLabel.x = 5;
		infoLabel.y = newTrackButton.y + 40;
		infoLabel.text = "=== Track Info ===";
		
		trackName = new TextInput(Assets.f_verdana_16, this);
		trackName.x = 5;
		trackName.y = infoLabel.y + 25;
		trackName.maxWidth = 430;
		trackName.backgroundColor = 0x40080808;
		trackName.text = Main.CVAR.trackName;
		trackName.onChange = function() {
			Main.CVAR.trackName = trackName.text;
		}
		
		trackAuthor = new TextInput(Assets.f_verdana_16, this);
		trackAuthor.x = 5;
		trackAuthor.y = trackName.y + 20;
		trackAuthor.maxWidth = 430;
		trackAuthor.backgroundColor = 0x40080808;
		trackAuthor.text = Main.CVAR.trackAuthor;
		trackAuthor.onChange = function() {
			Main.CVAR.trackAuthor = trackAuthor.text;
		}
		
		/*trackDesc = new TextInput(DefaultFont.get(), this);
		trackDesc.x = 5;
		trackDesc.y = trackAuthor.y + 20;
		trackDesc.maxWidth = 430;
		trackDesc.selectionTile = Tile.fromColor(0x080808, 430, 430, 0.25);
		trackDesc.lineBreak = true;
		trackDesc.text = "Nondescript";*/
		
		saveTrackButton = new DialogButton("Save as", this);
		saveTrackButton.onClick = save;
		saveTrackButton.y = trackAuthor.y + 25;
		saveTrackButton.x = 5;
	}
	
	function update() {
		trackAuthor.text = Main.CVAR.trackAuthor;
		trackName.text = Main.CVAR.trackName;
	}
	
	function askNewTrack(_event:Event) {
		
		if (Main.CVAR.changes == 0) 
		{
			Main.canvas.trashTrack();
			Grid.deleteTrack();
			Main.menu.toggleOff();
			return;
		}
		
		MenuBase.disableEnv();
		
		newTrackBox = new DialogOptions("Are you sure you want to make a new track? This will wipe any unsaved changes!", ["Yes", "On second thought..."], Main.rootScene);
		newTrackBox.x = (Main.locengine.width / 2) - (330 / 2);
		newTrackBox.y = (Main.locengine.height / 2) - 50;
		
		newTrackBox.options[0].onClick = function(_event:Event) {
			newTrackBox.remove();
			MenuBase.enableEnv();
			
			Main.canvas.trashTrack();
			Grid.deleteTrack();
			Main.menu.toggleOff();
			
			Main.CVAR.changes = 0;
		}
		
		newTrackBox.options[1].onClick = function(_event:Event) {
			newTrackBox.remove();
			MenuBase.enableEnv();
		}
	}
	
	function loadTracPre(_event:Event) {
		
		if (Main.CVAR.changes == 0) 
		{
			SaveLoad.browseForSave(function() {
				MenuBase.enableEnv();
				
				Main.canvas.trashTrack();
				Grid.deleteTrack();
				Main.menu.toggleOff();
				
				update();
			});
			return;
		}
		
		MenuBase.disableEnv();
		
		loadTrackBox = new DialogOptions("Are you sure you want to load a track? Any unsaved changes will be lost!", ["Yes", "On second thought..."], Main.rootScene);
		
		loadTrackBox.x = (Main.locengine.width / 2) - (330 / 2);
		loadTrackBox.y = (Main.locengine.height / 2) - 50;
		
		loadTrackBox.options[0].onClick = function(_event:Event) {
			SaveLoad.browseForSave(function() {
				MenuBase.enableEnv();
				
				Main.canvas.trashTrack();
				Grid.deleteTrack();
				Main.menu.toggleOff();
				
				update();
				
			});
			
			loadTrackBox.remove();
			MenuBase.enableEnv();
		}
		
		loadTrackBox.options[1].onClick = function(_event:Event) {
			loadTrackBox.remove();
			MenuBase.enableEnv();
		}
	}
	
	function save(_event:Event) {
		
		if (Grid.lines.length > 0) {
			SaveLoad.saveToLocation();
		}
	}
}