package components.ui.menu;

import components.Assets;
import components.ui.menu.EditorSettings;
import components.ui.menu.FileSettings;
import components.ui.menu.NetworkSettings;
import h2d.Bitmap;
import h2d.Interactive;
import h2d.Object;
import h2d.Text;
import h2d.Tile;
import h3d.Vector;
import hxd.Cursor;
import hxd.Event;
import hxd.res.DefaultFont;
import components.ui.menu.compontent.MenuItem;

/**
 * ...
 * @author Kaelan
 */
class MenuBase extends Object 
{

	var blocker:Interactive;
	
	var active:MenuItem;
	var current:Object;
	var bar:Bitmap;
	
	var items:Array<MenuItem>;
	
	var file:MenuItem;
	var fileMenu:FileSettings;
	var editor:MenuItem;
	var editorMenu:EditorSettings;
	var rider:MenuItem;
	var playback:MenuItem;
	var advanced:MenuItem;
	var network:MenuItem;
	var networkMenu:NetworkSettings;
	var about:MenuItem;
	
	public var open:Bool = false;
	
	public function toggleOn() {
		Main.rootScene.addChild(this);
		open = true;
		resize();
	}
	
	public function toggleOff() {
		open = false;
		remove();
	}
	
	public static function enableEnv() {
		Main.toolbar.visible = true;
		Main.canvas_interaction.visible = true;
		Main.toolControl.updateCursor();
		Main.menu.visible = true;
		Main.timeline.visible = true;
	}
	
	public static function disableEnv() {
		Main.toolbar.visible = false;
		Main.canvas_interaction.visible = false;
		Main.canvas_interaction.cursor = Cursor.Default;
		Main.menu.visible = false;
		Main.timeline.visible = false;
	}
	
	public function new(?parent:Object) 
	{
		super(parent);
		
		items = new Array();
		blocker = new Interactive(450, 0, this);
		blocker.cursor = Cursor.Default;
		
		items.push(file = new MenuItem("File", this));
		items.push(editor = new MenuItem("Editor", this));
		items.push(rider = new MenuItem("Rider", this));
		items.push(playback = new MenuItem("Playback", this));
		items.push(advanced = new MenuItem("Advanced", this));
		items.push(about = new MenuItem("About", this));
		
		var size:Float = 0;
		
		for (item in items) {
			var index = items.indexOf(item);
			if (index == 0) {
				active = item;
				size += active.width;
				continue;
			} else {
				item.x = active.x + active.width;
				active = item;
				size += active.width;
			}
		}
		
		bar = new Bitmap(Tile.fromColor(0x595959, 450, Main.rootScene.height - 65));
		addChildAt(bar, 0);
		bar.alpha = 0.9;
		
		fileMenu = new FileSettings();
		current = fileMenu;
		active = file;
		switchTab(file);
		switchMenu(fileMenu);
		
		editorMenu = new EditorSettings();
		
		networkMenu = new NetworkSettings();
		
		file.onClick = function() {
			switchTab(file);
			switchMenu(fileMenu);
			resize();
			update();
		}
		
		editor.onClick = function() {
			switchTab(editor);
			switchMenu(editorMenu);
			resize();
			update();
		}
		rider.onClick = function() {
			switchTab(rider);
			resize();
			update();
		}
		playback.onClick = function() {
			switchTab(playback);
			resize();
			update();
		}
		advanced.onClick = function() {
			switchTab(advanced);
			resize();
			update();
		}
		about.onClick = function() {
			switchTab(about);
			resize();
			update();
		}
	}
	
	public function resize() {
		
		bar.tile = Tile.fromColor(0x595959, 450, Main.rootScene.height - 50);
		
		current.x = 5;
		current.y = 35;
		
		blocker.width = 450;
		blocker.height = Main.rootScene.height - 50;
		
	}
	
	function switchTab(_tab:MenuItem) {
		active.deactivate();
		_tab.activate();
		active = _tab;
	}
	
	function switchMenu(_menu:Object) {
		
		current.remove();
		addChild(_menu);
		current = _menu;
		
	}
	
	function update() {
		editorMenu.update();
	}
	
}