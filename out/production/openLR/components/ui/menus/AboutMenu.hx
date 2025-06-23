package components.ui.menus;

import haxe.ui.components.Button;
import haxe.ui.components.TextArea;
import haxe.ui.components.TextField;
import haxe.ui.containers.TabView;
import haxe.ui.containers.VBox;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.core.Screen;
import haxe.ui.core.TextInput;
import hxd.Res;

/**
 * ...
 * @author Kaelan
 */
class AboutMenu 
{
	public var box:Dialog;
	var tabs:TabView;
	
	var mainAbout:VBox;
	var mainText:TextArea;
	var mainVisit:Button;
	
	public function new() 
	{
		box = new Dialog();
		Screen.instance.addComponent(box);
		box.width = 500;
		box.height = 400;
		box.title = "About OpenLR";
		box.destroyOnClose = false;
		
		tabs = new TabView();
		box.addComponent(tabs);
		tabs.width = 480;
		tabs.height = 360;
		
		mainAbout = new VBox();
		mainAbout.text = "Welcome!";
		tabs.addComponent(mainAbout);
		
		mainText = new TextArea();
		mainAbout.addComponent(mainText);
		mainText.width = 460;
		mainText.height = 240;
		mainText.wrap = true;
		mainText.text = 'Welcome to OpenLR! OpenLR is a free and open source port of Line Rider powered by Haxe, Heaps, and HXLR.\n\n"Line Rider" is a registered trademark of Boštjan Čadež.\nUse in OpenLR is in name only and granted within good faith.\n\nTo get started, draw some lines on the canvas, then press play at the bottom.\n\nMake tracks to your hearts content!\n\nHave fun!\n\nClick on the tabs to view open source license obligations.';
		
	}
	
}