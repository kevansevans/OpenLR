class Point
{
    var x, y, dx, dy, vx, vy, friction, count, sx, sy, sdx, sdy, svx, svy;
    function Point(__x, __y, __fr, __co)
    {
        x = __x;
        y = __y;
        dx = 0;
        dy = 0;
        vx = 0;
        vy = 0;
        friction = __fr;
        count = __co;
    } // End of the function
    function verlet(a)
    {
        dx = x - vx + a.x;
        dy = y - vy + a.y;
        vx = x;
        vy = y;
        x = x + dx;
        y = y + dy;
    } // End of the function
    function savePoint()
    {
        var _loc2 = x;
        var _loc3 = y;
        var _loc4 = dx;
        var _loc6 = dy;
        var _loc5 = vx;
        var _loc7 = vy;
        sx = _loc2;
        sy = _loc3;
        sdx = _loc4;
        sdy = _loc6;
        svx = _loc5;
        svy = _loc7;
    } // End of the function
    function restore()
    {
        x = sx;
        y = sy;
        dx = sdx;
        dy = sdy;
        vx = svx;
        vy = svy;
    } // End of the function
    function restoreSavedPoints(point)
    {
        var _loc3 = _root.savedTracks.data.trackList[_root.panel.fileDialog.savedTracks.selectedIndex].flagData[0][point];
        sx = _loc3[0];
        sy = _loc3[1];
        sdx = _loc3[2];
        sdy = _loc3[3];
        svx = _loc3[4];
        svy = _loc3[5];
    } // End of the function
    function storePoint(point)
    {
        _root.savedPointsCache[point] = [sx, sy, sdx, sdy, svx, svy];
    } // End of the function
    function injectPoint(__point)
    {
        sx = __point[0];
        sy = __point[1];
        sdx = __point[2];
        sdy = __point[3];
        svx = __point[4];
        svy = __point[5];
    } // End of the function
} // End of Class
