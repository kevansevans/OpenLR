package components.ui;

import components.sledder.Bosh;
import components.stage.TextInfo;
import components.ui.menus.AboutMenu;
import components.ui.menus.LoadMenu;
import components.ui.menus.RiderProperties;
import components.ui.menus.SaveMenu;
import h2d.Bitmap;
import h2d.Object;
import haxe.ui.components.TextField;
import haxe.ui.containers.dialogs.Dialog.DialogButton;
import hxd.System;
import hxlr.Common;
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
import hxd.File;
import hxlr.engine.RiderManager;
import hxlr.file.LRPKTrack;
import hxlr.math.geom.Point;

/**
 * ...
 * @author Kaelan
 */
class MenuMain extends Object 
{
	public var about:AboutMenu;
	public var riderProp:RiderProperties;
	public var saveWindow:SaveMenu;
	public var loadWindow:LoadMenu;
	
	public var menubar:MenuBar;
		public var fileMenu:Menu;
			public var newItem:MenuItem;
			public var saveItem:MenuItem;
			public var loadItem:MenuItem;
			//=========================
			public var connectItem:MenuItem;
			public var hostItem:MenuItem;
			//=========================
			public var aboutItem:MenuItem;
		public var viewMenu:Menu;
			public var toolMenu:Menu;
				public var toolCurve:CheckBox;
				public var toolZoom:CheckBox;
				public var toolPan:CheckBox;
				//divider
				public var swatchSlow:CheckBox;
				public var swatchTrapdoor:CheckBox;
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
				public var angleSnapToggle:CheckBox;
				public var angleSnapValue:TextField;
			/////////////////////////////
			
	//////////
		
		public var blueSwatch:Button;
	
	public function toggle()
	{
		this.visible = !this.visible;
	}
	
	public function new(?_parent:Object) 
	{
		super(parent);
		
		Toolkit.theme = "dark";
		Toolkit.init({
			root: _parent
		});
		
		menubar = new MenuBar();
		Screen.instance.addComponent(menubar);
		menubar.onMenuOpened = function(e:UIEvent)
		{
			angleSnapValue.text = Main.toolControl.angleSnapValue + '';
		}
		menubar.onMenuClosed = function(e:UIEvent)
		{
		}
		
		fileMenu = new Menu();
		fileMenu.text = "File";
		
		newItem = new MenuItem();
		newItem.text = "New Track";
		newItem.onClick = function(event:MouseEvent)
		{
			for (line in Grid.lines)
			{
				if (line == null) continue;
				
				Main.lineCanvas.removeLine(line);
			}
			
			
			Main.riderLayer.trashTrack();
			Grid.deleteTrack();
			
			RiderManager.deleteAllRiders();
			RiderManager.addNewRider(new Point(0, 0), Bosh);
			
			Common.CVAR.changes = 0;
			
			Main.lineCanvas.updateMesh();
		}
		
		saveItem = new MenuItem();
		saveItem.text = "Save Track...";
		
		saveItem.onClick = function(e:UIEvent)
		{
			if (saveWindow == null) saveWindow = new SaveMenu();
			Screen.instance.addComponent(saveWindow.box);
		}
		
		loadItem = new MenuItem();
		loadItem.text = "Load Track";
		loadItem.onClick = function(event:MouseEvent)
		{
			if (loadWindow == null) loadWindow = new LoadMenu();
			Screen.instance.addComponent(loadWindow.box);
			loadWindow.populateList();
		}
		
		connectItem = new MenuItem();
		connectItem.text = "Connect";
		
		hostItem = new MenuItem();
		hostItem.text = "Host";
		
		aboutItem = new MenuItem();
		aboutItem.text = "Visit repository";
		aboutItem.onClick = function(e:UIEvent)
		{
			System.openURL("https://github.com/kevansevans/OpenLR");
		}
		
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
			if (riderProp == null || riderProp.box == null) riderProp = new RiderProperties();
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
		
		angleSnapToggle = new CheckBox();
		angleSnapToggle.text = "Enabled";
		angleSnapToggle.value = false;
		angleSnapToggle.onChange = function(e:UIEvent)
		{
			Main.toolControl.angleSnapping = angleSnapToggle.value;
		}
		
		angleSnapValue = new TextField();
		angleSnapValue.text = "90";
		angleSnapValue.onChange = function(e:UIEvent)
		{
			var angle:Null<Float> = Std.parseFloat(angleSnapValue.value);
			if (Math.isNaN(angle) || angle < 1 || angle > 360)
			{
				angleSnapValue.backgroundColor = 0x7F0000;
			} else {
				angleSnapValue.backgroundColor = null;
				Main.toolControl.angleSnapValue = Math.min(Math.max(angle, 0), 360);
			}
		}
		
		/*blueSwatch = new Button();
		blueSwatch.borderColor = 0x0066FF;
		blueSwatch.width = 35;
		blueSwatch.height = 35;
		blueSwatch.horizontalAlign = HorizontalAlign.CENTER;*/
		
		menubar.addComponent(fileMenu);
			fileMenu.addComponent(newItem);
			fileMenu.addComponent(saveItem);
			fileMenu.addComponent(loadItem);
			#if debug
			fileMenu.addComponent(new MenuSeparator());
			fileMenu.addComponent(connectItem);
			fileMenu.addComponent(hostItem);
			fileMenu.addComponent(new MenuSeparator());
			fileMenu.addComponent(aboutItem);
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
			#if debug
			editingMenu.addComponent(riderPropItem);
			#end
			editingMenu.addComponent(new MenuSeparator());
			editingMenu.addComponent(lineSnapCheck);
			editingMenu.addComponent(gridSnapCheck);
			editingMenu.addComponent(snapMouseDown);
			editingMenu.addComponent(snapMouseMove);
			editingMenu.addComponent(xySnapMenu);
				xySnapMenu.addComponent(angleSnapToggle);
				xySnapMenu.addComponent(angleSnapValue);
			
			
		//////////
		
		//menubar.addComponent(blueSwatch);
	}
	
	public function resize() 
	{
		menubar.width = Main.locengine.width;
	}
}