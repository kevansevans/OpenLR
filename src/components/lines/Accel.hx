package components.lines;

import components.physics.RidePoint;
import h2d.col.Point;

import enums.LineDrawMode;

import components.tool.ToolBehavior.LineColor;

/**
 * ...
 * @author Kaelan
 */
class Accel extends LineBase 
{
	public var accConst:Float = 0.1;
	var accx:Float;
	var accy:Float;
	
	public function new(_start:Point, _end:Point, _shift:Bool) 
	{
		super(_start, _end, _shift);
		
		type = ACCEL;
		
	}
	
	override public function render():Void 
	{
		rideLayer.clear();
		colorLayer.clear();
		
		rideLayer.x = colorLayer.x = start.x;
		rideLayer.y = colorLayer.y = start.y;
		
		var x_offset:Float = nx > 0 ? Math.ceil(nx) : Math.floor(nx);
		var y_offset:Float = ny > 0 ? Math.ceil(ny) : Math.floor(ny);
		
		colorLayer.lineStyle(2, 0xCC0000, 0.75);
		colorLayer.moveTo(0 + x_offset, 0 + y_offset);
		colorLayer.lineTo(gfxEnd.x + x_offset, gfxEnd.y + y_offset);
		colorLayer.lineTo(gfxEnd.x + (nx * 4 - dx * invDistance * 5), gfxEnd.y + (ny * 4 - dy * invDistance * 5));
		colorLayer.lineTo(gfxEnd.x - dx * invDistance * 5, gfxEnd.y - dy * invDistance * 5);
		
		rideLayer.lineStyle(2, 0);
		rideLayer.moveTo(0, 0);
		rideLayer.lineTo(gfxEnd.x, gfxEnd.y);
		rideLayer.drawCircle(0, 0, lineCapRadius, lineCapSegment);
		rideLayer.drawCircle(gfxEnd.x, gfxEnd.y, lineCapRadius, lineCapSegment);
	}
	
	override function calculateConstants():Void 
	{
		super.calculateConstants();
		
		accx = ny * accConst * (shifted ? 1 : -1);
		accy = nx * accConst * (shifted ? -1 : 1);
	}
	
	override public function collide(_point:RidePoint):Void 
	{
		//crappy decompiler code
		var _loc5 = _point.pos.x - start.x;
		var _loc6 = _point.pos.y - start.y;
		var _loc4 = nx * _loc5 + ny * _loc6;
		var _loc7 = (_loc5 * dx + _loc6 * dy) * invSqrDistance;
		if (_point.dir.x * nx + _point.dir.y * ny > 0)
		{
			if (_loc4 > 0 && _loc4 < zone && _loc7 >= limStart && _loc7 <= limEnd) {
				_point.pos.x -= (_loc4 * nx);
				_point.pos.y -= (_loc4 * ny);
				_point.vel.x = _point.vel.x + ny * _point.friction * _loc4 * (_point.vel.x < _point.pos.x ? 1 : -1) + accx;
				_point.vel.y = _point.vel.y - nx * _point.friction * _loc4 * (_point.vel.y < _point.pos.y ? -1 : 1) + accy;
			}
		}
	}
}