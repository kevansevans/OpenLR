package hxlr.file;

import hxlr.engine.Grid;

#if sys
import sys.FileSystem;
#end

class LRFileSystem
{
    public static var savesEnabled:Bool;
    public static function getPlatform()
    {
        #if sys
            savesEnabled = true;
            return Sys.systemName();
        #elseif js
            savesEnabled = true;
            return 'JavaScript';
        #else
            savesEnabled = false;  
            return 'ERROR: Unaccounted for environment, saving disabled!'
        #end
    }
	
	public static function generateTrackStruct():TrackStruct {
		
		
		var save:TrackStruct = {
			label : Constants.CVAR.trackName,
			creator : Constants.CVAR.authorName,
			duration : 0,
			version : "6.2",
			startPosition : {
				x : 0,
				y : 0,
			},
			riders : [
				
			],
			lines : [],
			audio : null,
			layers : null
		}
		
		for (rider in Main.riders.riders) {
			save.riders.push(
				{
					startPosition : {x : rider.startPos.x, y : rider.startPos.y},
					startVelocity : {x : 0.4, y : 0},
					colorA : null,
					colorB : null,
					remountable : rider.remountable == true ? 1 : null
				}
			);
		}
		
		for (line in Grid.lines) {
			if (line == null) continue;
			save.lines.unshift(line.toLineStruct());
		}
		
		return save;
		
	}

}