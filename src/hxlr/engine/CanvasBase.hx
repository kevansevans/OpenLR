package hxlr.engine;

import hxlr.math.geom.Point;

class CanvasBase
{

    public var offsetX:Float;
    public var offsetY:Float;
    public var scale:Float;

    public function new() 
    {
        offsetX = 0;
        offsetY = 0;
        scale = 0;
    }

    public function getMousePosition(_x:Float, _y:Float):Point
    {
        return new Point(offsetX + _x, offsetY + _y);
    }

}