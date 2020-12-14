package components.stage;

import components.lines.LineBase;
import components.lines.Floor;
import components.lines.Accel;
import components.lines.Scenery;
import components.managers.Grid;
import enums.LineDrawMode;
import h2d.Graphics;
import h2d.Object;
import h2d.Scene;
import h2d.col.Point;

/**
 * ...
 * @author Kaelan
 */
class Canvas extends Scene
{
	var rideLayer:Object;
	var sceneLayer:Object;
	var colorLayer:Object;
	
	public var sledderLayer:Object;
	
	public function new() 
	{
		super();
		
		sceneLayer = new Object(this);
		colorLayer = new Object(this);
		rideLayer = new Object(this);
		
		sledderLayer = new Object(this);
	}
	
	public function drawRiders() {
		for (rider in Main.riders.riders) {
			rider.drawContactPoints();
		}
	}
	
	var eraserSize:Int = 5;
	
	public function erase() {
		var gridChunk = Grid.registryPosition(mouseX, mouseY);
		var key:String = "";
		var invScale = 1 / scaleX;
		for (_x in -1...2) for (_y in -1...2) {
			key = 'x${_x + gridChunk.x}y${_y + gridChunk.y}';
			if (Main.grid.registry[key] == null) continue;
			var storage = Main.grid.registry[key];
			
			var mouse:Point = new Point(mouseX, mouseY);
			
			for (line in storage.colliders) {
				var _loc9 = invScale;
				var _loc1 = line;
                var _loc3 = mouseX - _loc1.start.x;
                var _loc2 = mouseY - _loc1.start.y;
                var _loc12 = Math.sqrt(Math.pow(_loc3, 2) + Math.pow(_loc2, 2));
                var _loc13 = Math.sqrt(Math.pow(mouseX - _loc1.end.x, 2) + Math.pow(mouseY - _loc1.end.y, 2));
                var _loc11 = Math.abs(_loc1.nx * _loc3 + _loc1.ny * _loc2);
                var _loc4 = (_loc3 * _loc1.dx + _loc2 * _loc1.dy) * _loc1.invSqrDistance;
                if (_loc12 < eraserSize * _loc9 || _loc13 < eraserSize * _loc9 || _loc11 < eraserSize * _loc9 && _loc4 >= 0 && _loc4 <= 1)
                {
					removeLine(line);
					continue;
				}
				
			}
			
			for (line in storage.nonColliders) {
				//crummy decompiler code
				var _loc9 = invScale;
				var _loc1 = line;
                var _loc3 = mouseX - _loc1.start.x;
                var _loc2 = mouseY - _loc1.start.y;
                var _loc12 = Math.sqrt(Math.pow(_loc3, 2) + Math.pow(_loc2, 2));
                var _loc13 = Math.sqrt(Math.pow(mouseX - _loc1.end.x, 2) + Math.pow(mouseY - _loc1.end.y, 2));
                var _loc11 = Math.abs(_loc1.nx * _loc3 + _loc1.ny * _loc2);
                var _loc4 = (_loc3 * _loc1.dx + _loc2 * _loc1.dy) * _loc1.invSqrDistance;
                if (_loc12 < eraserSize * _loc9 || _loc13 < eraserSize * _loc9 || _loc11 < eraserSize * _loc9 && _loc4 >= 0 && _loc4 <= 1)
                {
					removeLine(line);
					continue;
				}
			}
		}
	}
	
	public function addLine(_type:Int, _x1:Float, _y1:Float, _x2:Float, _y2:Float) {
		var line:LineBase = null;
		switch (_type) {
			case 0:
				line = new Floor(new Point(_x1, _y1), new Point(_x2, _y2), false);
				colorLayer.addChild(line.colorLayer);
			case 1 :
				line = new Accel(new Point(_x1, _y1), new Point(_x2, _y2), false);
				colorLayer.addChild(line.colorLayer);
			case 2 :
				line = new Scenery(new Point(_x1, _y1), new Point(_x2, _y2), false);
				sceneLayer.addChild(line.colorLayer);
			default :
				Main.console.log("New line creation error!", 0xFF0000);
				return;
		}
		rideLayer.addChild(line.rideLayer);
		line.render();
		line.visMode(EDIT);
		Main.grid.register(line);
	}
	
	public function removeLine(_line:LineBase) {
		Main.grid.unregister(_line);
		colorLayer.removeChild(_line.colorLayer);
		sceneLayer.removeChild(_line.colorLayer);
		rideLayer.removeChild(_line.rideLayer);
	}
}