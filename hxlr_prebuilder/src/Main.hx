package;

import sys.FileSystem;
import sys.io.File;

/**
 * ...
 * @author Kaelan
 */
class Main 
{
	
	static function main() 
	{
		new Main();
	}
	
	var classTracker:Array<String>;
	var classCount:Int = 0;
	public function new() {
		
		var rootdir:String = FileSystem.fullPath("../../");
		var listing:Array<String> = FileSystem.readDirectory(rootdir);
		
		if (!listing.contains("library")) {
			trace("OpenLR library folder not found. Cannot generate files");
			return;
		}
		
		classTracker = new Array();
		
		recursiveDirectorySearch(rootdir + 'library/src/hxlr/', "hxlr.");
		
		var hxml:String = "-cp src\n";
		hxml += '\n';
		for (item in classTracker) {
			hxml += item + "\n";
		}
		hxml += '\n';
		hxml += '--each\n';
		hxml += '--js bin/js/hxlr.js\n';
		hxml += '--next\n';
		hxml += '-D lua_vanilla\n';
		hxml += '--lua bin/lua/hxlr.lua\n';
		hxml += '--next\n';
		hxml += '--python bin/python/hxlr.py\n';
		hxml += '--next\n';
		hxml += '--java bin/java/\n';
		hxml += '--next\n';
		hxml += '--jvm bin/jvm/hxlr.jar\n';
		hxml += '--next\n';
		hxml += '--cs bin/cs/\n';
		hxml += '--next\n';
		hxml += '--cpp bin/cpp/\n';
		
		Sys.setCwd(rootdir + '/library/');
		File.saveContent('build.hxml', hxml);
		Sys.command("haxe build.hxml");
	}
	
	function recursiveDirectorySearch(_dir:String, _depth:String):Void 
	{
		
		var items:Array<String> = FileSystem.readDirectory(_dir);
		
		for (item in items) {
			
			if (item.split('.').length > 1) {
				classTracker[classCount] = _depth + item.split('.')[0];
				++classCount;
			} else {
				recursiveDirectorySearch(_dir + item + '/', _depth + item + '.');
			}
		}
	}
}