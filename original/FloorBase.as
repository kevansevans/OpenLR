class FloorBase
{
    var x1, y1, x2, y2, grids, _lim1, _lim2, LIM, __lim, __get__lim, __set__lim;
    function FloorBase(_x1, _y1, _x2, _y2)
    {
        x1 = _x1;
        y1 = _y1;
        x2 = _x2;
        y2 = _y2;
        grids = [];
    } // End of the function
    function set lim(input)
    {
        switch (input)
        {
            case 0:
            {
                _lim1 = 0;
                _lim2 = 1;
                break;
            } 
            case 1:
            {
                _lim1 = -LIM;
                _lim2 = 1;
                break;
            } 
            case 2:
            {
                _lim1 = 0;
                _lim2 = 1 + LIM;
                break;
            } 
            case 3:
            {
                _lim1 = -LIM;
                _lim2 = 1 + LIM;
                break;
            } 
        } // End of switch
        __lim = input;
        null;
        null;
        null;
        null;
        null;
        //return (this.lim());
        null;
    } // End of the function
    function get lim()
    {
        return (__lim);
    } // End of the function
    static var zone = 10;
} // End of Class
