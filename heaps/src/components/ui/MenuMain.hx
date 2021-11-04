package components.ui;

import components.io.SaveLoad;
import components.stage.TextInfo;
import components.ui.menus.RiderProperties;
import h2d.Bitmap;
import h2d.Object;
import hxlr.engine.Grid;
import haxe.ui.backend.ImageData;
import haxe.ui.components.OptionBox;
import haxe.ui.constants.HorizontalAlign;
import haxe.ui.util.Variant;
import hxd.BitmapData;
import hxd.BitmapData.BitmapInnerData;
import hxd.Res;
import h2d.Tile;
import haxe.ui.components.Button;
import haxe.ui.components.CheckBox;
import haxe.ui.components.Label;
import haxe.ui.components.NumberStepper;
import haxe.ui.components.Stepper;
import haxe.ui.containers.menus.Menu;
import haxe.ui.containers.menus.MenuBar;
import haxe.ui.containers.menus.MenuItem;
import haxe.ui.containers.menus.MenuSeparator;
import haxe.ui.core.Screen;
import haxe.ui.events.Events;
import haxe.ui.events.MouseEvent;
import haxe.ui.events.UIEvent;
import haxe.ui.Toolkit;

/**
 * ...
 * @author Kaelan
 */
class MenuMain extends Object 
{
	public var riderProp:RiderProperties;
	
	public var menubar:MenuBar;
		public var fileMenu:Menu;
			public var newItem:MenuItem;
			public var saveItem:MenuItem;
			public var loadItem:MenuItem;
			//=========================
			public var connectItem:MenuItem;
			public var hostItem:MenuItem;
		public var viewMenu:Menu;
			public var textMenu:Menu;
				public var trackNameCheck:CheckBox;
				public var timeStampCheck:CheckBox;
				public var speedometerCheck:CheckBox;
				public var lineTotalCountCheck:CheckBox;
				public var lineCountCheck:CheckBox;
				public var frameRateCheck:CheckBox;
			public var gridMenu:Menu;
				public var gridDividersCheck:CheckBox; 
				public var gridOriginCheck:CheckBox; 
				public var gridSizeStepper:NumberStepper;
		public var editingMenu:Menu;
			public var riderPropItem:MenuItem;
			/////////////////////////////
			public var lineSnapCheck:CheckBox;
			public var gridSnapCheck:CheckBox;
			public var snapMouseDown:CheckBox;
			public var snapMouseMove:CheckBox;
			public var xySnapMenu:Menu;
				public var angleSnapOff:OptionBox;
				public var angleSnap90:OptionBox;
				public var angleSnap45:OptionBox;
				public var angleSnap15:OptionBox;
				//public var angleSnapArb:OptionBox; angle % value == 0;
			/////////////////////////////
			
	//////////
		
		public var blueSwatch:Button;
	
	public function toggle()
	{
		this.visible = !this.visible;
	}
	
