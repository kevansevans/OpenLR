class lineDraw
{
    function lineDraw(x1, y1, x2, y2, inv, type, condition, line, nx, ny, invDst, dx, dy, px, py)
    {
        line.clear();
        var _loc6 = line.color;
        if (_loc6 == undefined)
        {
            _loc6 = 0;
        } // end if
        if (condition == "editor" || condition == "simColor")
        {
            if (type == 0)
            {
                line.lineStyle(4 * _root.SCALEDOWN, 26367, 100, false, "normal", "round");
            }
            else if (type == 1)
            {
                line.lineStyle(4 * _root.SCALEDOWN, 13369344, 100, true, "horizontal", "round", "miter");
            }
            else if (type == 2)
            {
                line.lineStyle(4 * _root.SCALEDOWN, 52224, 100, false, "normal", "round");
            } // end else if
            if (type != 2)
            {
                var _loc10 = nx > 0 ? (Math.ceil(nx)) : (Math.floor(nx));
                var _loc11 = ny > 0 ? (Math.ceil(ny)) : (Math.floor(ny));
                line.moveTo(x1 + _loc10, y1 + _loc11);
                line.lineTo(x2 + _loc10, y2 + _loc11);
            }
            else
            {
                line.moveTo(x1, y1);
                line.lineTo(x2, y2);
            } // end else if
            if (type == 1)
            {
                line.moveTo(x2, y2);
                line.lineTo(x2 + (nx * 4 - dx * invDst * 5), y2 + (ny * 4 - dy * invDst * 5));
                line.lineTo(x2 - dx * invDst * 5, y2 - dy * invDst * 5);
            } // end if
            if (type != 2)
            {
                line.lineStyle(4 * _root.SCALEDOWN, _loc6, 100, false, "normal", "round");
                line.moveTo(x1, y1);
                line.lineTo(x2, y2);
            } // end if
            line.cacheAsBitmap = true;
        }
        else if (condition == "simulation" || condition == "preview")
        {
            line.lineStyle(4 * _root.SCALEDOWN, line.color, 100, false, "normal", "round");
            line.moveTo(x1, y1);
            line.lineTo(x2, y2);
        }
        else if (condition == "wipe")
        {
            line.clear();
            _root.statusB.text = "wiped";
        } // end else if
    } // End of the function
} // End of Class
