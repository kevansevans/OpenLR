package components.ui.menu;

import h2d.CheckBox;
import h2d.Dropdown;
import h2d.Object;
import h2d.Text;
import h2d.Tile;
import h3d.Vector;
import hxd.Event;
import hxd.res.DefaultFont;
import components.stage.Canvas.DrawMode;

/**
 * ...
 * @author Kaelan
 */
class EditorSettings extends Object 
{

	var lineVisMode:Dropdown;
	var lineVisLock:CheckBox;
	
	public function new(?parent:Object) 
	{
		super(parent);
		
		lineVisMode = new Dropdown(this);
		lineVisMode.backgroundTile = Tile.fromColor(0xCCCCCC);
		lineVisMode.setScale(1.2);
		addDropdownTextItem(lineVisMode, "Edit");
		addDropdownTextItem(lineVisMode, "Playback");
		addDropdownTextItem(lineVisMode, "No Scenery, Edit");
		addDropdownTextItem(lineVisMode, "No Scenery, Playback");
		addDropdownTextItem(lineVisMode, "Scenery Only, Edit");
		addDropdownTextItem(lineVisMode, "Scenery Only, Playback");
		
		lineVisMode.selectedItem = 0;
		lineVisMode.onClose = function() {
			switch (lineVisMode.selectedItem) {
				case 0 :
					Main.canvas.set_drawMode(FULL_EDIT);
				case 1 :
					Main.canvas.set_drawMode(PLAYBACK);
				case 2 :
					Main.canvas.set_drawMode(NO_SCENERY_EDIT);
				case 3:
					Main.canvas.set_drawMode(NO_SCENERY_PLAYBACK);
				case 4:
					Main.canvas.set_drawMode(SCENERY_EDIT);
				case 5:
					Main.canvas.set_drawMode(SCENERY_PLAYBACK);
				default:
					Main.canvas.set_drawMode(FULL_EDIT);
			}
			Main.toolControl.updateCursor();
		}
		
		lineVisLock = new CheckBox(this);
		lineVisLock.y = lineVisMode.y + 30;
		lineVisLock.selected = false;
		lineVisLock.text = "Lock Invisible Lines";
		lineVisLock.onChange = function() {
			Main.canvas.lineVisLock = lineVisLock.selected;
			Main.toolControl.updateCursor();
		}
	}
	
	function addDropdownTextItem(_drop:Dropdown, _msg:String) {
		var a:Text = new Text(DefaultFont.get());
		a.text = _msg;
		a.color = new Vector();
		a.setScale(_drop.scaleX);
		_drop.addItem(a);
	}
	
	public function update() 
	{
		switch (Main.canvas.drawMode) {
			case FULL_EDIT :
				lineVisMode.selectedItem = 0;
			case PLAYBACK :
				lineVisMode.selectedItem = 1;
			case NO_SCENERY_EDIT :
				lineVisMode.selectedItem = 2;
			case NO_SCENERY_PLAYBACK :
				lineVisMode.selectedItem = 3;
			case SCENERY_EDIT :
				lineVisMode.selectedItem = 4;
			case SCENERY_PLAYBACK :
				lineVisMode.selectedItem = 5;
			default :
				lineVisMode.selectedItem = -1;
		}
	}
}