class Stick
{
    var a, b, restLength;
    function Stick(_a, _b)
    {
        a = _a;
        b = _b;
        this.getRestLength();
    } // End of the function
    function satisfyDistance()
    {
        var _loc2 = a.x - b.x;
        var _loc3 = a.y - b.y;
        var _loc4 = Math.sqrt(_loc2 * _loc2 + _loc3 * _loc3);
        var _loc5 = (_loc4 - restLength) / _loc4 * 0.500000;
        var _loc6 = _loc2 * _loc5;
        var _loc7 = _loc3 * _loc5;
        a.x = a.x - _loc6;
        a.y = a.y - _loc7;
        b.x = b.x + _loc6;
        b.y = b.y + _loc7;
    } // End of the function
    function getRestLength()
    {
        var _loc2 = a.x - b.x;
        var _loc3 = a.y - b.y;
        restLength = Math.sqrt(_loc2 * _loc2 + _loc3 * _loc3);
    } // End of the function
    function render(target)
    {
        target.moveTo(a.x, a.y);
        target.lineTo(b.x, b.y);
    } // End of the function
} // End of Class
