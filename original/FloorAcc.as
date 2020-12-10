class FloorAcc extends FloorBase
{
    var inv, __set__lim, x2, x1, dx, y2, y1, dy, C, invSqrDis, dst, invDst, nx, ny, x, y, hx, hy, accx, accy, LIM, __get__lim, prevLine, nextLine, _lim1, _lim2, poot, parent;
    function FloorAcc(_x1, _y1, _x2, _y2, _inv, _lim)
    {
        super(_x1, _y1, _x2, _y2);
        inv = _inv;
        this.calculateConstants();
        this.__set__lim(_lim == undefined ? (0) : (_lim));
    } // End of the function
    function calculateConstants()
    {
        dx = x2 - x1;
        dy = y2 - y1;
        C = dy * x1 - dx * y1;
        var _loc2 = Math.pow(dx, 2) + Math.pow(dy, 2);
        invSqrDis = 1 / _loc2;
        dst = Math.sqrt(_loc2);
        invDst = 1 / dst;
        nx = dy * invDst * (inv ? (1) : (-1));
        ny = dx * invDst * (inv ? (-1) : (1));
        x = x1 + dx * 0.500000;
        y = y1 + dy * 0.500000;
        hx = Math.abs(dx) * 0.500000;
        hy = Math.abs(dy) * 0.500000;
        accx = ny * FloorAcc.ACC * (inv ? (1) : (-1));
        accy = nx * FloorAcc.ACC * (inv ? (-1) : (1));
        LIM = Math.min(0.250000, FloorBase.zone / dst);
    } // End of the function
    function addPrevLine(line, extend)
    {
        if (extend && line.type == 1)
        {
            switch (this.__get__lim())
            {
                case 0:
                {
                    this.__set__lim(1);
                    break;
                } 
                case 2:
                {
                    this.__set__lim(3);
                    break;
                } 
            } // End of switch
        } // end if
        prevLine = line.name;
    } // End of the function
    function addNextLine(line, extend)
    {
        if (extend && line.type == 1)
        {
            switch (this.__get__lim())
            {
                case 0:
                {
                    this.__set__lim(2);
                    break;
                } 
                case 1:
                {
                    this.__set__lim(3);
                    break;
                } 
            } // End of switch
        } // end if
        nextLine = line.name;
    } // End of the function
    function colide(dot)
    {
        var _loc5 = dot.x - x1;
        var _loc6 = dot.y - y1;
        var _loc4 = nx * _loc5 + ny * _loc6;
        var _loc7 = (_loc5 * dx + _loc6 * dy) * invSqrDis;
        if (dot.dx * nx + dot.dy * ny > 0)
        {
            if (_loc4 > 0 && _loc4 < FloorBase.zone && _loc7 >= _lim1 && _loc7 <= _lim2)
            {
                dot.x = dot.x - _loc4 * nx;
                dot.y = dot.y - _loc4 * ny;
                dot.vx = dot.vx + ny * dot.friction * _loc4 * (dot.vx < dot.x ? (1) : (-1)) + accx;
                dot.vy = dot.vy - nx * dot.friction * _loc4 * (dot.vy < dot.y ? (-1) : (1)) + accy;
                if (_root.globalFoolBool == true)
                {
                    poot = new Sound(this);
                    poot.attachSound("pootis");
                    poot.start(0, 99);
                } // end if
                if (_root.hitTestBool)
                {
                    this.renderLine();
                } // end if
                return (true);
            } // end if
        } // end if
    } // End of the function
    function renderLine()
    {
        parent.clear();
        parent.lineStyle(4 * _root.SCALEDOWN, 13369344, 100, false, "normal", "round");
        parent.moveTo(x1, y1);
        parent.lineTo(x2, y2);
        parent.cacheAsBitmap = true;
    } // End of the function
    static var ACC = 0.100000;
    var type = 1;
} // End of Class
