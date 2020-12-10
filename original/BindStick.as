class BindStick extends BreakableStick
{
    var a, b, getRestLength, restLength, endurance;
    static var crash;
    function BindStick(_a, _b, _endurance)
    {
        super();
        a = _a;
        b = _b;
        this.getRestLength();
        endurance = _endurance * restLength * 0.500000;
    } // End of the function
    function satisfyDistance()
    {
        var _loc3 = a.x - b.x;
        var _loc4 = a.y - b.y;
        var _loc5 = Math.sqrt(_loc3 * _loc3 + _loc4 * _loc4);
        var _loc2 = (_loc5 - restLength) / _loc5 * 0.500000;
        if (_loc2 > endurance || BindStick.crash)
        {
            crash = true;
            return (true);
        } // end if
        var _loc6 = _loc3 * _loc2;
        var _loc7 = _loc4 * _loc2;
        a.x = a.x - _loc6;
        a.y = a.y - _loc7;
        b.x = b.x + _loc6;
        b.y = b.y + _loc7;
        return (false);
    } // End of the function
} // End of Class
