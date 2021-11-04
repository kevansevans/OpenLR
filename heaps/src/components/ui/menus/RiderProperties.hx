package components.ui.menus;

import h2d.Interactive;
import h2d.Object;
import haxe.ui.components.Button;
import haxe.ui.components.TextField;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.core.Screen;
import haxe.ui.events.UIEvent;
import hxd.Cursor;

/**
 * ...
 * @author Kaelan
 */
class RiderProperties extends Object 
{
	
	public var box:Dialog;
	
	var riderKeys:Array<String>;
	var riderIndex:Int = 0;
	
	var addRiderButton:Button;
	
	var nameField:TextField;

	public function new(?parent:Object, _index:Int = 0) 
	{
		super(parent);
		
		box = new Dialog();
		Screen.instance.addComponent(box);
		box.x = 10;
		box.y = 40;
		
		box.title = "Rider Properties";
		box.width = 300;
		box.height = 400;
		
		box.onDialogClosed = function(event:DialogEvent):Void
		{
			box = null;
		}
		
		getRiderKeys();
		
		zeroRiderMode();
		if (riderKeys.length > 0) riderEditMode(_index);
	}
	
	function getRiderKeys():Void 
	{
		riderKeys = new Array();
		for (key in Main.riders.riders.keys())
		{
			riderKeys.push(key);
		}
	}
	
	function zeroRiderMode()
	{
		addRiderButton = new Button();
		addRiderButton.text = "Add new rider";
		box.addComponent(addRiderButton);
	}
	
	function riderEditMode(_index:Int = 0)
	{
		riderIndex = _index;
		
		nameField = new TextField();
		box.addComponent(nameField);
		nameField.text = riderKeys[riderIndex];
		nameField.onChange = function(e:UIEvent)
		{
			var rider = Main.riders.riders[riderKeys[riderIndex]];
			Main.riders.riders.remove(riderKeys[riderIndex]);
			riderKeys[riderIndex] = nameField.value;
			rider.name = nameField.value;
			rider.refreshRider();
			Main.riders.riders[riderKeys[riderIndex]] = rider;
		}
	}
	
}