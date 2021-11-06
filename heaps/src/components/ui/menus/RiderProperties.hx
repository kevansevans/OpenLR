package components.ui.menus;

import components.sledder.Bosh;
import h2d.Interactive;
import h2d.Object;
import haxe.ui.components.Button;
import haxe.ui.components.DropDown;
import haxe.ui.components.HorizontalSlider;
import haxe.ui.components.Label;
import haxe.ui.components.TabBar;
import haxe.ui.components.TextField;
import haxe.ui.containers.HBox;
import haxe.ui.containers.Header;
import haxe.ui.containers.TableView;
import haxe.ui.containers.VBox;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.core.ItemRenderer;
import haxe.ui.core.Screen;
import haxe.ui.data.DataSource;
import haxe.ui.events.UIEvent;
import haxe.ui.components.Column;

/**
 * ...
 * @author Kaelan
 */
class RiderProperties extends Object 
{
	
	public var box:Dialog;
	
	var activeRider:Bosh;
	var riderKeys:Array<String>;
	var riderIndex:Int = 0;
	
	var addRiderButton:Button;
	
	var nameField:TextField;
	
	var cameraBoxA:HBox;
	var cameraBoxB:HBox;
	var cameraRiding:DropDown;
	var cameraRidingFocus:DropDown;
	var cameraCrash:DropDown;
	var cameraCrashFocus:DropDown;
	
	var scarfBox:VBox;
		var scarfTop:HBox;
			var scarfTextLabel:Label;
			var scarfLength:HorizontalSlider;
		var scarfTable:TableView;
		var scarfAddRemoveBox:HBox;
			var colorColumn:Column;
			var addRemoveColumn:Column;
			var scarfAddColor:Button;
			var scarfRemoveColor:Button;


