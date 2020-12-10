class PointAirFri extends Point
{
    var x, y, dx, dy, vx, vy, airFriction;
    function PointAirFri(__x, __y, __afr)
    {
        super();
        x = __x;
        y = __y;
        dx = 0;
        dy = 0;
        vx = 0;
        vy = 0;
        airFriction = __afr;
    } // End of the function
    function verlet(a)
    {
        dx = (x - vx) * airFriction + a.x;
        dy = (y - vy) * airFriction + a.y;
        vx = x;
        vy = y;
        x = x + dx;
        y = y + dy;
    } // End of the function
} // End of Class
