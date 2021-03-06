package components.tool;

import hxlr.lines.LineBase;
import hxlr.enums.LineType;
import h2d.col.Point;
import components.managers.Grid;
import components.stage.Canvas.DrawMode;

/**
 * ...
 * @author Kaelan
 */
class ToolFunction 
{
	public static var eraserSize:Float = 5;
	
	public static var erase:(Float, Float) -> Void = eraseDefault;
	public static function eraseDefault(_x:Float, _y:Float) {
		
		var gridChunk = Grid.registryPosition(_x, _y);
		
		var key:String = "";
		var invScale = 1 / Main.canvas.scaleX;
		
		for (_xg in -1...2) for (_yg in -1...2) {
			
			key = 'x${_xg + gridChunk.x}y${_yg + gridChunk.y}';
			
			if (Main.grid.registry[key] == null) continue;
			var storage = Main.grid.registry[key];
			
			for (line in storage.allLines) {
				
				var _loc9 = invScale;
				var _loc1 = line;
                var _loc3 = _x - _loc1.start.x;
                var _loc2 = _y - _loc1.start.y;
                var _loc12 = Math.sqrt(Math.pow(_loc3, 2) + Math.pow(_loc2, 2));
                var _loc13 = Math.sqrt(Math.pow(_x - _loc1.end.x, 2) + Math.pow(_y - _loc1.end.y, 2));
                var _loc11 = Math.abs(_loc1.nx * _loc3 + _loc1.ny * _loc2);
                var _loc4 = (_loc3 * _loc1.dx + _loc2 * _loc1.dy) * _loc1.invSqrDistance;
                if (_loc12 < eraserSize * _loc9 || _loc13 < eraserSize * _loc9 || _loc11 < eraserSize * _loc9 && _loc4 >= 0 && _loc4 <= 1)
                {
					if (Main.toolControl.colorEraser) {
						
						var type:LineType = LineType.NULL;
						switch (Main.toolControl.color) {
							case 0:
								type = LineType.FLOOR;
							case 1:
								type = LineType.ACCEL;
							case 2:
								type = LineType.SCENE;
						}
						
						if (line.type == type) {
							tryDispose(line);
						}
						
					} else {
						tryDispose(line);
					}
					continue;
				}
				
			}
		}
	}
	
	public static function tryDispose(_line:LineBase) {
		
		switch (Main.canvas.drawMode) {
			case FULL_EDIT | PLAYBACK :
				Main.grid.unregister(_line);
			case NO_SCENERY_EDIT | NO_SCENERY_PLAYBACK :
				if (_line.type != LineType.SCENE) {
					Main.grid.unregister(_line);
				}
			case SCENERY_EDIT | SCENERY_PLAYBACK :
				if (_line.type == LineType.SCENE) {
					Main.grid.unregister(_line);
				}
		}
		
	}
}