class RepellStick extends Stick
{
    var a, b, getRestLength, restLength;
    function RepellStick(_a, _b)
    {
        super();
        a = _a;
        b = _b;
        this.getRestLength();
    } // End of the function
    function satisfyDistance()
    {
        var _loc3 = a.x - b.x;
        var _loc4 = a.y - b.y;
        var _loc2 = Math.sqrt(_loc3 * _loc3 + _loc4 * _loc4);
        if (_loc2 < restLength)
        {
            var _loc5 = (_loc2 - restLength) / _loc2 * 0.500000;
            var _loc6 = _loc3 * _loc5;
            var _loc7 = _loc4 * _loc5;
            a.x = a.x - _loc6;
            a.y = a.y - _loc7;
            b.x = b.x + _loc6;
            b.y = b.y + _loc7;
        } // end if
    } // End of the function
} // End of Class