	public function new(?parent:Object) 
	{
		super(parent);
		
		Toolkit.theme = "dark";
		Toolkit.init({
			root: Main.rootScene
		});
		
		menubar = new MenuBar();
		Screen.instance.addComponent(menubar);
		menubar.onMenuOpened = function(e:UIEvent)
		{
			Main.input.visible = false;
		}
		menubar.onMenuClosed = function(e:UIEvent)
		{
			Main.input.visible = true;
		}
		
		fileMenu = new Menu();
		fileMenu.text = "File";
		
		newItem = new MenuItem();
		newItem.text = "New Track";
		newItem.onClick = function(event:MouseEvent)
		{
			Main.canvas.trashTrack();
			Grid.deleteTrack();
		}
		
		saveItem = new MenuItem();
		#if js
		saveItem.text = "Save Track to file...";
		#else
		saveItem.text = "Save Track...";
		#end
		
		loadItem = new MenuItem();
		loadItem.text = "Load Track";
		loadItem.onClick = function(event:MouseEvent)
		{
			loadTrack();
		}
		
		connectItem = new MenuItem();
		connectItem.text = "Connect";
		
		hostItem = new MenuItem();
		hostItem.text = "Host";
		
		viewMenu = new Menu();
		viewMenu.text = "View";
		viewMenu.onClick = function(e:UIEvent)
		{
			gridSizeStepper.value = Main.ruler.rulerSize;
		}
		
		textMenu = new Menu();
		textMenu.text = "Text Info";
		
		trackNameCheck = new CheckBox();
		trackNameCheck.text = "Track name";
		trackNameCheck.value = true;
		trackNameCheck.onChange = function(e:UIEvent)
		{
			TextInfo.showTrackName = trackNameCheck.value;
		}
		
		timeStampCheck = new CheckBox();
		timeStampCheck.text = "Time stamp";
		timeStampCheck.value = true;
		timeStampCheck.onChange = function(e:UIEvent)
		{
			TextInfo.showTimeStamp = timeStampCheck.value;
		}
		
		speedometerCheck = new CheckBox();
		speedometerCheck.text = "Speedometer";
		speedometerCheck.value = true;
		speedometerCheck.onChange = function(e:UIEvent)
		{
			TextInfo.showSpeedometer = speedometerCheck.value;
		}
		
		lineTotalCountCheck = new CheckBox();
		lineTotalCountCheck.text = "Total line count";
		lineTotalCountCheck.value = true;
		lineTotalCountCheck.onChange = function(e:UIEvent)
		{
			TextInfo.showTotalLineCounts = lineTotalCountCheck.value;
		}
		
		lineCountCheck = new CheckBox();
		lineCountCheck.text = "Specific line count";
		lineCountCheck.value = true;
		lineCountCheck.onChange = function(e:UIEvent)
		{
			TextInfo.showLineCounts = lineCountCheck.value;
		}
		
		frameRateCheck = new CheckBox();
		frameRateCheck.text = "Frame rate";
		frameRateCheck.value = true;
		frameRateCheck.onChange = function(e:UIEvent)
		{
			TextInfo.showFrameRate = frameRateCheck.value;
		}
		
		gridMenu = new Menu();
		gridMenu.text = "Ruler";
		
		gridSizeStepper = new NumberStepper();
		gridSizeStepper.text = "Ruler Size";
		gridSizeStepper.min = 1;
		gridSizeStepper.max = 0x7FFFFFFF;
		gridSizeStepper.value = 14;
		gridSizeStepper.step = 1;
		gridSizeStepper.width = 200;
		gridSizeStepper.onChange = function(e:UIEvent)
		{
			var value:Null<Float> = Std.parseFloat("" + gridSizeStepper.value);
			if (value != null)
			{
				Main.ruler.rulerSize = Std.int(value);
			}
		}
		
		gridOriginCheck = new CheckBox();
		gridOriginCheck.value = true;
		gridOriginCheck.text = "Origin mark";
		gridOriginCheck.onChange = function(event:UIEvent)
		{
			Main.ruler.originEnabled = gridOriginCheck.value;
		}
		
		gridDividersCheck = new CheckBox();
		gridDividersCheck.value = true;
		gridDividersCheck.text = "Hatch marks";
		gridDividersCheck.onChange = function(event:UIEvent)
		{
			Main.ruler.hatchEnabled = gridDividersCheck.value;
		}
		
		editingMenu = new Menu();
		editingMenu.text = "Editing";
		
		riderPropItem = new MenuItem();
		riderPropItem.text = "Rider properties";
		riderPropItem.onClick = function(e:UIEvent)
		{
			if (riderProp == null || !riderProp.visible) riderProp = new RiderProperties();
		}
		
		lineSnapCheck = new CheckBox();
		lineSnapCheck.text = "Snap to lines";
		lineSnapCheck.value = true;
		lineSnapCheck.onChange = function(e:UIEvent)
		{
			Main.toolControl.lineSnapping = lineSnapCheck.value;
		}
		
		gridSnapCheck = new CheckBox();
		gridSnapCheck.text = "Snap to ruler";
		gridSnapCheck.onChange = function(e:UIEvent)
		{
			Main.toolControl.gridSnapping = gridSnapCheck.value;
		}
		
		snapMouseDown = new CheckBox();
		snapMouseDown.text = "Snap on mouse down";
		snapMouseDown.value = true;
		
		snapMouseMove = new CheckBox();
		snapMouseMove.text = "Snap on mouse move";
		snapMouseMove.value = true;
		
		xySnapMenu = new Menu();
		xySnapMenu.text = "Angle snap";
		
		angleSnapOff = new OptionBox();
		angleSnapOff.text = "Off";
		angleSnapOff.selected = true;
		angleSnapOff.componentGroup = "angleSnap";
		
		angleSnap90 = new OptionBox();
		angleSnap90.text = "90 Degrees (XY)";
		angleSnap90.componentGroup = "angleSnap";
		
		angleSnap45 = new OptionBox();
		angleSnap45.text = "45 Degrees (XYZ)";
		angleSnap45.componentGroup = "angleSnap";
		
		angleSnap15 = new OptionBox();
		angleSnap15.text = "15 degrees";
		angleSnap15.componentGroup = "angleSnap";
		
		/*blueSwatch = new Button();
		blueSwatch.borderColor = 0x0066FF;
		blueSwatch.width = 35;
		blueSwatch.height = 35;
		blueSwatch.horizontalAlign = HorizontalAlign.CENTER;*/
		
		menubar.addComponent(fileMenu);
			fileMenu.addComponent(newItem);
			//fileMenu.addComponent(saveItem);
			fileMenu.addComponent(loadItem);
			#if js
			fileMenu.addComponent(new MenuSeparator());
			fileMenu.addComponent(connectItem);
			fileMenu.addComponent(hostItem);
			#end
		menubar.addComponent(viewMenu);
			viewMenu.addComponent(textMenu);
				textMenu.addComponent(trackNameCheck);
				textMenu.addComponent(timeStampCheck);
				textMenu.addComponent(speedometerCheck);
				textMenu.addComponent(lineTotalCountCheck);
				textMenu.addComponent(lineCountCheck);
				textMenu.addComponent(frameRateCheck);
			viewMenu.addComponent(gridMenu);
				gridMenu.addComponent(gridOriginCheck);
				gridMenu.addComponent(gridDividersCheck);
				var gridLabel:Label = new Label();
				gridLabel.text = "Size";
				gridMenu.addComponent(gridLabel);
				gridMenu.addComponent(gridSizeStepper);
			viewMenu.addComponent(new MenuSeparator());
		menubar.addComponent(editingMenu);
			editingMenu.addComponent(riderPropItem);
			editingMenu.addComponent(new MenuSeparator());
			editingMenu.addComponent(lineSnapCheck);
			editingMenu.addComponent(gridSnapCheck);
			editingMenu.addComponent(snapMouseDown);
			editingMenu.addComponent(snapMouseMove);
			//editingMenu.addComponent(xySnapMenu);
				xySnapMenu.addComponent(angleSnapOff);
				xySnapMenu.addComponent(angleSnap90);
				xySnapMenu.addComponent(angleSnap45);
				xySnapMenu.addComponent(angleSnap15);
			
			
		//////////
		
		//menubar.addComponent(blueSwatch);
	}
	
	public function resize() 
	{
		menubar.width = Main.locengine.width;
	}
	
	function loadTrack()
	{
		SaveLoad.browseForSave();
	}
}