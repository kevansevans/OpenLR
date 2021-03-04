package hxlr.math;

/**
 * ...
 * @author Kaelan
 */

#if heaps
typedef LRPoint = h2d.col.Point;
#else if openfl

#else
class LRPoint
{
	public var x:Float;
	public var y:Float;
	
	public function new(_x:Float = 0.0, _y:Float = 0.0) {
		x = _x;
		y = _y;
	}
	
	public function clone() {
		return new LRPoint(this.x, this.y);
	}
	
	public function add(_point:LRPoint):LRPoint {
		this.x += _point.x;
		this.y += _point.y;
		return this;
	}
	
	public function subtract(_point:LRPoint):LRPoint {
		this.x -= _point.x;
		this.y -= _point.y;
		return this;
	}
}
#end