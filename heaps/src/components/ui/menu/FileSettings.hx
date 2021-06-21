package components.ui.menu;

import components.Assets;
import components.ui.menu.MenuBase;
import components.ui.menu.compontent.DialogOptions;
import components.ui.menu.compontent.MenuItem;
import h3d.Vector;
import h2d.Bitmap;
import h2d.Object;
import h2d.Text;
import h2d.Tile;
import hxd.Res;

/**
 * ...
 * @author Kaelan
 */
class FileSettings extends Object 
{

	public var newTrackButton:MenuItem;
	public var newTrackBox:DialogOptions;
	
	public function new(?parent:Object) 
	{
		super(parent);
		
		newTrackButton = new MenuItem("New Track", this);
		newTrackButton.onClick = askNewTrack;
	}
	
	function askNewTrack() {
		MenuBase.disableEnv();
		
		newTrackBox = new DialogOptions("Are you sure you want to make a new track? This will wipe any unsaved changes!", ["Yes", "Save", "Cancel"], Main.rootScene);
		newTrackBox.x = (Main.locengine.width / 2) - (330 / 2);
		newTrackBox.y = (Main.locengine.height / 2) - 50;
	}
	
	
}