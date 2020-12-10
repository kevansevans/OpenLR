class Shal extends Stick
{
    var a, b, getRestLength, restLength;
    function Shal(_a, _b)
    {
        super();
        a = _a;
        b = _b;
        this.getRestLength();
    } // End of the function
    function satisfyDistance()
    {
        var _loc2 = a.x - b.x;
        var _loc3 = a.y - b.y;
        var _loc4 = Math.sqrt(_loc2 * _loc2 + _loc3 * _loc3);
        var _loc5 = (_loc4 - restLength) / _loc4;
        var _loc6 = _loc2 * _loc5;
        var _loc7 = _loc3 * _loc5;
        b.x = b.x + _loc6;
        b.y = b.y + _loc7;
    } // End of the function
} // End of Class
