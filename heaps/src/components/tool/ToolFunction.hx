package components.tool;

import hxlr.lines.LineObject;
import hxlr.enums.LineType;
import hxlr.engine.Grid;
import hxlr.engine.Cell;
import hxlr.Constants;
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
		
		var key:String = "";
		var invScale = 1 / Main.canvas.scaleX;
		
		for (_xg in -1...2) for (_yg in -1...2) {
			
			key = Cell.getInfo(_x + _xg, _y + _yg).key;
			
			if (Grid.registry[key] == null) continue;
			var storage = Grid.registry[key];
			
			for (line in storage.allLines) {
				
				if (line == null) continue;
				
                var _loc3 = _x - line.start.x;
                var _loc2 = _y - line.start.y;
                var _loc12 = Math.sqrt(Math.pow(_loc3, 2) + Math.pow(_loc2, 2));
                var _loc13 = Math.sqrt(Math.pow(_x - line.end.x, 2) + Math.pow(_y - line.end.y, 2));
                var _loc11 = Math.abs(line.nx * _loc3 + line.ny * _loc2);
                var _loc4 = (_loc3 * line.dx + _loc2 * line.dy) * line.invSqrDistance;
                if (_loc12 < eraserSize * invScale || _loc13 < eraserSize * invScale || _loc11 < eraserSize * invScale && _loc4 >= 0 && _loc4 <= 1)
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
							Main.canvas.removeVisLine(line);
							Grid.unregister(line);
							Main.CVAR.changes += 1;
						}
						
					} else {
						Main.canvas.removeVisLine(line);
						Grid.unregister(line);
						Main.CVAR.changes += 1;
					}
					continue;
				}
				
			}
		}
	}
}