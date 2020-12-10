class FloorScenery extends FloorBase
{
    var x2, x1, dx, y2, y1, dy, C, invSqrDis, dst, nx, ny, x, y, hx, hy;
    function FloorScenery(_x1, _y1, _x2, _y2)
    {
        super(_x1, _y1, _x2, _y2);
        this.calculateConstants();
    } // End of the function
    function calculateConstants()
    {
        dx = x2 - x1;
        dy = y2 - y1;
        C = dy * x1 - dx * y1;
        var _loc3 = Math.pow(dx, 2) + Math.pow(dy, 2);
        invSqrDis = 1 / _loc3;
        dst = Math.sqrt(_loc3);
        var _loc2 = 1 / dst;
        nx = -dy * _loc2;
        ny = dx * _loc2;
        x = x1 + dx * 0.500000;
        y = y1 + dy * 0.500000;
        hx = Math.abs(dx) * 0.500000;
        hy = Math.abs(dy) * 0.500000;
    } // End of the function
    var type = 2;
} // End of Class