	public function new(?parent:Object, _index:Int = 0) 
	{
		super(parent);
		
		box = new Dialog();
		Screen.instance.addComponent(box);
		box.title = "Rider Properties";
		box.width = 300;
		box.height = 400;
		box.x = 10;
		box.y = 40;
		
		box.onDialogClosed = function(event:DialogEvent):Void
		{
			box = null;
		}
		
		getRiderKeys();
		
		//zeroRiderMode();
		//if (riderKeys.length > 0) riderEditMode(_index);
		
		riderEditMode(_index);
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
		activeRider = cast(Main.riders.riders[riderKeys[riderIndex]], Bosh);
		nameField.onChange = function(e:UIEvent)
		{
			activeRider = cast(Main.riders.riders[riderKeys[riderIndex]], Bosh);
			Main.riders.riders.remove(riderKeys[riderIndex]);
			riderKeys[riderIndex] = nameField.value;
			activeRider.name = nameField.value;
			activeRider.refreshRider();
			Main.riders.riders[riderKeys[riderIndex]] = activeRider;
		}
		
		cameraBoxA = new HBox();
		box.addComponent(cameraBoxA);
		cameraRiding = new DropDown();
		cameraRiding.text = "Camera Focus: All Points";
		cameraRidingFocus = new DropDown();
		cameraRidingFocus.visible = false;
		cameraBoxA.addComponent(cameraRiding);
		cameraBoxA.addComponent(cameraRidingFocus);
		cameraBoxB = new HBox();
		box.addComponent(cameraBoxB);
		cameraCrash = new DropDown();
		cameraCrash.text = "Crash Focus: Body";
		cameraCrashFocus = new DropDown();
		cameraCrashFocus.visible = false;
		cameraBoxB.addComponent(cameraCrash);
		cameraBoxB.addComponent(cameraCrashFocus);
		
		cameraRiding.dataSource.add("Camera Focus: All Points");
		cameraRiding.dataSource.add("Camera Focus: Body");
		cameraRiding.dataSource.add("Camera Focus: Sled");
		cameraRiding.dataSource.add("Camera Focus: Point");
		cameraCrash.dataSource.add("Crash Focus: All Points");
		cameraCrash.dataSource.add("Crash Focus: Body");
		cameraCrash.dataSource.add("Crash Focus: Sled");
		cameraCrash.dataSource.add("Crash Focus: Point");
		
		cameraRidingFocus.dataSource.add("Second Peg");
		cameraRidingFocus.dataSource.add("Tail");
		cameraRidingFocus.dataSource.add("Nose");
		cameraRidingFocus.dataSource.add("String");
		cameraRidingFocus.dataSource.add("Butt");
		cameraRidingFocus.dataSource.add("Shoulder");
		cameraRidingFocus.dataSource.add("Hand A");
		cameraRidingFocus.dataSource.add("Hand B");
		cameraRidingFocus.dataSource.add("Foot A");
		cameraRidingFocus.dataSource.add("Foot B");
		
		cameraCrashFocus.dataSource.add("Second Peg");
		cameraCrashFocus.dataSource.add("Tail");
		cameraCrashFocus.dataSource.add("Nose");
		cameraCrashFocus.dataSource.add("String");
		cameraCrashFocus.dataSource.add("Butt");
		cameraCrashFocus.dataSource.add("Shoulder");
		cameraCrashFocus.dataSource.add("Hand A");
		cameraCrashFocus.dataSource.add("Hand B");
		cameraCrashFocus.dataSource.add("Foot A");
		cameraCrashFocus.dataSource.add("Foot B");
		
		cameraRiding.onChange = function(e:UIEvent)
		{
			activeRider.cameraMode = cameraRiding.selectedIndex;
			
			switch (cameraRiding.selectedIndex)
			{
				case 0 | 1 | 2 :
					cameraRidingFocus.visible = false;
				case 3:
					cameraRidingFocus.visible = true;
			}
		}
		
		cameraCrash.onChange = function(e:UIEvent)
		{
			activeRider.crashCameraMode = cameraCrash.selectedIndex;
			
			switch (cameraCrash.selectedIndex)
			{
				case 0 | 1 | 2 :
					cameraCrashFocus.visible = false;
				case 3:
					cameraCrashFocus.visible = true;
			}
		}
		
		cameraRidingFocus.onChange = function(e:UIEvent)
		{
			activeRider.cameraFocusPoint = cameraRidingFocus.selectedIndex;
		}
		
		cameraCrashFocus.onChange = function(e:UIEvent)
		{
			activeRider.crashFocusPoint = cameraCrashFocus.selectedIndex;
		}
		
		scarfTable = new TableView();
		box.addComponent(scarfTable);
		
		scarfTable.height = 200;
		var scarfHeader:Header = new Header();
		var colorColumn:Column = new Column();
		colorColumn.id = "colorField";
		colorColumn.text = "Color";
		colorColumn.width = 120;
		scarfHeader.addComponent(colorColumn);
		var addRemoveColumn:Column = new Column();
		addRemoveColumn.id = "addRemove";
		addRemoveColumn.text = "Add/Remove";
		addRemoveColumn.width = 120;
		scarfHeader.addComponent(addRemoveColumn);
		
		var itemRenderer:ItemRenderer = new ItemRenderer();
		
		var colorField:TextField = new TextField();
		colorField.id = "colorField";
		var addRemoveButton:Button = new Button();
		addRemoveButton.id = "addRemove";
		itemRenderer.addComponent(colorField);
		itemRenderer.addComponent(addRemoveButton);
		
		scarfTable.addComponent(scarfHeader);
		scarfTable.addComponent(itemRenderer);
		
		var data:DataSource<Dynamic> = new DataSource();
		
		for (item in activeRider.colorList)
		{
			scarfTable.dataSource.add({
				
				colorField : StringTools.hex(item, 6),
				addRemove : "Remove"
				
			});
		}
		
	}
	
	
	function updateMenu(_index:Int)
	{
		
	}
	
}