function onKeyUp()
{
    if (Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "hand") && helpscreen._visible == false && panel.menuB._visible == false)
    {
        cursorImage(cursor.temp);
    } // end if
    if (Key.getCode() == 81 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.pencilB.onPress();
        cursorImage("pencil");
        setManipPoints();
    } // end if
    if (Key.getCode() == 87 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.lineB.onPress();
        cursorImage("line");
    } // end if
    if (Key.getCode() == 69 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.eraserB.onPress();
        cursorImage("eraser");
    } // end if
    if (Key.getCode() == 82 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.zoomB.onPress();
        cursorImage("zoom");
    } // end if
    if (Key.getCode() == 84 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.handB.onPress();
        cursorImage("hand");
    } // end if
    if (Key.getCode() == 89 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.playB.onPress();
    } // end if
    if (Key.getCode() == 85 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.menuB._visible == false)
    {
        panel.stopB.onPress();
        panel[lastTool + "B"].onPress();
    } // end if
    if (Key.getCode() == 73 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.flagB.onPress();
    } // end if
    if (Key.getCode() == 77 && simulation == true)
    {
        slowMotion = !slowMotion;
        slowmonum = Lastslownumber;
    } // end if
    if (Key.getCode() == 76 && simulation == true)
    {
        liveHitTest = !liveHitTest;
    } // end if
    if (Key.getCode() == 77 && simulation == false && panel.menuB._visible == false)
    {
        if (Key.isDown(16))
        {
            if (Autoslow == false)
            {
                Autoslow = true;
            }
            else if (Autoslow != false)
            {
                Autoslow = false;
            } // end else if
            displayMessage("Autoslow " + Autoslow, 1500);
        } // end if
        panel.menuB.AutoSlow.selected = Autoslow;
    } // end if
    if (Key.getCode() == 79 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.menuB._visible == false)
    {
        panel.saveB.onPress();
    } // end if
    if (Key.getCode() == 80 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.menuB._visible == false && helpscreen._visible == false)
    {
        panel.trashB.onPress();
    } // end if
    if (Key.getCode() == 49 && panel.swatches._visible == true && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.swatches.blue.onPress();
    } // end if
    if (Key.getCode() == 50 && panel.swatches._visible == true && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.swatches.red.onPress();
    } // end if
    if (Key.getCode() == 51 && panel.swatches._visible == true && helpscreen._visible == false && panel.menuB._visible == false)
    {
        panel.swatches.green.onPress();
    } // end if
    if (Key.getCode() == 9 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && panel.menuB._visible == false)
    {
        if (tempZoom == undefined || tla._xscale != ttZoom)
        {
            if (Lines != tempLines)
            {
                tempLines = Lines;
                getBounds();
            } // end if
            tempZoom = tla._xscale;
            showAll();
            ttZoom = tla._xscale;
        }
        else
        {
            var _loc4 = tla._xmouse;
            var _loc3 = tla._ymouse;
            var _loc2 = _xmouse;
            var _loc5 = _ymouse;
            canvasX = tla._x = -(_loc4 * tempZoom * 0.010000 - _loc2);
            canvasY = tla._y = -(_loc3 * tempZoom * 0.010000 - _loc5);
            bufScale = tla._xscale = tla._yscale = tempZoom;
            tempZoom = undefined;
        } // end if
    } // end else if
    if (Key.getCode() == 8 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        if (!Key.isDown(187) && !Key.isDown(16))
        {
            undo();
        }
        else if (Key.isDown(187) || Key.isDown(16))
        {
            redo();
        } // end if
    } // end else if
    if (Key.getCode() == 36 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        tmpPoint.x = tla.startPoint._x;
        tmpPoint.y = tla.startPoint._y;
        tla.localToGlobal(tmpPoint);
        canvasX = tla._x = Stage.width * 0.500000 - tmpPoint.x + tla._x;
        canvasY = tla._y = Stage.height * 0.500000 - tmpPoint.y + tla._y;
    } // end if
    if (Key.getCode() == 35 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        var _loc1 = getLastLine();
        if (_loc1 != undefined)
        {
            tmpPoint.x = _loc1.x2;
            tmpPoint.y = _loc1.y2;
            tla.localToGlobal(tmpPoint);
            canvasX = tla._x = Stage.width * 0.500000 - tmpPoint.x + tla._x;
            canvasY = tla._y = Stage.height * 0.500000 - tmpPoint.y + tla._y;
        } // end if
    } // end if
    if (Key.getCode() == 71 && !Key.isDown(17) && (tla.flag._visible == true || ghost == true) && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && helpscreen._visible == false && panel.menuB._visible == false)
    {
        if (!Key.isDown(16))
        {
            if (ghost == false)
            {
                tmpPoint.x = tla.flag._x;
                tmpPoint.y = tla.flag._y;
            }
            else
            {
                tmpPoint.x = tla.dummy.sled._x;
                tmpPoint.y = tla.dummy.sled._y;
            } // end else if
            tla.localToGlobal(tmpPoint);
            canvasX = tla._x = Stage.width * 0.500000 - tmpPoint.x + tla._x;
            canvasY = tla._y = Stage.height * 0.500000 - tmpPoint.y + tla._y;
        }
        else
        {
            if (ghost == false)
            {
                ghost = true;
            }
            else if (ghost != false)
            {
                ghost = false;
            } // end else if
            displayMessage("Ghost Flag " + ghost, 1500);
            panel.menuB.flagGhost.selected = ghost;
        } // end if
    } // end else if
    if (Key.getCode() == 219 && simulation == true)
    {
        if (pauseStatus == false)
        {
            pauseStatus = true;
            panel.playbackcon.pauseb._visible = false;
            panel.playbackcon.resumeb._visible = true;
        }
        else if (pauseStatus != false)
        {
            pauseStatus = false;
            panel.playbackcon.pauseb._visible = true;
            panel.playbackcon.resumeb._visible = false;
        } // end if
    } // end else if
    if (Key.getCode() == 221 && simulation == true && pauseStatus == true)
    {
        verlet(riderAnchors);
        scarfAnchors[1].x = scarfAnchors[1].x + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dx, 125);
        scarfAnchors[1].y = scarfAnchors[1].y + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dy, 125);
        verlet(scarfAnchors);
        satisfyConstraints();
        ++frames;
        render();
    } // end if
    if (Key.getCode() == 67 && simulation == false && panel.menuB._visible == false)
    {
        if (Key.isDown(16))
        {
            if (colorplay == false)
            {
                colorplay = true;
                displayMessage("Color Play " + colorplay, 1500);
            }
            else if (colorplay != false)
            {
                colorplay = false;
                displayMessage("Color Play " + colorplay, 1500);
            } // end else if
            panel.menuB.colorPlay.selected = colorplay;
        } // end if
    } // end if
    if (Key.getCode() == 192 && simulation == false)
    {
        if (panel.menuB._visible == false)
        {
            panel.settingsB.onPress();
        }
        else if (panel.menuB._visible == true)
        {
            panel.menuB.closeB.onPress();
        } // end if
    } // end else if
    if (Key.getCode() == 13 && jumpZoomBool == true)
    {
        setZoom(prevZoom);
        displayMessage("set zoom to " + prevZoom, 1500);
        jumpZoomBool = false;
    } // end if
    if (Key.getCode() == 38 && jumpZoomBool == true)
    {
        if (prevZoom != 2400 && prevZoom < 2400)
        {
            prevZoom = prevZoom + 50;
            displayMessage("Jump to " + prevZoom + ".x zoom \n press enter to apply", 2500);
        } // end if
    } // end if
    if (Key.getCode() == 40 && jumpZoomBool == true)
    {
        if (prevZoom != 50 && prevZoom > 50)
        {
            prevZoom = prevZoom - 50;
            displayMessage("Jump to " + prevZoom + ".x zoom \n press enter to apply", 2500);
        } // end if
    } // end if
    if (lastTool == "line")
    {
        if (preShifted == true)
        {
            if (Key.getCode() == 16)
            {
                preShifted = false;
            } // end if
        }
        else if (preShifted == false)
        {
            if (Key.getCode() == 90)
            {
                tempLine.inv = !tempLine.inv;
            } // end if
        } // end if
    } // end else if
    if (lastTool == "pencil")
    {
        if (preShifted == true)
        {
            if (Key.getCode() == 16)
            {
                preShifted = false;
            } // end if
        }
        else if (preShifted == false)
        {
            if (Key.getCode() == 90)
            {
                tempLine.inv = !tempLine.inv;
            } // end if
        } // end if
    } // end else if
    if (!simulation)
    {
        if (Key.getCode() == 188)
        {
            injectFlag("prev");
        }
        else if (Key.getCode() == 190)
        {
            injectFlag("next");
        } // end if
    } // end else if
} // End of the function
function setZoom(temp1)
{
    temp1 = Math.min(Math.max(temp1, 50), 2400);
    var _loc1 = new Object();
    _loc1.x = Stage.width * 0.500000;
    _loc1.y = Stage.height * 0.500000;
    tla.globalToLocal(_loc1);
    world._xscale = world._yscale = tla._xscale = tla._yscale = temp1;
    world._x = world._y = -10;
    showPos(_loc1.x, _loc1.y);
    bufScale = temp1;
} // End of the function
function showPos(xPos, yPos)
{
    tmpPoint.x = xPos;
    tmpPoint.y = yPos;
    tla.localToGlobal(tmpPoint);
    world._x = tla._x = Stage.width * 0.500000 - tmpPoint.x + tla._x;
    world._y = tla._y = Stage.height * 0.500000 - tmpPoint.y + tla._y;
    if (!simulation)
    {
        canvasX = tla._x;
        canvasY = tla._y;
    } // end if
} // End of the function
function saveFunction(trackName, autoSave, revision)
{
    if (Lines > 0 && !backupMode)
    {
        ver = revision;
        if (ver == undefined)
        {
            ver = "6.2";
        } // end if
        active = true;
        var _loc4 = new Array(Lines);
        var _loc3 = 0;
        for (var _loc6 in lines)
        {
            var _loc1 = lines[_loc6];
            _loc4[_loc3] = [_loc1.x1, _loc1.y1, _loc1.x2, _loc1.y2, _loc1.lim, Number(_loc1.inv), _loc1.prevLine, _loc1.nextLine, _loc1.name, _loc1.type];
            ++_loc3;
        } // end of for...in
        _loc5 = trackName;
        var _loc5;
        for (var _loc8 in riderAnchors)
        {
            riderAnchors[_loc8].storePoint(_loc8);
        } // end of for...in
        for (var _loc7 in scarfAnchors)
        {
            scarfAnchors[_loc7].storePoint(_loc7 + 10);
        } // end of for...in
        savedPointsToSave = savedPointsCache;
        _loc6 = savedPointsToSave;
        var _loc11 = [tla.flag._x, tla.flag._y];
        var _loc13 = saved;
        var _loc12 = flaggedstat[0];
        var _loc9 = [tla._x, tla._y, tla._xscale];
        var _loc10 = [Lastslownumber, zoomstat, colorplay, CUSTSCALE, scrollzoom, zeroStartBool, dualFakie, cameraPoint, cameraPan];
        for (var _loc2 = 0; _loc2 < savedTracks.data.trackList.length; ++_loc2)
        {
            if (savedTracks.data.trackList[_loc2].label == _loc5)
            {
                _loc5 = _loc2;
            } // end if
        } // end of for
        if (_loc5 != undefined)
        {
            var _loc14 = savedTracks.data.trackList.splice(_loc5, 1);
        } // end if
        savedTracks.data.trackList.addItemAt(0, {label: _loc5, data: _loc4, level: totLines, startLine: [tla.startPoint._x, tla.startPoint._y], version: ver, flagData: [_loc6, _loc11, _loc13, _loc12, BindStick.crash], trackData: [_loc16, _loc9, _loc10], recordedFrames: [massPointCache]});
        var _loc23 = savedTracks.data;
        savedTracks.flush(savedTracks.getSize());
        cookiesSave();
        if (!autoSave)
        {
            panel.fileDialog._visible = false;
            panelMode("draw");
            panel[lastTool + "B"].onPress();
            cursorImage(cursorMode);
            disableFileButtons();
        }
        else
        {
            displayMessage("Autosaved!", 1500);
        } // end if
    } // end else if
} // End of the function
function loadFunction(ver)
{
    jumpZoomBool = false;
    if (panel.fileDialog.savedTracks.selectedIndex != undefined)
    {
        if (lines[savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine] == undefined && typeof(savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine) == "number")
        {
            tla.startPoint._x = 100;
            tla.startPoint._y = 100;
        }
        else if (typeof(savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine) == "number")
        {
            tla.startPoint._x = lines[savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine].x1;
            tla.startPoint._y = lines[savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine].y1 - 50 * Math.sqrt(SCALEDOWN * SCALEDOWN);
        }
        else
        {
            tla.startPoint._x = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine[0];
            tla.startPoint._y = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine[1];
        } // end else if
        disableFileButtons();
        undoList = [];
        reset();
        active = true;
        saved = false;
        tla.dummy._visible = false;
        tla.flag._visible = false;
        panel.fileDialog.name.text = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].label;
        buffer = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].data;
        var _loc7 = ver;
        if (_loc7 == undefined)
        {
            _loc7 = "6.2";
        }
        else if (_loc7 == "V3.4")
        {
            _loc7 = "6.2";
        }
        else if (_loc7 == "6.1")
        {
            _loc7 = "6.1";
        }
        else if (_loc7 == "6")
        {
            _loc7 = "6";
        }
        else
        {
            _loc7 = "6.2";
        } // end else if
        VERSION = _loc7;
        switchToVersion(_loc7);
        panel.fileDialog._visible = false;
        segmentsRemainingToLoad = buffer.length;
        loadBounds(buffer);
        showAll();
        loadStartTime = getTimer();
        if (tla._xscale > 100)
        {
            tla._xscale = tla._yscale = bufScale = 100;
            tla._x = tla._y = canvasX = canvasY = 0;
        } // end if
        linesPerChunk = 200;
        panel.onEnterFrame = function ()
        {
            if (segmentsRemainingToLoad > 0)
            {
                for (var _loc3 = 0; _loc3 < linesPerChunk; ++_loc3)
                {
                    var _loc1 = buffer[segmentsRemainingToLoad - 1];
                    --segmentsRemainingToLoad;
                    if (_loc1[9] == undefined)
                    {
                        _loc1[9] = 0;
                    } // end if
                    switch (_loc1[9])
                    {
                        case 0:
                        {
                            var _loc2 = new Floor(_loc1[0], _loc1[1], _loc1[2], _loc1[3], Boolean(_loc1[5]), _loc1[4]);
                            break;
                        } 
                        case 1:
                        {
                            _loc2 = new FloorAcc(_loc1[0], _loc1[1], _loc1[2], _loc1[3], Boolean(_loc1[5]), _loc1[4]);
                            break;
                        } 
                        case 2:
                        {
                            if (panel.fileDialog.nosceneryload.selected == false)
                            {
                                _loc2 = new FloorScenery(_loc1[0], _loc1[1], _loc1[2], _loc1[3]);
                            }
                            else
                            {
                                _loc2 = "null";
                            } // end else if
                            break;
                        } 
                    } // End of switch
                    if (_loc2 != "null")
                    {
                        var _loc5 = 0;
                        ++_loc5;
                        _loc2.name = "null";
                        _loc2.name = _loc5;
                        _loc2.prevLine = _loc1[6];
                        _loc2.nextLine = _loc1[7];
                        loadLine(_loc2);
                        lines[_loc2.name] = _loc2;
                        redoList[_loc5] = new Array(_loc1[0], _loc1[1], _loc1[2], _loc1[3], Boolean(_loc1[5]), _loc1[9], _loc5);
                    } // end if
                    if (segmentsRemainingToLoad == 0)
                    {
                        break;
                    } // end if
                } // end of for
                var _loc6 = int((getTimer() - loadStartTime) / 100) / 10;
                statusText.text = Math.floor((buffer.length - segmentsRemainingToLoad) / buffer.length * 100) + "%";
                updateInfoText();
                var _loc7 = 10;
            }
            else
            {
                _loc5 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].trackData;
                var _loc4 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].recordedFrames;
                if (_loc4[0] != undefined)
                {
                    massPointCache = _loc4[0];
                } // end if
                finishLoad();
                cookiesLoadAndApply(_loc5, true);
            } // end else if
        };
    } // end if
    if (savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].flagData[2] == true && flagSaving == true)
    {
        panel.flagB.onPress();
        restoreflag();
    } // end if
} // End of the function
function restoreflag()
{
    saved = false;
    var _loc5 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].flagData[0];
    var _loc3 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].flagData[1];
    tla.flag._x = _loc3[0];
    tla.flag._y = _loc3[1];
    tla.flag._visible = true;
    flaggedstat[0] = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].flagData[3];
    BindStick.crash = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].flagData[4];
    for (var _loc1 in riderAnchors)
    {
        riderAnchors[_loc1].restoreSavedPoints(_loc1);
    } // end of for...in
    for (var _loc2 in scarfAnchors)
    {
        scarfAnchors[_loc2].restoreSavedPoints(_loc2 + 10);
    } // end of for...in
    saved = true;
    var _loc4 = time(savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].flagData[3]);
    tla.flag.flagTime.text = _loc4;
} // End of the function
function updateInfoText()
{
    statusText_blue.text = blueLines + " Floor";
    statusText_red.text = redLines + " Accel";
    statusText_green.text = greenLines + " Scene";
} // End of the function
function incrementLineCounts(lineType)
{
    ++Lines;
    if (lineType == 0)
    {
        ++blueLines;
    } // end if
    if (lineType == 1)
    {
        ++redLines;
    } // end if
    if (lineType == 2)
    {
        ++greenLines;
    } // end if
} // End of the function
function blink()
{
    if (Math.random() < BLINK_RATE)
    {
        world.body.face.uch1.play();
        world.body.face.uch2.play();
    } // end if
} // End of the function
function showAll()
{
    var _loc3 = maxX - minX;
    var _loc4 = maxY - minY;
    var _loc5 = Stage.width / _loc3;
    var _loc6 = Stage.height / _loc4;
    var _loc1 = Math.min(_loc5, 3);
    var _loc2 = Math.min(_loc6, 3);
    if (_loc5 > _loc6)
    {
        bufScale = tla._xscale = tla._yscale = _loc2 * 100;
        canvasX = tla._x = -minX * _loc2 + (Stage.width - _loc3 * _loc2) * 0.500000;
        canvasY = tla._y = -minY * _loc2;
    }
    else
    {
        bufScale = tla._xscale = tla._yscale = _loc1 * 100;
        canvasX = tla._x = -minX * _loc1;
        canvasY = tla._y = -minY * _loc1 + (Stage.height - _loc4 * _loc1) * 0.500000;
    } // end else if
} // End of the function
function onKeyDown()
{
    if (Key.getCode() == 88 && Key.isDown(16) && advancedMode)
    {
        xysnap_toggled = !xysnap_toggled;
        panel.menuB.xy45Box.selected = xysnap_toggled;
    } // end if
    if (Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "line") && drawing == false && helpmenu._visible == false)
    {
        var _loc1 = cursorMode;
        cursor.temp = _loc1;
        cursorImage("hand");
    } // end if
    if (Key.getCode() == 13 && simulation == false && panel.menuB._visible == false)
    {
        if (Key.isDown(16))
        {
            if (preview == false)
            {
                preview = true;
                _loc1 = "preview";
                timeLine._visible = true;
                lastSwatch = pencilMode;
                pencilMode = 2;
                panel.swatches.green.onPress();
            }
            else if (preview == true)
            {
                preview = false;
                _loc1 = "editor";
                panle.timeLine._visible = false;
                pencilMode = lastSwatch;
                if (lastSwatch == 0)
                {
                    panel.swatches.blue.onPress();
                }
                else if (lastSwatch == 1)
                {
                    panel.swatches.red.onPress();
                } // end else if
            } // end else if
            displayMessage("Preview " + preview, 1500);
            for (var _loc2 in lines)
            {
                renderLine(lines[_loc2], _loc1);
            } // end of for...in
        } // end if
    }
    else if (Key.getCode() == 16 && simulation == false && panel.menuB._visible == false)
    {
        if (Key.isDown(13))
        {
            if (preview == false)
            {
                preview = true;
                _loc1 = "preview";
                timeLine._visible = true;
            }
            else if (preview == true)
            {
                preview = false;
                _loc1 = "editor";
                panle.timeLine._visible = false;
            } // end else if
            displayMessage("Preview " + preview, 1500);
            for (var _loc2 in lines)
            {
                renderLine(lines[_loc2], _loc1);
            } // end of for...in
        } // end if
    } // end else if
} // End of the function
function pointToStartPoint()
{
    compas.onEnterFrame = function ()
    {
        var _loc1 = new Object();
        _loc1.x = tla.startPoint._x;
        _loc1.y = tla.startPoint._y;
        tla.localToGlobal(_loc1);
        compas.distance.text = Math.floor(Math.sqrt(Math.pow(_loc1.x - compas._x, 2) + Math.pow(_loc1.y - compas._y, 2))) + " pixels; " + gameFPS + " fps";
        compas.dial._rotation = Math.atan2(_loc1.y - compas._y, _loc1.x - compas._x) * TO_DEG;
    };
} // End of the function
function removeSpaces(str)
{
    while (str.charAt(str.length - 1) == " ")
    {
        str = str.substr(0, str.length - 1);
    } // end while
    return (str);
} // End of the function
function finishLoad()
{
    panel.onEnterFrame = function ()
    {
    };
    totLines = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].level;
    panel[lastTool + "B"].onPress();
    panel[lastTool + "B"].onRelease();
    cursorImage(cursorMode);
    panelMode("draw");
    statusText.text = Lines + " Lines";
    pointToStartPoint();
    displayMessage("Rev " + VERSION, 1500);
    preview = false;
} // End of the function
function disableFileButtons()
{
    fucusManager.enabled = false;
    panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = false;
    panel.fileDialog.name.editable = false;
    panel.fileDialog.saveButton.onRelease = panel.fileDialog.loadButton.onRelease = panel.fileDialog.deleteButton.onRelease = panel.fileDialog.close.onPress = function ()
    {
    };
} // End of the function
function enableFileButtons()
{
    panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = true;
    panel.fileDialog.name.editable = true;
} // End of the function
function disableConfirmButtons()
{
    panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = false;
    panel.confirmDialog.Yes.onRelease = panel.confirmDialog.No.onRelease = function ()
    {
    };
} // End of the function
function enableConfirmButtons(condition)
{
    panel.confirmDialog.Yes._x = -88;
    panel.confirmDialog.No._x = 30;
    panel.confirmDialog.force._x = 68;
    panel.confirmDialog.save._x = 68;
    panel.confirmDialog.force._visible = false;
    panel.confirmDialog.save._visible = false;
    panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = true;
    if (condition == "load")
    {
        panel.confirmDialog.Yes._x = -128;
        panel.confirmDialog.No._x = -30;
        panel.confirmDialog.force._visible = true;
        panel.confirmDialog.save._visible = false;
    } // end if
    if (condition == "save")
    {
        panel.confirmDialog.Yes._x = -128;
        panel.confirmDialog.No._x = -30;
        panel.confirmDialog.force._visible = false;
        panel.confirmDialog.save._visible = true;
    }
    else if (condition == "null")
    {
        panel.confirmDialog.Yes._x = -88;
        panel.confirmDialog.No._x = 30.500000;
        panel.confirmDialog.force._visible = false;
    } // end else if
} // End of the function
function getBounds()
{
    maxX = 0;
    maxY = 0;
    minX = Stage.width;
    minY = Stage.height;
    for (var _loc2 in lines)
    {
        var _loc1 = lines[_loc2];
        maxX = Math.max(maxX, Math.max(_loc1.x1, _loc1.x2));
        maxY = Math.max(maxY, Math.max(_loc1.y1, _loc1.y2));
        minX = Math.min(minX, Math.min(_loc1.x1, _loc1.x2));
        minY = Math.min(minY, Math.min(_loc1.y1, _loc1.y2));
    } // end of for...in
} // End of the function
function loadBounds(lineArray)
{
    maxX = 0;
    maxY = 0;
    minX = Stage.width;
    minY = Stage.height;
    for (var _loc3 in lineArray)
    {
        var _loc1 = lineArray[_loc3];
        maxX = Math.max(maxX, Math.max(_loc1[0], _loc1[2]));
        maxY = Math.max(maxY, Math.max(_loc1[1], _loc1[3]));
        minX = Math.min(minX, Math.min(_loc1[0], _loc1[2]));
        minY = Math.min(minY, Math.min(_loc1[1], _loc1[3]));
    } // end of for...in
} // End of the function
function init()
{
    BindStick.crash = false;
    riderAnchors = [];
    scarfAnchors = [];
    riderAnchors[0] = new Point(0, 0, 0.800000, 0);
    riderAnchors[1] = new Point(0, 10, 0, 1);
    riderAnchors[2] = new Point(30, 10, 0, 2);
    riderAnchors[3] = new Point(35, 0, 0, 3);
    riderAnchors[4] = new Point(10, 0, 0.800000, 4);
    riderAnchors[5] = new Point(10, -11, 0.800000, 5);
    riderAnchors[6] = new Point(23, -10, 0.100000, 6);
    riderAnchors[7] = new Point(23, -10, 0.100000, 7);
    riderAnchors[8] = new Point(20, 10, 0, 8);
    riderAnchors[9] = new Point(20, 10, 0, 9);
    scarfAnchors[0] = new PointAirFri(7, -10, AIR_FRICTION);
    scarfAnchors[1] = new PointAirFri(3, -10, AIR_FRICTION);
    scarfAnchors[2] = new PointAirFri(0, -10, AIR_FRICTION);
    scarfAnchors[3] = new PointAirFri(-4, -10, AIR_FRICTION);
    scarfAnchors[4] = new PointAirFri(-7, -10, AIR_FRICTION);
    scarfAnchors[5] = new PointAirFri(-11, -10, AIR_FRICTION);
    for (var _loc1 = 0; _loc1 < riderAnchors.length; ++_loc1)
    {
        riderAnchors[_loc1].x = riderAnchors[_loc1].x * Math.sqrt(SCALEDOWN * SCALEDOWN);
        riderAnchors[_loc1].y = riderAnchors[_loc1].y * Math.sqrt(SCALEDOWN * SCALEDOWN);
    } // end of for
    for (var _loc1 = 0; _loc1 < scarfAnchors.length; ++_loc1)
    {
        scarfAnchors[_loc1].x = scarfAnchors[_loc1].x * Math.sqrt(SCALEDOWN * SCALEDOWN);
        scarfAnchors[_loc1].y = scarfAnchors[_loc1].y * Math.sqrt(SCALEDOWN * SCALEDOWN);
    } // end of for
    world.sled.gotoAndStop(1);
    world.sled._xscale = world.sled._yscale = world.body._xscale = world.body._yscale = world.arm1._xscale = world.arm1._yscale = world.arm2._xscale = world.arm2._yscale = world.leg1._xscale = world.leg1._yscale = world.leg2._xscale = world.leg2._yscale = Math.sqrt(SCALEDOWN * SCALEDOWN) * 100;
    edges = [];
    edges2 = [];
    edges[0] = new Stick(riderAnchors[0], riderAnchors[1]);
    edges[1] = new Stick(riderAnchors[1], riderAnchors[2]);
    edges[2] = new Stick(riderAnchors[2], riderAnchors[3]);
    edges[3] = new Stick(riderAnchors[3], riderAnchors[0]);
    edges[4] = new Stick(riderAnchors[0], riderAnchors[2]);
    edges[5] = new Stick(riderAnchors[3], riderAnchors[1]);
    edges[6] = new BindStick(riderAnchors[0], riderAnchors[4], ENDURANCE);
    edges[8] = new BindStick(riderAnchors[1], riderAnchors[4], ENDURANCE);
    edges[9] = new BindStick(riderAnchors[2], riderAnchors[4], ENDURANCE);
    edges[10] = new Stick(riderAnchors[5], riderAnchors[4]);
    edges[11] = new Stick(riderAnchors[5], riderAnchors[6]);
    edges[12] = new Stick(riderAnchors[5], riderAnchors[7]);
    edges[13] = new Stick(riderAnchors[4], riderAnchors[8]);
    edges[14] = new Stick(riderAnchors[4], riderAnchors[9]);
    edges[15] = new Stick(riderAnchors[5], riderAnchors[7]);
    edges[16] = new BindStick(riderAnchors[5], riderAnchors[0], ENDURANCE);
    edges[17] = new BindStick(riderAnchors[3], riderAnchors[6], ENDURANCE);
    edges[18] = new BindStick(riderAnchors[3], riderAnchors[7], ENDURANCE);
    edges[19] = new BindStick(riderAnchors[8], riderAnchors[2], ENDURANCE);
    edges[20] = new BindStick(riderAnchors[9], riderAnchors[2], ENDURANCE);
    edges[21] = new RepellStick(riderAnchors[5], riderAnchors[8]);
    edges[22] = new RepellStick(riderAnchors[5], riderAnchors[9]);
    edges[21].restLength = edges[21].restLength * 0.500000;
    edges[22].restLength = edges[22].restLength * 0.500000;
    edges2[0] = new Shal(riderAnchors[5], scarfAnchors[0]);
    edges2[1] = new Shal(scarfAnchors[0], scarfAnchors[1]);
    edges2[2] = new Shal(scarfAnchors[1], scarfAnchors[2]);
    edges2[3] = new Shal(scarfAnchors[2], scarfAnchors[3]);
    edges2[4] = new Shal(scarfAnchors[3], scarfAnchors[4]);
    edges2[5] = new Shal(scarfAnchors[4], scarfAnchors[5]);
} // End of the function
function reset()
{
    redoLineList = [];
    redoList = [];
    lineToUndo = 0;
    startLine = undefined;
    for (var _loc1 in lines)
    {
        removeLine(lines[_loc1]);
    } // end of for...in
    lines = new Object();
    Lines = 0;
    totLines = 0;
    grid = [];
    maxX = 0;
    maxY = 0;
    minX = Stage.width;
    minY = Stage.height;
    canvasX = canvasY = tla._x = tla._y = 0;
    tla._xscale = tla._yscale = bufScale = 100;
    ++savecount;
} // End of the function
function snap(x, y, vert, invert)
{
    var _loc2 = Math.pow(SNAP_DISTANCE / (tla._xscale * 0.010000), 2);
    var _loc10 = x;
    var _loc11 = y;
    var _loc17;
    var _loc18;
    var _loc6;
    var _loc7;
    var _loc9 = false;
    var _loc15 = gridPos(x, y);
    var _loc8;
    if (!Key.isDown(83))
    {
        for (var _loc14 = -1; _loc14 < 2; ++_loc14)
        {
            var _loc4 = "x" + (_loc15.x + _loc14);
            if (grid[_loc4] == undefined)
            {
                continue;
            } // end if
            for (var _loc5 = -1; _loc5 < 2; ++_loc5)
            {
                var _loc3 = "y" + (_loc15.y + _loc5);
                if (grid[_loc4][_loc3] == undefined)
                {
                    continue;
                } // end if
                for (var _loc16 in grid[_loc4][_loc3].storage2)
                {
                    var _loc1 = grid[_loc4][_loc3].storage2[_loc16];
                    _loc6 = Math.pow(x - _loc1.x1, 2) + Math.pow(y - _loc1.y1, 2);
                    _loc7 = Math.pow(x - _loc1.x2, 2) + Math.pow(y - _loc1.y2, 2);
                    if (_loc6 < _loc2)
                    {
                        _loc2 = _loc6;
                        _loc10 = _loc1.x1;
                        _loc11 = _loc1.y1;
                        _loc9 = 1;
                        _loc8 = _loc1;
                    } // end if
                    if (_loc7 < _loc2)
                    {
                        _loc2 = _loc7;
                        _loc10 = _loc1.x2;
                        _loc11 = _loc1.y2;
                        _loc9 = 2;
                        _loc8 = _loc1;
                    } // end if
                } // end of for...in
            } // end of for
        } // end of for
        _loc17 = vert == _loc9;
        _loc18 = invert == _loc8.inv;
        if (!(_loc17 && !_loc18 || !_loc17 && _loc18) || _loc8.type == 2)
        {
            _loc9 = false;
            _loc8 = undefined;
            _loc10 = x;
            _loc11 = y;
        } // end if
    } // end if
    return ([_loc10, _loc11, _loc9, _loc8]);
} // End of the function
function resetPosition()
{
    riderAnchors[0].x = 0;
    riderAnchors[0].y = 0;
    riderAnchors[1].x = 0;
    riderAnchors[1].y = 10;
    riderAnchors[2].x = 30;
    riderAnchors[2].y = 10;
    riderAnchors[3].x = 35;
    riderAnchors[3].y = 0;
    riderAnchors[4].x = 10;
    riderAnchors[4].y = 0;
    riderAnchors[5].x = 10;
    riderAnchors[5].y = -11;
    riderAnchors[6].x = 23;
    riderAnchors[6].y = -10;
    riderAnchors[7].x = 23;
    riderAnchors[7].y = -10;
    riderAnchors[8].x = 20;
    riderAnchors[8].y = 10;
    riderAnchors[9].x = 20;
    riderAnchors[9].y = 10;
    scarfAnchors[0].x = 7;
    scarfAnchors[0].y = -10;
    scarfAnchors[1].x = 3;
    scarfAnchors[1].y = -10;
    scarfAnchors[2].x = 0;
    scarfAnchors[2].y = -10;
    scarfAnchors[3].x = -4;
    scarfAnchors[3].y = -10;
    scarfAnchors[4].x = -7;
    scarfAnchors[4].y = -10;
    scarfAnchors[5].x = -11;
    scarfAnchors[5].y = -10;
    for (var _loc1 = 0; _loc1 < riderAnchors.length; ++_loc1)
    {
        riderAnchors[_loc1].x = riderAnchors[_loc1].x * Math.sqrt(SCALEDOWN * SCALEDOWN);
        riderAnchors[_loc1].y = riderAnchors[_loc1].y * Math.sqrt(SCALEDOWN * SCALEDOWN);
    } // end of for
    for (var _loc1 = 0; _loc1 < scarfAnchors.length; ++_loc1)
    {
        scarfAnchors[_loc1].x = scarfAnchors[_loc1].x * Math.sqrt(SCALEDOWN * SCALEDOWN);
        scarfAnchors[_loc1].y = scarfAnchors[_loc1].y * Math.sqrt(SCALEDOWN * SCALEDOWN);
    } // end of for
} // End of the function
function erase(x, y)
{
    var _loc20 = gridPos(x, y);
    var _loc9 = 1 / (tla._xscale * 0.010000);
    for (var _loc19 = -1; _loc19 < 2; ++_loc19)
    {
        var _loc7 = "x" + (_loc20.x + _loc19);
        if (grid[_loc7] == undefined)
        {
            continue;
        } // end if
        for (var _loc8 = -1; _loc8 < 2; ++_loc8)
        {
            var _loc5 = "y" + (_loc20.y + _loc8);
            if (grid[_loc7][_loc5] == undefined)
            {
                continue;
            } // end if
            for (var _loc21 in grid[_loc7][_loc5].storage)
            {
                var _loc1 = grid[_loc7][_loc5].storage[_loc21];
                var _loc3 = x - _loc1.x1;
                var _loc2 = y - _loc1.y1;
                var _loc12 = Math.sqrt(Math.pow(_loc3, 2) + Math.pow(_loc2, 2));
                var _loc13 = Math.sqrt(Math.pow(x - _loc1.x2, 2) + Math.pow(y - _loc1.y2, 2));
                var _loc11 = Math.abs(_loc1.nx * _loc3 + _loc1.ny * _loc2);
                var _loc4 = (_loc3 * _loc1.dx + _loc2 * _loc1.dy) * _loc1.invSqrDis;
                if (_loc12 < ERASER_SIZE * _loc9 || _loc13 < ERASER_SIZE * _loc9 || _loc11 < ERASER_SIZE * _loc9 && _loc4 >= 0 && _loc4 <= 1)
                {
                    if (!Key.isDown(83))
                    {
                        if (colorEraser != true)
                        {
                            removeLine(_loc1);
                        } // end if
                        if (colorEraser && _loc1.type == pencilMode)
                        {
                            removeLine(_loc1);
                        } // end if
                        continue;
                    } // end if
                    if (Key.isDown(83))
                    {
                        var _loc6 = new FloorAcc(_loc1.x1, _loc1.y1, _loc1.x2, _loc1.y2, _loc1.inv);
                        var _loc10 = new Floor(_loc1.x1, _loc1.y1, _loc1.x2, _loc1.y2, _loc1.inv);
                        var _loc16 = new Floor(_loc1.x1, _loc1.y1, _loc1.x2, _loc1.y2, !_loc1.inv);
                        var _loc14 = new FloorAcc(_loc1.x1, _loc1.y1, _loc1.x2, _loc1.y2, !_loc1.inv);
                        var _loc15 = new FloorAcc(_loc1.x2, _loc1.y2, _loc1.x1, _loc1.y1, !_loc1.inv);
                        if (_loc1.type == 0)
                        {
                            removeLine(_loc1);
                            if (!Key.isDown(88))
                            {
                                addLine(_loc6);
                            }
                            else if (Key.isDown(88))
                            {
                                addLine(_loc16);
                            } // end else if
                            return;
                        } // end if
                        if (_loc1.type == 1)
                        {
                            if (!Key.isDown(88) && !Key.isDown(17) && !Key.isDown(68))
                            {
                                addLine(_loc10);
                                removeLine(_loc1);
                            }
                            else if (Key.isDown(88))
                            {
                                addLine(_loc14);
                                removeLine(_loc1);
                            }
                            else if (Key.isDown(17))
                            {
                                addLine(_loc15);
                                removeLine(_loc1);
                            }
                            else if (Key.isDown(68))
                            {
                                addLine(_loc6);
                            } // end else if
                            return;
                        } // end if
                    } // end if
                } // end if
            } // end of for...in
        } // end of for
    } // end of for
} // End of the function
function save()
{
    for (var _loc2 in riderAnchors)
    {
        riderAnchors[_loc2].savePoint();
    } // end of for...in
    for (var _loc1 in scarfAnchors)
    {
        scarfAnchors[_loc1].savePoint();
    } // end of for...in
} // End of the function
function restore()
{
    for (var _loc2 in riderAnchors)
    {
        riderAnchors[_loc2].restore();
    } // end of for...in
    for (var _loc1 in scarfAnchors)
    {
        scarfAnchors[_loc1].restore();
    } // end of for...in
} // End of the function
function pan()
{
    tla.startDrag(false);
    pointToStartPoint();
} // End of the function
function zoom()
{
    onMouseDown = function ()
    {
        jumpZoomBool = false;
        if (active2)
        {
            oldScale = tla._xscale;
            oldy = _ymouse;
            if (Key.isDown(32))
            {
                pan();
                cursor.gotoAndStop(2);
            }
            else if (!Key.isDown(68))
            {
                cursor.gotoAndStop(4);
                onMouseMove = function ()
                {
                    _loc1 = Math.min(Math.max(oldScale + (oldy - _ymouse) * 2, 5), 2400);
                    tla._xscale = tla._yscale = _loc1;
                    tla._x = Stage.width * 0.500000 + (canvasX - Stage.width * 0.500000) * (_loc1 / oldScale);
                    tla._y = Stage.height * 0.500000 + (canvasY - Stage.height * 0.500000) * (_loc1 / oldScale);
                    zoomBuf = Math.round(_loc1);
                    displayMessage(Math.round(_loc1 * 10) / 10 + " zoom", 1500);
                    jumpZoomBool = false;
                };
            } // end if
        } // end else if
    };
    onMouseMove = function ()
    {
    };
    onMouseUp = function ()
    {
        stopDrag ();
        pointToStartPoint();
        bufScale = tla._xscale;
        canvasX = tla._x;
        canvasY = tla._y;
        onMouseMove = function ()
        {
        };
    };
} // End of the function
function makeStartPoint(line)
{
    tla.startPoint._x = line.x1;
    tla.startPoint._y = line.y1 - 50 * Math.sqrt(SCALEDOWN * SCALEDOWN);
    pointToStartPoint();
    tla.startpoint2._x = tla.startpoint._x;
    tla.startpoint2._y = tla.startpoint._y;
} // End of the function
function getLastLine()
{
    var _loc1 = undoList.length - 1;
    var _loc2;
    while (_loc2 == undefined && Lines > 0)
    {
        _loc2 = lines[undoList[_loc1]];
        --_loc1;
    } // end while
    return (_loc2);
} // End of the function
function getFirstLine()
{
    var _loc1 = 0;
    var _loc2;
    while (_loc2 == undefined && Lines > 0)
    {
        _loc2 = lines[undoList[_loc1]];
        ++_loc1;
    } // end while
    return (_loc2);
} // End of the function
function undo()
{
    var _loc1;
    while (_loc1 == undefined && Lines > 0)
    {
        _loc1 = lines[undoList.pop()];
    } // end while
    if (Lines > 0)
    {
        removeLine(_loc1);
    } // end if
} // End of the function
function loadLine(line)
{
    ++newLines;
    line.name = totLines;
    undoList.push(totLines);
    ++Lines;
    if (line.type == 0)
    {
        ++blueLines;
    } // end if
    if (line.type == 1)
    {
        ++redLines;
    } // end if
    if (line.type == 2)
    {
        ++greenLines;
    } // end if
    statusText_blue.text = blueLines + " Floor";
    statusText_red.text = redLines + " Accel";
    statusText_green.text = greenLines + " Scene";
    ++totLines;
    registerInGrid(line);
    lines[line.name] = line;
    var _loc2 = tla.createEmptyMovieClip(line.name, tla.getNextHighestDepth());
    line.parent = _loc2;
    renderLine(line, "editor");
    redoList[line.name] = new Array(line.x1, line.y1, line.x2, line.y2, line.inv, line.type, line.count, line.name);
} // End of the function
function addLineRedo(line, nameOfLine)
{
    ++newLines;
    undoList.push(totLines);
    if (Lines == 0)
    {
        makeStartPoint(line);
    } // end if
    ++Lines;
    if (line.type == 0)
    {
        ++blueLines;
    } // end if
    if (line.type == 1)
    {
        ++redLines;
    } // end if
    if (line.type == 2)
    {
        ++greenLines;
    } // end if
    line.name = nameOfLine;
    statusText.text = Lines + " Lines";
    statusText_blue.text = blueLines + " Floor";
    statusText_red.text = redLines + " Accel";
    statusText_green.text = greenLines + " Scene";
    registerInGrid(line);
    lines[line.name] = line;
    var _loc2 = tla.createEmptyMovieClip(line.name, tla.getNextHighestDepth());
    line.parent = _loc2;
    if (preview == false)
    {
        renderLine(line, "editor");
    }
    else
    {
        renderLine(line, "preview");
    } // end else if
    redoList[line.name] = new Array(line.x1, line.y1, line.x2, line.y2, line.inv, line.type, line.count, line.name);
} // End of the function
function addLine(line)
{
    ++newLines;
    line.name = totLines;
    undoList.push(totLines);
    if (Lines == 0 && !Key.isDown(83))
    {
        makeStartPoint(line);
    } // end if
    ++Lines;
    ++linetracker;
    if (line.type == 0)
    {
        ++blueLines;
    } // end if
    if (line.type == 1)
    {
        ++redLines;
    } // end if
    if (line.type == 2)
    {
        ++greenLines;
    } // end if
    statusText.text = Lines + " Lines";
    statusText_blue.text = blueLines + " Floor";
    statusText_red.text = redLines + " Accel";
    statusText_green.text = greenLines + " Scene";
    massCollisionCache[totLines] = line;
    ++totLines;
    registerInGrid(line);
    lines[line.name] = line;
    var _loc2 = tla.createEmptyMovieClip(line.name, tla.getNextHighestDepth());
    line.parent = _loc2;
    if (preview == false)
    {
        renderLine(line, "editor");
    }
    else
    {
        renderLine(line, "preview");
    } // end else if
    redoList[line.name] = new Array(line.x1, line.y1, line.x2, line.y2, line.inv, line.type, line.count, line.name);
} // End of the function
function setManipPoints()
{
    var _loc3;
    var _loc1;
    var _loc2 = 0;
    duplicateMovieClip(tla.manip, ["manip" + _loc2], tla.getNextHighestDepth());
    _loc1 = undefined;
    _loc3 = _loc1;
    _loc1._x = _loc1._x + (_loc3._x + 5);
    ++_loc2;
} // End of the function
function redo()
{
    var _loc1;
    lineToUndo = redoLineList[0];
    switch (redoList[lineToUndo][5])
    {
        case 0:
        {
            _loc1 = new Floor(redoList[lineToUndo][0], redoList[lineToUndo][1], redoList[lineToUndo][2], redoList[lineToUndo][3], redoList[lineToUndo][4], redoList[lineToUndo][5], redoList[lineToUndo][6]);
            break;
        } 
        case 1:
        {
            _loc1 = new FloorAcc(redoList[lineToUndo][0], redoList[lineToUndo][1], redoList[lineToUndo][2], redoList[lineToUndo][3], redoList[lineToUndo][4], redoList[lineToUndo][5], redoList[lineToUndo][6]);
            break;
        } 
        case 2:
        {
            _loc1 = new FloorScenery(redoList[lineToUndo][0], redoList[lineToUndo][1], redoList[lineToUndo][2], redoList[lineToUndo][3]);
            break;
        } 
    } // End of switch
    if (redoList[lineToUndo][0] != undefined)
    {
        addLine(_loc1);
    } // end if
    if (redoLineList.length == 1)
    {
        redoLineList[0] = undefined;
    } // end if
    redoLineList.shift();
} // End of the function
function removeLine(line)
{
    if (line.type == 0)
    {
        --blueLines;
    } // end if
    if (line.type == 1)
    {
        --redLines;
    } // end if
    if (line.type == 2)
    {
        --greenLines;
    } // end if
    --Lines;
    statusText.text = Lines + " Lines";
    statusText_blue.text = blueLines + " Floor";
    statusText_red.text = redLines + " Accel";
    statusText_green.text = greenLines + " Scene";
    if (Lines == 0)
    {
        startLine = undefined;
    } // end if
    if (lines[line.nextLine].prevLine == line.name)
    {
        lines[line.nextLine].prevLine = undefined;
        switch (lines[line.nextLine].lim)
        {
            case 1:
            {
                lines[line.nextLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines[line.nextLine].lim = 2;
                break;
            } 
        } // End of switch
    } // end if
    if (lines[line.nextLine].nextLine == line.name)
    {
        lines[line.nextLine].nextLine = undefined;
        switch (lines[line.nextLine].lim)
        {
            case 2:
            {
                lines[line.nextLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines[line.nextLine].lim = 1;
                break;
            } 
        } // End of switch
    } // end if
    if (lines[line.prevLine].prevLine == line.name)
    {
        lines[line.prevLine].prevLine = undefined;
        switch (lines[line.prevLine].lim)
        {
            case 1:
            {
                lines[line.prevLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines[line.prevLine].lim = 2;
                break;
            } 
        } // End of switch
    } // end if
    if (lines[line.prevLine].nextLine == line.name)
    {
        lines[line.prevLine].nextLine = undefined;
        switch (lines[line.prevLine].lim)
        {
            case 2:
            {
                lines[line.prevLine].lim = 0;
                break;
            } 
            case 3:
            {
                lines[line.prevLine].lim = 1;
                break;
            } 
        } // End of switch
    } // end if
    tla[line.name].removeMovieClip();
    redoLineList.unshift(line.name);
    removeFromGrid(line);
    delete lines[line.name];
    false;
    if (Lines == 0)
    {
        undoList = [];
        switchToVersion(VERSION);
    } // end if
} // End of the function
function drawPencil()
{
    tla._xscale = tla._yscale = bufScale;
    var moved = false;
    onMouseDown = function ()
    {
        if (Key.isDown(16))
        {
            preShifted = true;
        }
        else
        {
            preShifted = false;
        } // end else if
        jumpZoomBool = false;
        statusB.text = "";
        tempLine.valid = false;
        moved = false;
        if (active2)
        {
            if (Key.isDown(32) || cursorMode == "hand")
            {
                pan();
                cursor.gotoAndStop(2);
            }
            else
            {
                cursor.gotoAndStop(1);
                if (Key.isDown(88) || xysnap_toggled == true)
                {
                    var _loc5 = 1;
                    mini._x = _root._xmouse;
                    mini._y = _root._ymouse;
                    var _loc8;
                    var _loc9;
                    if (Key.isDown(88) && xysnap_toggled == true)
                    {
                        _loc5 = 0;
                    } // end if
                } // end if
                prevLine = undefined;
                snaped = false;
                tempLine.inv = Key.isDown(16);
                tempLine.x1 = tla._xmouse;
                tempLine.y1 = tla._ymouse;
                var _loc3 = snap(tempLine.x1, tempLine.y1, 1, tempLine.inv);
                if (_loc3[2] != false && pencilMode != 2)
                {
                    var _loc7 = _loc3[2] == 2 ? (-1) : (1);
                    tempLine.x1 = _loc3[0];
                    tempLine.y1 = _loc3[1];
                    prevLine = _loc3[3];
                    snaped = _loc3[2];
                    tempLine.x2 = tla._xmouse;
                    tempLine.y2 = tla._ymouse;
                } // end if
                var distance = 0;
                onMouseMove = function ()
                {
                    moved = true;
                    if (active && active2 && cursor._currentframe != 2)
                    {
                        x = mini._xmouse;
                        y = mini._ymouse * -1;
                        angle = Math.atan(y / x) / 0.017453;
                        if (x < 0)
                        {
                            angle = angle + 180;
                        } // end if
                        if (x >= 0 && y < 0)
                        {
                            angle = angle + 360;
                        } // end if
                        lineAngle = angle * -1;
                        if (Key.isDown(88) || xysnap_toggled == true)
                        {
                            if (lineAngle == 0 || lineAngle >= -30 || lineAngle <= -330)
                            {
                                tempLine.x2 = tla._xmouse;
                                tempLine.y2 = tempLine.y1;
                            }
                            else if (lineAngle <= -30 && lineAngle >= -60)
                            {
                                tempLine.x2 = tla._xmouse;
                                var _loc3 = tempLine.x2 - tempLine.x1;
                                tempLine.y2 = tempLine.y1 - _loc3;
                            }
                            else if (lineAngle <= -60 && lineAngle >= -120)
                            {
                                tempLine.x2 = tempLine.x1;
                                tempLine.y2 = tla._ymouse;
                            }
                            else if (lineAngle <= -120 && lineAngle >= -150)
                            {
                                tempLine.x2 = tla._xmouse;
                                _loc3 = tempLine.x1 - tempLine.x2;
                                tempLine.y2 = tempLine.y1 - _loc3;
                            }
                            else if (lineAngle <= -150 && lineAngle >= -210)
                            {
                                tempLine.x2 = tla._xmouse;
                                tempLine.y2 = tempLine.y1;
                            }
                            else if (lineAngle <= -210 && lineAngle >= -240)
                            {
                                tempLine.x2 = tla._xmouse;
                                _loc3 = tempLine.x1 - tempLine.x2;
                                tempLine.y2 = tempLine.y1 + _loc3;
                            }
                            else if (lineAngle <= -240 && lineAngle >= -300)
                            {
                                tempLine.x2 = tempLine.x1;
                                tempLine.y2 = tla._ymouse;
                            }
                            else if (lineAngle <= -300 && lineAngle >= -330)
                            {
                                tempLine.x2 = tla._xmouse;
                                _loc3 = tempLine.x2 - tempLine.x1;
                                tempLine.y2 = tempLine.y1 + _loc3;
                            }
                            else
                            {
                                tempLine.x2 = tla._xmouse;
                                tempLine.y2 = tla._ymouse;
                            } // end else if
                        }
                        else
                        {
                            tempLine.x2 = tla._xmouse;
                            tempLine.y2 = tla._ymouse;
                        } // end else if
                        tempLine.dx = tempLine.x2 - tempLine.x1;
                        tempLine.dy = tempLine.y2 - tempLine.y1;
                        tempLine.dst = Math.sqrt(Math.pow(tempLine.dx, 2) + Math.pow(tempLine.dy, 2));
                        tempLine.count = totLines;
                        tempLine;
                        distance = distance + Math.round(tempLine.dst);
                        var _loc6 = 1 / (tla._xscale * 0.010000);
                        tempLine.valid = tempLine.dst > MIN_LENGTH * _loc6 && tempLine.dst < MAX_LENGTH;
                        if (tempLine.valid)
                        {
                            tempLine.valid = false;
                            switch (pencilMode)
                            {
                                case 0:
                                {
                                    var _loc2 = new Floor(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                                    break;
                                } 
                                case 1:
                                {
                                    if (!Key.isDown(17))
                                    {
                                        _loc2 = new FloorAcc(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                                    }
                                    else
                                    {
                                        _loc2 = new FloorAcc(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                                    } // end else if
                                    break;
                                } 
                                case 2:
                                {
                                    _loc2 = new FloorScenery(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2);
                                    var _loc5 = tempLine.x2;
                                    var _loc4 = tempLine.y2;
                                    break;
                                } 
                            } // End of switch
                            addLine(_loc2);
                            if (pencilMode != 2 && !Key.isDown(83))
                            {
                                if (prevLine != undefined)
                                {
                                    if (snaped == 1)
                                    {
                                        prevLine.addPrevLine(_loc2, checks[1]);
                                    }
                                    else
                                    {
                                        prevLine.addNextLine(_loc2, checks[1]);
                                    } // end else if
                                    _loc2.addPrevLine(prevLine, checks[1]);
                                } // end if
                                prevLine = _loc2;
                            } // end if
                            mini._x = _root._xmouse;
                            mini._y = _root._ymouse;
                            if (Key.isDown(88) || xysnap_toggled == true)
                            {
                                if (pencilMode == 0 || pencilMode == 1)
                                {
                                    tempLine.x1 = prevLine.x2;
                                    tempLine.y1 = prevLine.y2;
                                }
                                else if (pencilMode == 2)
                                {
                                    tempLine.x1 = _loc5;
                                    tempLine.y1 = _loc4;
                                } // end else if
                            }
                            else
                            {
                                tempLine.x1 = tla._xmouse;
                                tempLine.y1 = tla._ymouse;
                            } // end else if
                            tla.clear();
                        } // end if
                        if (!Key.isDown(68))
                        {
                            tla.clear();
                            tla.lineStyle(1, 16711680, 100);
                            tla.moveTo(tempLine.x1, tempLine.y1);
                            tla.lineTo(tempLine.x2, tempLine.y2);
                        } // end if
                    } // end if
                };
            } // end if
        } // end else if
    };
    onMouseUp = function ()
    {
        checklinecount();
        tla.clear();
        stopDrag ();
        if (!simulation)
        {
            canvasX = tla._x;
            canvasY = tla._y;
        } // end if
        onMouseMove = function ()
        {
        };
        if (active2 && tempLine.valid && cursor._currentframe != 2)
        {
            if (Key.isDown(88) || xysnap_toggled == true)
            {
                var _loc4 = 1;
                mini._x = _root._xmouse;
                mini._y = _root._ymouse;
                var _loc6;
                var _loc5;
                if (Key.isDown(88) && xysnap_toggled == true)
                {
                    _loc4 = 0;
                } // end if
            } // end if
            nextLine = undefined;
            var _loc3 = snap(tempLine.x2, tempLine.y2, 2, tempLine.inv);
            switch (pencilMode)
            {
                case 0:
                {
                    var _loc2 = new Floor(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    break;
                } 
                case 1:
                {
                    if (!Key.isDown(17))
                    {
                        _loc1 = new FloorAcc(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                    }
                    else
                    {
                        _loc1 = new FloorAcc(tempLine.x2, tempLine.y2, tempLine.x1, tempLine.y1, !tempLine.inv);
                    } // end else if
                    break;
                } 
                case 2:
                {
                    _loc2 = new FloorScenery(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2);
                    break;
                } 
            } // End of switch
            addLine(_loc2);
            ++linecount;
            if (pencilMode != 2)
            {
                if (prevLine != undefined)
                {
                    if (snaped == 1)
                    {
                        prevLine.addPrevLine(_loc2, checks[1]);
                    }
                    else
                    {
                        prevLine.addNextLine(_loc2, checks[1]);
                    } // end else if
                    _loc2.addPrevLine(prevLine, checks[1]);
                } // end if
                if (nextLine != undefined)
                {
                    if (_loc3[2] == 1)
                    {
                        nextLine.addPrevLine(_loc2, checks2[1]);
                    }
                    else
                    {
                        nextLine.addNextLine(_loc2, checks2[1]);
                    } // end else if
                    _loc2.addNextLine(nextLine, checks2[1]);
                } // end if
            } // end if
        }
        else if (pencilMode == 2 && cursor._visible == true && moved == false && lastTool != "hand" && !Key.isDown(32))
        {
            tempLine.x1 = tla._xmouse;
            tempLine.y1 = tla._ymouse;
            tempLine.x2 = tla._xmouse + 0.100000;
            tempLine.y2 = tla._ymouse;
            tempLine.inv = false;
            switch (pencilMode)
            {
                case 0:
                {
                    break;
                } 
                case 1:
                {
                    break;
                } 
                case 2:
                {
                    _loc2 = new FloorScenery(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2);
                    break;
                } 
            } // End of switch
            addLine(_loc2);
            ++linecount;
        } // end else if
    };
    drawing = false;
    onEnterFrame = function ()
    {
    };
} // End of the function
function drawLine()
{
    tla._xscale = tla._yscale = bufScale;
    if (!Key.isDown(68))
    {
        onMouseDown = function ()
        {
            if (Key.isDown(16))
            {
                preShifted = true;
            }
            else
            {
                preShifted = false;
            } // end else if
            tempLine.inv = Key.isDown(16);
            jumpZoomBool = false;
            statusB.text = "";
            distance = 0;
            drawing = true;
            tempLine.valid = false;
            if (active2)
            {
                if (Key.isDown(32))
                {
                    pan();
                    cursor.gotoAndStop(2);
                }
                else
                {
                    cursor.gotoAndStop(5);
                    mini._x = _root._xmouse;
                    mini._y = _root._ymouse;
                    if (Key.isDown(88) || xysnap_toggled == true)
                    {
                        var xysnap = 1;
                        var lineAngle;
                        var angle;
                        if (Key.isDown(88) && xysnap_toggled == true)
                        {
                            xysnap = 0;
                        } // end if
                    } // end if
                    drawing = true;
                    prevLine = undefined;
                    snaped = false;
                    tempLine.x1 = tla._xmouse;
                    tempLine.y1 = tla._ymouse;
                    tempLine.valid = false;
                    if (pencilMode != 2)
                    {
                        var lineColor = 7829367;
                    }
                    else
                    {
                        lineColor = 52224;
                    } // end else if
                    var _loc6 = snap(tempLine.x1, tempLine.y1, 1, tempLine.inv);
                    if (_loc6[2] != false && !Key.isDown(83) && snapping == true && pencilMode != 2)
                    {
                        var _loc10 = _loc6[2] == 2 ? (-1) : (1);
                        tempLine.x1 = _loc6[0];
                        tempLine.y1 = _loc6[1];
                        prevLine = _loc6[3];
                        snaped = _loc6[2];
                        if (pencilMode != 2)
                        {
                            lineColor = 3355443;
                        } // end if
                    } // end if
                    onMouseMove = function ()
                    {
                        var _loc1;
                        tempLine.x2 = tla._xmouse;
                        tempLine.y2 = tla._ymouse;
                        tempLine.dx = tempLine.x2 - tempLine.x1;
                        tempLine.dy = tempLine.y2 - tempLine.y1;
                        distance = Math.round(tempLine.dst * 10) / 10;
                        x = mini._xmouse;
                        y = mini._ymouse * -1;
                        angle = Math.atan(y / x) / 0.017453;
                        if (x < 0)
                        {
                            angle = angle + 180;
                        } // end if
                        if (x >= 0 && y < 0)
                        {
                            angle = angle + 360;
                        } // end if
                        angle1 = Math.floor(angle * 10) / 10;
                        angle2 = 360 - angle1;
                        if (xysnap == 1 || Key.isDown(88))
                        {
                            lineAngle = angle * -1;
                            if (lineAngle == 0 || lineAngle >= -30 || lineAngle <= -330)
                            {
                                tempLine.x2 = tla._xmouse;
                                tempLine.y2 = tempLine.y1;
                                _loc1 = "0:360";
                            }
                            else if (lineAngle <= -30 && lineAngle >= -60)
                            {
                                tempLine.x2 = tla._xmouse;
                                var _loc2 = tempLine.x2 - tempLine.x1;
                                tempLine.y2 = tempLine.y1 - _loc2;
                                _loc1 = 45;
                            }
                            else if (lineAngle <= -60 && lineAngle >= -120)
                            {
                                tempLine.x2 = tempLine.x1;
                                tempLine.y2 = tla._ymouse;
                                _loc1 = 90;
                            }
                            else if (lineAngle <= -120 && lineAngle >= -150)
                            {
                                tempLine.x2 = tla._xmouse;
                                _loc2 = tempLine.x1 - tempLine.x2;
                                tempLine.y2 = tempLine.y1 - _loc2;
                                _loc1 = 135;
                            }
                            else if (lineAngle <= -150 && lineAngle >= -210)
                            {
                                tempLine.x2 = tla._xmouse;
                                tempLine.y2 = tempLine.y1;
                                _loc1 = 180;
                            }
                            else if (lineAngle <= -210 && lineAngle >= -240)
                            {
                                tempLine.x2 = tla._xmouse;
                                _loc2 = tempLine.x1 - tempLine.x2;
                                tempLine.y2 = tempLine.y1 + _loc2;
                                _loc1 = 225;
                            }
                            else if (lineAngle <= -240 && lineAngle >= -300)
                            {
                                tempLine.x2 = tempLine.x1;
                                tempLine.y2 = tla._ymouse;
                                _loc1 = 270;
                            }
                            else if (lineAngle <= -300 && lineAngle >= -330)
                            {
                                tempLine.x2 = tla._xmouse;
                                _loc2 = tempLine.x2 - tempLine.x1;
                                tempLine.y2 = tempLine.y1 + _loc2;
                                _loc1 = 315;
                            }
                            else
                            {
                                tempLine.x2 = tla._xmouse;
                                tempLine.y2 = tla._ymouse;
                                _loc1 = angle1;
                            } // end else if
                        }
                        else if (Key.isDown(77))
                        {
                            if (prevLine != undefined)
                            {
                                var _loc5 = (prevLine.y2 - prevLine.y1) / (prevLine.x2 - prevLine.x1);
                                var _loc6 = prevLine.y2 - prevLine.x2 * _loc5;
                                tempLine.y2 = tla._xmouse * _loc5 + _loc6;
                                _loc1 = angle1;
                            } // end if
                        }
                        else
                        {
                            tempLine.x2 = tla._xmouse;
                            tempLine.y2 = tla._ymouse;
                            _loc1 = angle1;
                        } // end else if
                        displayMessage(distance + " px; \n" + _loc1 + "°", 1500);
                        tempLine.dst = Math.sqrt(Math.pow(tempLine.dx, 2) + Math.pow(tempLine.dy, 2));
                        tempLine.invDst = 1 / tempLine.dst;
                        tempLine.nx = tempLine.dy * tempLine.invDst * (tempLine.inv ? (1) : (-1));
                        tempLine.ny = tempLine.dx * tempLine.invDst * (tempLine.inv ? (-1) : (1));
                        var _loc3 = tempLine.nx > 0 ? (Math.ceil(tempLine.nx)) : (Math.floor(tempLine.nx));
                        var _loc4 = tempLine.ny > 0 ? (Math.ceil(tempLine.ny)) : (Math.floor(tempLine.ny));
                        var _loc7 = 1 / (tla._xscale * 0.010000);
                        tempLine.valid = tempLine.dst > 2 * _loc7 && tempLine.dst < MAX_LENGTH;
                        if (Key.isDown(68))
                        {
                        }
                        else if (tempLine.valid)
                        {
                            tla.getNextHighestDepth();
                            tla.clear();
                            if (preview == false)
                            {
                                if (pencilMode == 0)
                                {
                                    tla.lineStyle(2, 26367, 100);
                                    tla.moveTo(tempLine.x1 + _loc3, tempLine.y1 + _loc4);
                                    tla.lineTo(tempLine.x2 + _loc3, tempLine.y2 + _loc4);
                                }
                                else if (pencilMode == 1)
                                {
                                    tla.lineStyle(2, 13369344, 100, true, "horizontal", "round", "miter");
                                    if (!Key.isDown(17))
                                    {
                                        tla.moveTo(tempLine.x1 + _loc3, tempLine.y1 + _loc4);
                                        tla.lineTo(tempLine.x2 + _loc3, tempLine.y2 + _loc4);
                                        tla.moveTo(tempLine.x2, tempLine.y2);
                                        tla.lineTo(tempLine.x2 + (tempLine.nx * 4 - tempLine.dx * tempLine.invDst * 5), tempLine.y2 + (tempLine.ny * 4 - tempLine.dy * tempLine.invDst * 5));
                                        tla.lineTo(tempLine.x2 - tempLine.dx * tempLine.invDst * 5, tempLine.y2 - tempLine.dy * tempLine.invDst * 5);
                                    }
                                    else if (Key.isDown(17))
                                    {
                                        tla.moveTo(tempLine.x2 + _loc3, tempLine.y2 + _loc4);
                                        tla.lineTo(tempLine.x1 + _loc3, tempLine.y1 + _loc4);
                                        tla.moveTo(tempLine.x1, tempLine.y1);
                                        tla.lineTo(tempLine.x1 + (tempLine.nx * 4 + tempLine.dx * tempLine.invDst * 5), tempLine.y1 + (tempLine.ny * 4 + tempLine.dy * tempLine.invDst * 5));
                                        tla.lineTo(tempLine.x1 + tempLine.dx * tempLine.invDst * 5, tempLine.y1 + tempLine.dy * tempLine.invDst * 5);
                                    } // end else if
                                } // end else if
                                tla.lineStyle(2, lineColor, 100);
                                tla.moveTo(tempLine.x1, tempLine.y1);
                                tla.lineTo(tempLine.x2, tempLine.y2);
                            }
                            else if (preview == true)
                            {
                                tla.lineStyle(2, 0, 100);
                                tla.moveTo(tempLine.x1, tempLine.y1);
                                tla.lineTo(tempLine.x2, tempLine.y2);
                            } // end else if
                        }
                        else
                        {
                            tla.getNextHighestDepth();
                            tla.clear();
                            tla.lineStyle(1, 16711680, 100);
                            tla.moveTo(tempLine.x1, tempLine.y1);
                            tla.lineTo(tempLine.x2, tempLine.y2);
                        } // end else if
                    };
                } // end if
            } // end else if
        };
        onMouseUp = function ()
        {
            checklinecount();
            distance = 0;
            drawing = false;
            stopDrag ();
            if (!simulation)
            {
                canvasX = tla._x;
                canvasY = tla._y;
            } // end if
            tla.clear();
            onMouseMove = function ()
            {
            };
            drawing = false;
            pointToStartPoint();
            if (active2 && tempLine.valid && cursor._currentframe != 2)
            {
                nextLine = undefined;
                var _loc2 = snap(tempLine.x2, tempLine.y2, 2, tempLine.inv);
                if (_loc2[2] != false && !Key.isDown(83) && snapping == true && pencilMode != 2)
                {
                    tempLine.x2 = _loc2[0];
                    tempLine.y2 = _loc2[1];
                    nextLine = _loc2[3];
                } // end if
                switch (pencilMode)
                {
                    case 0:
                    {
                        var _loc1 = new Floor(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                        break;
                    } 
                    case 1:
                    {
                        if (!Key.isDown(17))
                        {
                            _loc1 = new FloorAcc(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, tempLine.inv);
                        }
                        else if (Key.isDown(17))
                        {
                            _loc1 = new FloorAcc(tempLine.x2, tempLine.y2, tempLine.x1, tempLine.y1, !tempLine.inv);
                        } // end else if
                        break;
                    } 
                    case 2:
                    {
                        _loc1 = new FloorScenery(tempLine.x1, tempLine.y1, tempLine.x2, tempLine.y2, Key.isDown(68));
                        break;
                    } 
                } // End of switch
                addLine(_loc1);
                if (pencilMode != 2)
                {
                    if (prevLine != undefined)
                    {
                        if (snaped == 1)
                        {
                            prevLine.addPrevLine(_loc1, checks[1]);
                        }
                        else
                        {
                            prevLine.addNextLine(_loc1, checks[1]);
                        } // end else if
                        _loc1.addPrevLine(prevLine, checks[1]);
                    } // end if
                    if (nextLine != undefined)
                    {
                        if (_loc2[2] == 1)
                        {
                            nextLine.addPrevLine(_loc1, checks2[1]);
                        }
                        else
                        {
                            nextLine.addNextLine(_loc1, checks2[1]);
                        } // end else if
                        _loc1.addNextLine(nextLine, checks2[1]);
                    } // end if
                } // end if
            } // end if
        };
        onEnterFrame = function ()
        {
        };
        onMouseMove = function ()
        {
        };
    } // end if
} // End of the function
function lineEditPoint()
{
    onMouseDown = function ()
    {
        if (Key.isDown(32))
        {
            pan();
            cursor.gotoAndStop(2);
        }
        else
        {
            var _loc2 = checkPoint(tla._xmouse, tla._ymouse);
            var _loc2 = _loc2[0];
            var _loc3 = _loc2[1];
            statusB.text = _loc2.length;
            onMouseMove = function ()
            {
                for (var _loc1 in _loc2)
                {
                    if (_loc2[_loc1] != undefined)
                    {
                        _loc2[_loc1].x1 = tla._xmouse;
                        _loc2[_loc1].y1 = tla._ymouse;
                        _loc2[_loc1].calculateConstants();
                        removeFromGrid(_loc2[_loc1]);
                        registerInGrid(_loc2[_loc1]);
                        renderLine(_loc2[_loc1]);
                    } // end if
                } // end of for...in
            };
        } // end else if
    };
    onMouseUp = function ()
    {
        stopDrag ();
        canvasX = tla._x;
        canvasY = tla._y;
        onMouseMove = function ()
        {
        };
    };
} // End of the function
function checkPoint(x, y)
{
    var _loc10 = [];
    var _loc9 = [];
    if (cursorMode == "hand" && handMode == 2)
    {
        var _loc12 = 20;
        var _loc19 = gridPos(x, y);
        var _loc11 = 1 / (tla._xscale * 0.010000);
        for (var _loc18 = -1; _loc18 < 2; ++_loc18)
        {
            var _loc5 = "x" + (_loc19.x + _loc18);
            if (grid[_loc5] == undefined)
            {
                continue;
            } // end if
            for (var _loc6 = -1; _loc6 < 2; ++_loc6)
            {
                var _loc4 = "y" + (_loc19.y + _loc6);
                if (grid[_loc5][_loc4] == undefined)
                {
                    continue;
                } // end if
                for (var _loc20 in grid[_loc5][_loc4].storage)
                {
                    var _loc1 = grid[_loc5][_loc4].storage[_loc20];
                    var _loc17 = [];
                    var _loc3 = x - _loc1.x1;
                    var _loc2 = y - _loc1.y1;
                    var _loc7 = Math.sqrt(Math.pow(_loc3, 2) + Math.pow(_loc2, 2));
                    var _loc8 = Math.sqrt(Math.pow(x - _loc1.x2, 2) + Math.pow(y - _loc1.y2, 2));
                    var _loc15 = Math.abs(_loc1.nx * _loc3 + _loc1.ny * _loc2);
                    var _loc16 = (_loc3 * _loc1.dx + _loc2 * _loc1.dy) * _loc1.invSqrDis;
                    var _loc22;
                    var _loc21;
                    if (_loc7 < _loc12 * _loc11)
                    {
                        _loc10[_loc10.length] = _loc1;
                    } // end if
                    if (_loc8 < _loc12 * _loc11)
                    {
                        _loc9[_loc9.length] = _loc1;
                    } // end if
                } // end of for...in
                return (_loc9);
            } // end of for
        } // end of for
    } // end if
} // End of the function
function nothing()
{
    onMouseDown = function ()
    {
    };
    onMouseMove = function ()
    {
    };
    onMouseUp = function ()
    {
    };
    onEnterFrame = function ()
    {
    };
} // End of the function
function gridPos(x, y)
{
    ggridPos = new Object();
    ggridPos.x = Math.floor(x / GRIDSIZE);
    ggridPos.y = Math.floor(y / GRIDSIZE);
    ggridPos.gx = x - GRIDSIZE * ggridPos.x;
    ggridPos.gy = y - GRIDSIZE * ggridPos.y;
    return (ggridPos);
} // End of the function
function register(line, x, y)
{
    var _loc1 = "x" + x;
    var _loc3 = "y" + y;
    var _loc4 = new Object();
    _loc4.storage = [];
    _loc4.storage2 = [];
    if (grid[_loc1] == undefined)
    {
        grid[_loc1] = [];
    } // end if
    if (grid[_loc1][_loc3] == undefined)
    {
        grid[_loc1][_loc3] = _loc4;
    } // end if
    line.grids.push([x, y]);
    if (line.type != 2)
    {
        grid[_loc1][_loc3].storage2[line.name] = line;
    } // end if
    grid[_loc1][_loc3].storage[line.name] = line;
} // End of the function
function removeFromGrid(line)
{
    for (var _loc1 = 0; _loc1 < line.grids.length; ++_loc1)
    {
        delete grid["x" + line.grids[_loc1][0]]["y" + line.grids[_loc1][1]].storage[line.name];
        delete grid["x" + line.grids[_loc1][0]]["y" + line.grids[_loc1][1]].storage2[line.name];
    } // end of for
} // End of the function
function lineBoxCheck(line, box)
{
    var _loc5 = line.x - box.x;
    var _loc6 = line.y - box.y;
    var _loc3 = Math.abs(line.nx);
    var _loc4 = Math.abs(line.ny);
    var _loc8 = (_loc3 * box.hx + box.hy * _loc4) * _loc3 + (_loc3 * box.hx + _loc4 * box.hy) * _loc4;
    var _loc7 = line.nx * _loc5 + line.ny * _loc6;
    var _loc9 = Math.abs(_loc7 * line.nx) + Math.abs(_loc7 * line.ny);
    if (line.hx + box.hx < Math.abs(_loc5))
    {
        return (false);
    } // end if
    if (line.hy + box.hy < Math.abs(_loc6))
    {
        return (false);
    } // end if
    if (_loc8 < _loc9)
    {
        return (false);
    } // end if
    return (true);
} // End of the function
function verlet(anchors)
{
    for (var _loc1 = 0; _loc1 < anchors.length; ++_loc1)
    {
        anchors[_loc1].verlet(a);
    } // end of for
} // End of the function
function renderLine(line, condition)
{
    var _loc2 = line.parent;
    var _loc3 = new lineDraw(line.x1, line.y1, line.x2, line.y2, Boolean(line.inv), line.type, condition, _loc2, line.nx, line.ny, line.invDst, line.dx, line.dy, line.prevLine.x2, line.prevLine.y2);
} // End of the function
function render()
{
    panScreen(cameraPan);
    world.clear();
    world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 0, 100);
    if (!BindStick.crash && contactpoints == false)
    {
        world.arm1._alpha = world.arm2._alpha = world.leg1._alpha = world.leg2._alpha = world.body._alpha = world.sled._alpha = 100;
        world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 0, 100);
        edges[17].render(world);
        edges[18].render(world);
        world.lineStyle(4 * SCALEDOWN * Math.sqrt(tla._xscale / 100 * (tla._xscale / 100)), 16777215, 100, false, "none", "none");
        edges2[0].render(world);
        edges2[2].render(world);
        edges2[4].render(world);
        world.lineStyle(4 * SCALEDOWN * Math.sqrt(tla._xscale / 100 * (tla._xscale / 100)), 13763074, 100, false, "none", "none");
        edges2[1].render(world);
        edges2[3].render(world);
        edges2[5].render(world);
    }
    else if (world.body.face._currentframe != 14 && contactpoints == false)
    {
        world.body.face.play();
    }
    else if (!BindStick.crash && contactpoints == true)
    {
        world.arm1._alpha = world.arm2._alpha = world.leg1._alpha = world.leg2._alpha = world.body._alpha = world.sled._alpha = 5;
        for (var _loc1 = 0; _loc1 < edges.length; ++_loc1)
        {
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 0, 100);
            edges[17].render(world);
            edges[18].render(world);
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 13369344, 100);
            edges2[0].render(world);
            edges2[1].render(world);
            edges2[2].render(world);
            edges2[3].render(world);
            edges2[4].render(world);
            edges2[5].render(world);
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 16711935, 100);
            edges[11].render(world);
            edges[13].render(world);
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 255, 100);
            edges[12].render(world);
            edges[14].render(world);
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 6710886, 100);
            edges[10].render(world);
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 52224, 100);
            edges[0].render(world);
            edges[1].render(world);
            edges[2].render(world);
            edges[3].render(world);
        } // end of for
    }
    else if (world.body.face._currentframe != 14 && contactpoints == true)
    {
        for (var _loc1 = 0; _loc1 < edges.length; ++_loc1)
        {
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 16711935, 100);
            edges[11].render(world);
            edges[13].render(world);
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 255, 100);
            edges[12].render(world);
            edges[14].render(world);
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 6710886, 100);
            edges[10].render(world);
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 52224, 100);
            edges[0].render(world);
            edges[1].render(world);
            edges[2].render(world);
            edges[3].render(world);
            world.lineStyle(1 * Math.sqrt(SCALEDOWN * SCALEDOWN), 13369344, 100);
            edges2[0].render(world);
            edges2[1].render(world);
            edges2[2].render(world);
            edges2[3].render(world);
            edges2[4].render(world);
            edges2[5].render(world);
        } // end of for
    } // end else if
    world.sled._x = riderAnchors[0].x;
    world.sled._y = riderAnchors[0].y;
    world.body._x = riderAnchors[4].x;
    world.body._y = riderAnchors[4].y;
    world.arm1._x = world.arm2._x = riderAnchors[5].x;
    world.arm1._y = world.arm2._y = riderAnchors[5].y;
    world.leg1._x = world.leg2._x = riderAnchors[4].x;
    world.leg1._y = world.leg2._y = riderAnchors[4].y;
    var _loc3 = riderAnchors[3].x - riderAnchors[0].x;
    var _loc2 = riderAnchors[3].y - riderAnchors[0].y;
    if (dualFakie == false)
    {
        if (_loc3 * (riderAnchors[1].y - riderAnchors[0].y) - _loc2 * (riderAnchors[1].x - riderAnchors[0].x) < 0)
        {
            BindStick.crash = true;
            if (world.sled._yscale != -Math.sqrt(SCALEDOWN * SCALEDOWN) * 100)
            {
                world.sled._yscale = -Math.sqrt(SCALEDOWN * SCALEDOWN) * 100;
                world.sled.gotoAndStop(2);
            } // end if
        }
        else if (world.sled._yscale != Math.sqrt(SCALEDOWN * SCALEDOWN) * 100)
        {
            world.sled._yscale = Math.sqrt(SCALEDOWN * SCALEDOWN) * 100;
            world.sled.gotoAndStop(1);
        } // end else if
    }
    else
    {
        if (_loc3 * (riderAnchors[1].y - riderAnchors[0].y) - _loc2 * (riderAnchors[1].x - riderAnchors[0].x) < 0)
        {
            if (noseFakie == true)
            {
                BindStick.crash = true;
                tailFakie = true;
                if (world.sled._yscale != -Math.sqrt(SCALEDOWN * SCALEDOWN) * 100)
                {
                    world.sled._yscale = -Math.sqrt(SCALEDOWN * SCALEDOWN) * 100;
                    world.sled.gotoAndStop(2);
                } // end if
            }
            else
            {
                tailFakie = true;
            } // end else if
        }
        else
        {
            tailFakie = false;
        } // end else if
        if (_loc3 * (riderAnchors[2].y - riderAnchors[3].y) - _loc2 * (riderAnchors[2].x - riderAnchors[3].x) < 0)
        {
            if (tailFakie == true)
            {
                BindStick.crash = true;
                noseFakie = true;
                if (world.sled._yscale != -Math.sqrt(SCALEDOWN * SCALEDOWN) * 100)
                {
                    world.sled._yscale = -Math.sqrt(SCALEDOWN * SCALEDOWN) * 100;
                    world.sled.gotoAndStop(2);
                } // end if
            }
            else
            {
                noseFakie = true;
            } // end else if
        }
        else
        {
            noseFakie = false;
        } // end else if
    } // end else if
    if (_loc3 * (riderAnchors[5].y - riderAnchors[4].y) - _loc2 * (riderAnchors[5].x - riderAnchors[4].x) > 0)
    {
        BindStick.crash = true;
    } // end if
    world.sled._rotation = Math.atan2(_loc2, _loc3) * TO_DEG;
    world.body._rotation = Math.atan2(riderAnchors[5].y - riderAnchors[4].y, riderAnchors[5].x - riderAnchors[4].x) * TO_DEG;
    world.leg1._rotation = Math.atan2(riderAnchors[8].y - riderAnchors[4].y, riderAnchors[8].x - riderAnchors[4].x) * TO_DEG;
    world.arm1._rotation = Math.atan2(riderAnchors[7].y - riderAnchors[5].y, riderAnchors[7].x - riderAnchors[5].x) * TO_DEG;
    world.leg2._rotation = Math.atan2(riderAnchors[9].y - riderAnchors[4].y, riderAnchors[9].x - riderAnchors[4].x) * TO_DEG;
    world.arm2._rotation = Math.atan2(riderAnchors[6].y - riderAnchors[5].y, riderAnchors[6].x - riderAnchors[5].x) * TO_DEG;
    if (world.sankac._visible)
    {
        world.lineStyle(4 * Math.sqrt(SCALEDOWN * SCALEDOWN) * tla._xscale / 100, 16777215, 100, false, "none", "none");
        edges2[0].render(world);
        edges2[2].render(world);
        edges2[4].render(world);
        world.lineStyle(4 * Math.sqrt(SCALEDOWN * SCALEDOWN) * tla._xscale / 100, 13763074, 100, false, "none", "none");
        edges2[1].render(world);
        edges2[3].render(world);
        edges2[5].render(world);
    } // end if
    var _loc4 = time(frames);
    _loc3 = Math.sqrt(riderAnchors[5].dx * riderAnchors[5].dx) + Math.sqrt((riderAnchors[5].dy - 0.175000) * (riderAnchors[5].dy - 0.175000));
    _loc3 = Math.floor(_loc3 * 1000) / 1000;
    if (_loc3 > topSpeed)
    {
        topSpeed = _loc3;
    } // end if
    statusText_blue.text = _loc4;
    statusText_red.text = _loc3 + " p/f";
    statusText_green.text = topSpeed + " max";
    if (UIDis == "hide")
    {
        statusText._visible = false;
    } // end if
    if (UIDis == "minimal" || UIDis == "hide")
    {
        statusText_blue._visible = false;
        statusText_red._visible = false;
        statusText_green._visible = false;
    } // end if
} // End of the function
function panScreen(con)
{
    point1.x = riderAnchors[cameraPoint].x;
    point1.y = riderAnchors[cameraPoint].y;
    world.localToGlobal(point1);
    if (con == 0)
    {
        if (point1.x > barrierR)
        {
            var _loc1 = barrierR - point1.x;
        }
        else if (point1.x < barrierL)
        {
            _loc1 = barrierL - point1.x;
        }
        else
        {
            _loc1 = 0;
        } // end else if
        if (point1.y > barrierB)
        {
            offsety = barrierB - point1.y;
        }
        else if (point1.y < barrierT)
        {
            offsety = barrierT - point1.y;
        }
        else
        {
            var offsety = 0;
        } // end else if
    }
    else if (con == 1)
    {
        if (point1.x > barrierR * 0.900000)
        {
            _loc1 = barrierR * 0.900000 - point1.x;
        }
        else if (point1.x < barrierL * 1.100000)
        {
            _loc1 = barrierL * 1.100000 - point1.x;
        }
        else
        {
            _loc1 = 0;
        } // end else if
        if (point1.y > barrierB * 0.900000)
        {
            offsety = barrierB * 0.900000 - point1.y;
        }
        else if (point1.y < barrierT * 1.100000)
        {
            offsety = barrierT * 1.100000 - point1.y;
        }
        else
        {
            var offsety = 0;
        } // end else if
    }
    else if (con == 2)
    {
        if (point1.x > barrierR * 1.200000)
        {
            _loc1 = barrierR * 1.200000 - point1.x;
        }
        else if (point1.x < barrierL * 0.800000)
        {
            _loc1 = barrierL * 0.800000 - point1.x;
        }
        else
        {
            _loc1 = 0;
        } // end else if
        if (point1.y > barrierB * 1.200000)
        {
            offsety = barrierB * 1.200000 - point1.y;
        }
        else if (point1.y < barrierT * 0.800000)
        {
            offsety = barrierT * 0.800000 - point1.y;
        }
        else
        {
            var offsety = 0;
        } // end else if
    }
    else if (con == 3)
    {
        if (point1.x > Stage.width / 2)
        {
            _loc1 = Stage.width / 2 - point1.x;
        }
        else if (point1.x < Stage.width / 2)
        {
            _loc1 = Stage.width / 2 - point1.x;
        }
        else
        {
            _loc1 = 0;
        } // end else if
        if (point1.y > Stage.height / 2)
        {
            offsety = Stage.height / 2 - point1.y;
        }
        else if (point1.y < Stage.height / 2)
        {
            offsety = Stage.height / 2 - point1.y;
        }
        else
        {
            var offsety = 0;
        } // end else if
    } // end else if
    tla._x = world._x = world._x + _loc1;
    tla._y = world._y = world._y + offsety;
} // End of the function
function satisfyConstraints()
{
    colided = false;
    for (var _loc1 = 0; _loc1 < ITERATE; ++_loc1)
    {
        satisfyDistance(edges);
        satisfyBoundaries();
    } // end of for
    satisfyDistance(edges2);
} // End of the function
function satisfyBoundaries()
{
    for (var _loc7 = 0; _loc7 < riderAnchors.length; ++_loc7)
    {
        var _loc5 = riderAnchors[_loc7];
        var _loc6 = gridPos(_loc5.x, _loc5.y);
        for (var _loc4 = -1; _loc4 < 2; ++_loc4)
        {
            var _loc1 = "x" + (_loc6.x + _loc4);
            if (grid[_loc1] == undefined)
            {
                continue;
            } // end if
            for (var _loc3 = -1; _loc3 < 2; ++_loc3)
            {
                var _loc2 = "y" + (_loc6.y + _loc3);
                if (grid[_loc1][_loc2] == undefined)
                {
                    continue;
                } // end if
                for (var _loc8 in grid[_loc1][_loc2].storage2)
                {
                    grid[_loc1][_loc2].storage2[_loc8].colide(_loc5);
                } // end of for...in
            } // end of for
        } // end of for
    } // end of for
} // End of the function
function wipe()
{
    for (var _loc2 in lines)
    {
        var _loc1 = lines[_loc2];
        _loc1.parent.clear();
    } // end of for...in
} // End of the function
function satisfyDistance(edges)
{
    for (var _loc1 = 0; _loc1 < edges.length; ++_loc1)
    {
        if (edges[_loc1].satisfyDistance())
        {
        } // end if
    } // end of for
} // End of the function
function cleanUp()
{
    for (var _loc1 = 0; _loc1 < edges.length; ++_loc1)
    {
        delete edges[_loc1];
    } // end of for
    for (var _loc1 = 0; _loc1 < riderAnchors.length; ++_loc1)
    {
        delete riderAnchors[_loc1];
    } // end of for
} // End of the function
function moveToStartPos()
{
    for (var _loc1 = 0; _loc1 < riderAnchors.length; ++_loc1)
    {
        riderAnchors[_loc1].x = riderAnchors[_loc1].x + tla.startPoint._x;
        riderAnchors[_loc1].y = riderAnchors[_loc1].y + tla.startPoint._y;
        riderAnchors[_loc1].vx = riderAnchors[_loc1].x - vOffSet * Math.sqrt(SCALEDOWN * SCALEDOWN);
        riderAnchors[_loc1].vy = riderAnchors[_loc1].y;
    } // end of for
    for (var _loc1 = 0; _loc1 < scarfAnchors.length; ++_loc1)
    {
        scarfAnchors[_loc1].x = scarfAnchors[_loc1].x + tla.startPoint._x;
        scarfAnchors[_loc1].y = scarfAnchors[_loc1].y + tla.startPoint._y;
        scarfAnchors[_loc1].vx = scarfAnchors[_loc1].x - vOffSet * Math.sqrt(SCALEDOWN * SCALEDOWN);
        scarfAnchors[_loc1].vy = scarfAnchors[_loc1].y;
    } // end of for
} // End of the function
function switchToVersion(ver)
{
    switch (ver)
    {
        case "6":
        {
            compatible = "6";
            MAX_LENGTH = 2000;
            registerInGrid = function (line)
            {
                var _loc8 = gridPos(line.x1, line.y1);
                var _loc7 = gridPos(line.x2, line.y2);
                for (var _loc5 = Math.min(_loc8.x, _loc7.x); _loc5 <= Math.max(_loc7.x, _loc8.x); ++_loc5)
                {
                    for (var _loc2 = Math.min(_loc8.y, _loc7.y); _loc2 <= Math.max(_loc7.y, _loc8.y); ++_loc2)
                    {
                        var _loc1 = new Object();
                        _loc1.storage = [];
                        _loc1.x = _loc5 * GRIDSIZE + GRIDSIZE * 0.500000;
                        _loc1.y = _loc2 * GRIDSIZE + GRIDSIZE * 0.500000;
                        _loc1.hx = _loc1.hy = GRIDSIZE * 0.500000;
                        burek = lineBoxCheck(line, _loc1);
                        if (burek)
                        {
                            var _loc3 = "x" + _loc5;
                            var _loc6 = "y" + _loc2;
                            if (grid[_loc3] == undefined)
                            {
                                grid[_loc3] = [];
                            } // end if
                            if (grid[_loc3][_loc6] == undefined)
                            {
                                grid[_loc3][_loc6] = _loc1;
                            } // end if
                            line.grids.push([_loc5, _loc2]);
                            if (line.type != 2)
                            {
                                grid[_loc3][_loc6].storage[line.name] = line;
                            } // end if
                        } // end if
                    } // end of for
                } // end of for
            };
            break;
        } 
        case "6.1":
        {
            compatible = "6.1";
            MAX_LENGTH = 2000;
            registerInGrid = function (line)
            {
                var _loc1 = gridPos(line.x1, line.y1);
                var _loc10 = gridPos(line.x2, line.y2);
                var _loc14 = line.dx > 0 ? (_loc10.x) : (_loc1.x);
                var _loc11 = line.dx > 0 ? (_loc1.x) : (_loc10.x);
                var _loc15 = line.dy > 0 ? (_loc10.y) : (_loc1.y);
                var _loc12 = line.dy > 0 ? (_loc1.y) : (_loc10.y);
                if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc10.x && _loc1.y == _loc10.y)
                {
                    register(line, _loc1.x, _loc1.y);
                    return;
                }
                else
                {
                    register(line, _loc1.x, _loc1.y);
                } // end else if
                var _loc3 = line.x1;
                var _loc2 = line.y1;
                if (line.dx != 0 && line.dy != 0)
                {
                    var _loc9 = line.dy / line.dx;
                    var _loc13 = 1 / _loc9;
                    var _loc8 = line.y1 - _loc9 * line.x1;
                } // end if
                while (true)
                {
                    var _loc6 = line.dx > 0 ? (GRIDSIZE - _loc1.gx) : (-(_loc1.gx + 1));
                    var _loc5 = line.dy > 0 ? (GRIDSIZE - _loc1.gy) : (-(_loc1.gy + 1));
                    if (line.dx == 0)
                    {
                        _loc2 = _loc2 + _loc5;
                    }
                    else if (line.dy == 0)
                    {
                        _loc3 = _loc3 + _loc6;
                    }
                    else
                    {
                        var _loc7 = Math.round(_loc9 * (_loc3 + _loc6) + _loc8);
                        if (Math.abs(_loc7 - _loc2) < Math.abs(_loc5))
                        {
                            _loc3 = _loc3 + _loc6;
                            _loc2 = _loc7;
                        }
                        else if (Math.abs(_loc7 - _loc2) == Math.abs(_loc5))
                        {
                            _loc3 = _loc3 + _loc6;
                            _loc2 = _loc2 + _loc5;
                        }
                        else
                        {
                            _loc3 = Math.round((_loc2 + _loc5 - _loc8) * _loc13);
                            _loc2 = _loc2 + _loc5;
                        } // end else if
                    } // end else if
                    _loc1 = gridPos(_loc3, _loc2);
                    if (_loc1.x >= _loc11 && _loc1.x <= _loc14 && _loc1.y >= _loc12 && _loc1.y <= _loc15)
                    {
                        register(line, _loc1.x, _loc1.y);
                        continue;
                    } // end if
                    return;
                } // end while
            };
            break;
        } 
        case "6.2":
        {
            compatible = "6.2";
            MAX_LENGTH = 2000;
            registerInGrid = function (line)
            {
                var _loc1 = gridPos(line.x1, line.y1);
                var _loc10 = gridPos(line.x2, line.y2);
                var _loc13 = line.dx > 0 ? (_loc10.x) : (_loc1.x);
                var _loc11 = line.dx > 0 ? (_loc1.x) : (_loc10.x);
                var _loc7 = line.dy > 0 ? (_loc10.y) : (_loc1.y);
                var _loc12 = line.dy > 0 ? (_loc1.y) : (_loc10.y);
                if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc10.x && _loc1.y == _loc10.y)
                {
                    register(line, _loc1.x, _loc1.y);
                    return;
                }
                else
                {
                    register(line, _loc1.x, _loc1.y);
                } // end else if
                var _loc4 = line.x1;
                var _loc3 = line.y1;
                var _loc8 = 1 / line.dx;
                var _loc9 = 1 / line.dy;
                while (true)
                {
                    var _loc5;
                    if (_loc1.x < 0)
                    {
                        difX = line.dx > 0 ? (GRIDSIZE + _loc1.gx) : (-GRIDSIZE - _loc1.gx);
                    }
                    else
                    {
                        difX = line.dx > 0 ? (GRIDSIZE - _loc1.gx) : (-(_loc1.gx + 1));
                    } // end else if
                    if (_loc1.y < 0)
                    {
                        _loc5 = line.dy > 0 ? (GRIDSIZE + _loc1.gy) : (-GRIDSIZE - _loc1.gy);
                    }
                    else
                    {
                        _loc5 = line.dy > 0 ? (GRIDSIZE - _loc1.gy) : (-(_loc1.gy + 1));
                    } // end else if
                    if (line.dx == 0)
                    {
                        _loc3 = _loc3 + _loc5;
                    }
                    else if (line.dy == 0)
                    {
                        _loc4 = _loc4 + difX;
                    }
                    else
                    {
                        var _loc6 = _loc3 + line.dy * difX * _loc8;
                        if (Math.abs(_loc6 - _loc3) < Math.abs(_loc5))
                        {
                            _loc4 = _loc4 + difX;
                            _loc3 = _loc6;
                        }
                        else if (Math.abs(_loc6 - _loc3) == Math.abs(_loc5))
                        {
                            _loc4 = _loc4 + difX;
                            _loc3 = _loc3 + _loc5;
                        }
                        else
                        {
                            _loc4 = _loc4 + line.dx * _loc5 * _loc9;
                            _loc3 = _loc3 + _loc5;
                        } // end else if
                    } // end else if
                    _loc1 = gridPos(_loc4, _loc3);
                    if (_loc1.x >= _loc11 && _loc1.x <= _loc13 && _loc1.y >= _loc12 && _loc1.y <= _loc7)
                    {
                        register(line, _loc1.x, _loc1.y);
                        continue;
                    } // end if
                    return;
                } // end while
            };
            break;
        } 
    } // End of switch
} // End of the function
function setManipLine(x, y)
{
    var _loc15 = gridPos(x, y);
    var _loc8 = 1 / (tla._xscale * 0.010000);
    for (var _loc14 = -1; _loc14 < 2; ++_loc14)
    {
        var _loc6 = "x" + (_loc15.x + _loc14);
        if (grid[_loc6] == undefined)
        {
            continue;
        } // end if
        for (var _loc7 = -1; _loc7 < 2; ++_loc7)
        {
            var _loc4 = "y" + (_loc15.y + _loc7);
            if (grid[_loc6][_loc4] == undefined)
            {
                continue;
            } // end if
            for (var _loc16 in grid[_loc6][_loc4].storage)
            {
                var _loc1 = grid[_loc6][_loc4].storage[_loc16];
                var _loc2 = x - _loc1.x1;
                var _loc3 = y - _loc1.y1;
                var _loc10 = Math.sqrt(Math.pow(_loc2, 2) + Math.pow(_loc3, 2));
                var _loc9 = Math.sqrt(Math.pow(x - _loc1.x2, 2) + Math.pow(y - _loc1.y2, 2));
                var _loc11 = Math.abs(_loc1.nx * _loc2 + _loc1.ny * _loc3);
                var _loc5 = (_loc2 * _loc1.dx + _loc3 * _loc1.dy) * _loc1.invSqrDis;
                if (_loc10 < ERASER_SIZE * _loc8 || _loc9 < ERASER_SIZE * _loc8 || _loc11 < ERASER_SIZE * _loc8 && _loc5 >= 0 && _loc5 <= 1)
                {
                    removeMovieClip (tla.manip);
                    removeMovieClip (tla.manip2);
                    tla.manipBase.duplicateMovieClip("manip", tla.getNextHighestDepth());
                    tla.manip._x = _loc1.x1;
                    tla.manip._y = _loc1.y1;
                    tla.manip._visible = true;
                    tla.manipBase.duplicateMovieClip("manip2", tla.getNextHighestDepth());
                    tla.manip2._x = _loc1.x2;
                    tla.manip2._y = _loc1.y2;
                    tla.manip2._visible = true;
                    tla.manip.gotoAndStop(1);
                    tla.manip2.gotoAndStop(1);
                    activeManipLine = _loc1;
                } // end if
            } // end of for...in
        } // end of for
    } // end of for
} // End of the function
function simulate()
{
    bur = getTimer();
    slowMotion = Autoslow;
    if (pauseStatus == true)
    {
        render();
    } // end if
    onEnterFrame = function ()
    {
        if (UIDis != "hide")
        {
            if (gameFPS < 40 && locked40 == false)
            {
                statusText.text = gameFPS + " fps";
            }
            else if (gameFPS >= 40 && locked40 != true)
            {
                statusText.text = "40 fps";
            }
            else if (locked40 == true)
            {
                if (panel.menuB.statusTextLock.text == "var:speed")
                {
                    statusText.text = Math.round((Math.sqrt(riderAnchors[5].dx * riderAnchors[5].dx) + Math.sqrt((riderAnchors[5].dy - 0.175000) * (riderAnchors[5].dy - 0.175000))) * 1000) / 1000 + " p/f";
                }
                else if (panel.menuB.statusTextLock.text == "var:time")
                {
                    statusText.text = time(frames);
                }
                else if (panel.menuB.statusTextLock.text == "var:topSpeed")
                {
                    statusText.text = topSpeed + " max";
                }
                else if (panel.menuB.statusTextLock.text == "var:frames")
                {
                    statusText.text = frames + " fr";
                }
                else
                {
                    statusText.text = panel.menuB.statusTextLock.text;
                } // end else if
            } // end else if
        }
        else
        {
            statusText.text = "";
        } // end else if
        frameCounter = 0;
        bur = getTimer();
        if (!slowMotion || bur - pre > slowmonumber)
        {
            pre = bur;
            if (liveHitTest)
            {
                for (var _loc1 in lines)
                {
                    renderLine(lines[_loc1], "preview");
                } // end of for...in
            } // end if
            if (Key.isDown(88))
            {
                _loc3 = tla._xscale;
                _loc2 = Math.max(_loc3 * 0.900000, 5);
                world._xscale = world._yscale = tla._xscale = tla._yscale = _loc2;
                world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc2 / _loc3);
                world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc2 / _loc3);
                displayMessage(Math.round(_loc2) + ".x zoom", 1500);
            } // end if
            if (Key.isDown(90))
            {
                _loc3 = tla._xscale;
                _loc2 = Math.min(_loc3 * 1.100000, 2400);
                world._xscale = world._yscale = tla._xscale = tla._yscale = _loc2;
                world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc2 / _loc3);
                world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc2 / _loc3);
                displayMessage(Math.round(_loc2) + ".x zoom", 1500);
            } // end if
            if (Key.isDown(66))
            {
                _loc3 = tla._xscale;
                _loc2 = Math.max(_loc3 * 0.990000, 5);
                world._xscale = world._yscale = tla._xscale = tla._yscale = _loc2;
                world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc2 / _loc3);
                world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc2 / _loc3);
                displayMessage(Math.round(_loc2) + ".x zoom", 1500);
            } // end if
            if (Key.isDown(86))
            {
                _loc3 = tla._xscale;
                _loc2 = Math.min(_loc3 * 1.010000, 2400);
                world._xscale = world._yscale = tla._xscale = tla._yscale = _loc2;
                world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc2 / _loc3);
                world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc2 / _loc3);
                displayMessage(Math.round(_loc2) + ".x zoom", 1500);
            } // end if
            var _loc3 = false;
            if (!Key.isDown(32) && !Key.isDown(17) && pauseStatus == false)
            {
                verlet(riderAnchors);
                scarfAnchors[1].x = scarfAnchors[1].x + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dx, 125);
                scarfAnchors[1].y = scarfAnchors[1].y + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dy, 125);
                verlet(scarfAnchors);
                satisfyConstraints();
                ++frames;
                storeFrame(frames - 1);
                render();
            }
            else if (Key.isDown(32) && pauseStatus == false && !Key.isDown(17))
            {
                if (massPointCache[frames + ffNumber] != undefined && Key.isDown(16))
                {
                    for (var _loc2 = 0; _loc2 < ffNumber; ++_loc2)
                    {
                        injectPoint(frames + _loc2);
                        ++frames;
                        displayMessage(">> x" + ffNumber, 1);
                        storeFrame(frames - 1);
                    } // end of for
                    render();
                }
                else
                {
                    for (var _loc2 = 0; _loc2 < ffNumber; ++_loc2)
                    {
                        verlet(riderAnchors);
                        scarfAnchors[1].x = scarfAnchors[1].x + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dx, 125);
                        scarfAnchors[1].y = scarfAnchors[1].y + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dy, 125);
                        verlet(scarfAnchors);
                        satisfyConstraints();
                        if (ffNumber < gameFPS)
                        {
                            displayMessage(">> x" + ffNumber + "\n •••", 1);
                        }
                        else
                        {
                            displayMessage(">> x" + ffNumber + "\n •••\n FPS to low for optimal performance", 1);
                        } // end else if
                        ++frames;
                        storeFrame(frames - 1);
                        render();
                    } // end of for
                } // end else if
            }
            else if (pauseStatus == false && Key.isDown(17) && frames > 0)
            {
                var _loc2 = 0;
                while (_loc2 < rwNumber)
                {
                    if (frames > 0)
                    {
                        injectPoint(frames - 1);
                        displayMessage("<< x" + rwNumber, 1);
                    } // end if
                    ++_loc2;
                } // end while
                render();
            }
            else if (pauseStatus == true)
            {
                render();
            } // end else if
            if (saveNow)
            {
                save();
                if (Key.isDown(67) || ghost == true)
                {
                    tla.flag._visible = true;
                    if (BindStick.crash)
                    {
                        tla.flag._x = riderAnchors[4].x;
                        tla.flag._y = riderAnchors[4].y;
                    }
                    else
                    {
                        tla.flag._x = riderAnchors[1].x;
                        tla.flag._y = riderAnchors[1].y;
                    } // end else if
                    tla.flag._alpha = 0;
                    tla.flag._visible = false;
                    tla.dummy._visible = true;
                    tla.dummy.body._x = world.body._x;
                    tla.dummy.body._y = world.body._y;
                    tla.dummy.body._rotation = world.body._rotation;
                    tla.dummy.arm1._x = world.arm1._x;
                    tla.dummy.arm1._y = world.arm1._y;
                    tla.dummy.arm1._rotation = world.arm1._rotation;
                    tla.dummy.arm2._x = world.arm2._x;
                    tla.dummy.arm2._y = world.arm2._y;
                    tla.dummy.arm2._rotation = world.arm2._rotation;
                    tla.dummy.leg1._x = world.leg1._x;
                    tla.dummy.leg1._y = world.leg1._y;
                    tla.dummy.leg1._rotation = world.leg1._rotation;
                    tla.dummy.leg2._x = world.leg2._x;
                    tla.dummy.leg2._y = world.leg2._y;
                    tla.dummy.leg2._rotation = world.leg2._rotation;
                    tla.dummy.sled._x = world.sled._x;
                    tla.dummy.sled._y = world.sled._y;
                    tla.dummy.sled._rotation = world.sled._rotation;
                    tla.dummy.sled._yscale = world.sled._yscale;
                    tla.dummy.sled.gotoAndStop(world.sled._currentframe);
                    tla.dummy.body.face.gotoAndStop(world.body.face._currentframe);
                    tla.dummy.flagTime._x = tla.dummy.arm1._x - 70;
                    tla.dummy.flagTime._y = tla.dummy.arm1._y - 10;
                    timeflag = statusText_blue.text;
                    _loc2 = time(frames + 1);
                    tla.dummy.flagTime.text = _loc2;
                }
                else
                {
                    tla.dummy._visible = false;
                    tla.flag._visible = true;
                    tla.flag._alpha = 100;
                    if (BindStick.crash)
                    {
                        tla.flag._x = riderAnchors[4].x;
                        tla.flag._y = riderAnchors[4].y;
                    }
                    else
                    {
                        tla.flag._x = riderAnchors[1].x;
                        tla.flag._y = riderAnchors[1].y;
                    } // end else if
                } // end else if
                saveNow = false;
                riding = BindStick.crash;
                sledState = world.sled._currentframe;
                faceState = world.body.face._currentframe;
            } // end if
        } // end if
        ++frameCounter;
    };
} // End of the function
function storeFrame(_frame)
{
    var _loc2 = [];
    var _loc1 = [];
    for (var _loc4 in riderAnchors)
    {
        _loc2[_loc4] = [riderAnchors[_loc4].x, riderAnchors[_loc4].y, riderAnchors[_loc4].dx, riderAnchors[_loc4].dy, riderAnchors[_loc4].vx, riderAnchors[_loc4].vy, BindStick.crash];
    } // end of for...in
    for (var _loc3 in scarfAnchors)
    {
        _loc1[_loc3] = [scarfAnchors[_loc3].x, scarfAnchors[_loc3].y, scarfAnchors[_loc3].dx, scarfAnchors[_loc3].dy, scarfAnchors[_loc3].vx, scarfAnchors[_loc3].vy];
    } // end of for...in
    massPointCache[_frame] = _loc2;
    massPointScarfCache[_frame] = _loc1;
} // End of the function
function injectPoint(_frame)
{
    if (massPointCache[_frame] != undefined)
    {
        for (var _loc3 in riderAnchors)
        {
            riderAnchors[_loc3].x = massPointCache[_frame][_loc3][0];
            riderAnchors[_loc3].y = massPointCache[_frame][_loc3][1];
            riderAnchors[_loc3].dx = massPointCache[_frame][_loc3][2];
            riderAnchors[_loc3].dy = massPointCache[_frame][_loc3][3];
            riderAnchors[_loc3].vx = massPointCache[_frame][_loc3][4];
            riderAnchors[_loc3].vy = massPointCache[_frame][_loc3][5];
            BindStick.crash = massPointCache[_frame][_loc3][6];
            if (massPointCache[_frame][_loc3][6] == false)
            {
                world.body.face.gotoAndStop(1);
                world.sled.gotoAndStop(1);
            } // end if
        } // end of for...in
        for (var _loc2 in scarfAnchors)
        {
            scarfAnchors[_loc2].x = massPointScarfCache[_frame][_loc2][0];
            scarfAnchors[_loc2].y = massPointScarfCache[_frame][_loc2][1];
            scarfAnchors[_loc2].dx = massPointScarfCache[_frame][_loc2][2];
            scarfAnchors[_loc2].dy = massPointScarfCache[_frame][_loc2][3];
            scarfAnchors[_loc2].vx = massPointScarfCache[_frame][_loc2][4];
            scarfAnchors[_loc2].vy = massPointScarfCache[_frame][_loc2][5];
        } // end of for...in
        if (_frame != 0)
        {
            --frames;
            var _loc4 = _frame - 1;
            if (frames != _frame)
            {
                frames = _loc4;
            } // end if
        } // end if
    } // end if
} // End of the function
function renderPlaybackLines()
{
    if (colorplay != true)
    {
        if (!Key.isDown(67))
        {
            for (var _loc3 in lines)
            {
                var _loc1 = lines[_loc3];
                var _loc2 = new lineDraw(lines.x1, lines.y1, lines.x2, lines.y2, Boolean(lines.inv), line.type, "editor", _loc1, line.nx, line.ny, line.invDst, line.dx, line.dy);
            } // end of for...in
        } // end if
    } // end if
    if (colorplay == true)
    {
        if (Key.isDown(67))
        {
            for (var _loc3 in lines)
            {
                _loc1 = lines[_loc3];
                _loc2 = new lineDraw(lines.x1, lines.y1, lines.x2, lines.y2, Boolean(lines.inv), line.type, "simColor", _loc1, line.nx, line.ny, line.invDst, line.dx, line.dy);
            } // end of for...in
        } // end if
    } // end if
} // End of the function
function time(_loc0)
{
    var _loc2 = _loc0;
    var _loc3 = int(_loc2 / 40);
    var _loc8 = _loc2;
    var _loc7 = _loc3;
    var _loc6 = int(_loc3 / 60);
    var _loc1 = _loc2 - _loc3 * 40;
    var _loc5 = _loc3 - _loc6 * 60;
    var _loc4 = "";
    if (_loc2 < 40)
    {
        if (_loc2 < 10)
        {
            _loc4 = "0:0" + _loc2;
        }
        else
        {
            _loc4 = "0:" + _loc2;
        } // end else if
    }
    else if (_loc2 >= 40 && _loc3 < 60)
    {
        if (_loc1 < 10)
        {
            _loc1 = "0" + _loc1;
        } // end if
        _loc4 = _loc3 + ":" + _loc1;
    }
    else if (_loc3 >= 60)
    {
        if (_loc1 < 10)
        {
            _loc1 = "0" + _loc1;
        } // end if
        if (_loc5 < 10)
        {
            _loc5 = "0" + _loc5;
        } // end if
        _loc4 = _loc6 + ":" + _loc5 + ":" + _loc1;
    } // end else if
    return (_loc4);
} // End of the function
function checklinecount()
{
    if (panel.fileDialog._visible == false || panel.menuB._visible == false)
    {
        if (linetracker >= linecountauto && lineauto == true && autosave == true)
        {
            var _loc1 = getDateAndTime();
            autosaving = true;
            saveFunction("Autosave " + _loc1, true);
            linetracker = 0;
        }
        else if (linetracker >= linecountauto && autosave != true)
        {
            linetracker = 0;
        } // end if
    } // end else if
} // End of the function
function adjustSettings()
{
    panel.menuB.setZoomBtn.onPress = function ()
    {
        var _loc1 = int(panel.menuB.jumpZoomInput.text);
        if (_loc1 <= 2400 && _loc1 >= 5)
        {
            setZoom(_loc1);
            displayMessage("Set zoom to " + _loc1, 2500);
        }
        else
        {
            displayMessage("Number must be >= 5 and <= 2400", 2500);
        } // end else if
    };
    panel.menuB.colorPlay.onPress = function ()
    {
        if (colorplay == false)
        {
            colorplay = true;
        }
        else if (colorplay == true)
        {
            colorplay = false;
        } // end else if
    };
    panel.menuB.AutoSlow.onPress = function ()
    {
        if (Autoslow == false)
        {
            Autoslow = true;
            slowmonumber = Lastslownumber;
        }
        else if (Autoslow == true)
        {
            Autoslow = false;
            slowmonumber = Lastslownumber;
        } // end else if
    };
    panel.menuB.textVis.onPress = function ()
    {
        if (stattextvis == false)
        {
            stattextvis = true;
        }
        else if (stattextvis != false)
        {
            stattextvis = false;
        } // end else if
    };
    panel.menuB.panelVis.onPress = function ()
    {
        if (panelvis == false)
        {
            panelvis = true;
        }
        else if (panelvis != false)
        {
            panelvis = false;
        } // end else if
    };
    panel.menuB.lockedFPS.onPress = function ()
    {
        if (locked40 == false)
        {
            locked40 = true;
        }
        else if (locked40 != false)
        {
            locked40 = false;
        } // end else if
    };
    if (versionPlayback == 0)
    {
        UIDis = "Full";
        panel.menuB.versionPlayback.stepcount.text = "Full Text";
    } // end if
    if (versionPlayback == 1)
    {
        UIDis = "minimal";
        panel.menuB.versionPlayback.stepcount.text = "Minimal";
    } // end if
    if (versionPlayback == 2)
    {
        UIDis = "hide";
        panel.menuB.versionPlayback.stepcount.text = "Hidden";
    } // end if
    panel.menuB.versionPlayback.stepUp.onPress = function ()
    {
        if (versionPlayback == 2)
        {
            versionPlayback = 0;
            UIDis = "Full";
            panel.menuB.versionPlayback.stepcount.text = "Full Text";
        }
        else if (versionPlayback == 0)
        {
            versionPlayback = 1;
            UIDis = "minimal";
            panel.menuB.versionPlayback.stepcount.text = "Minimal";
        }
        else if (versionPlayback == 1)
        {
            versionPlayback = 2;
            UIDis = "hide";
            panel.menuB.versionPlayback.stepcount.text = "Hidden";
        } // end else if
    };
    panel.menuB.versionPlayback.stepdown.onPress = function ()
    {
        if (versionPlayback == 1)
        {
            versionPlayback = 0;
            UIDis = "Full";
            panel.menuB.versionPlayback.stepcount.text = "Full Text";
        }
        else if (versionPlayback == 2)
        {
            versionPlayback = 1;
            UIDis = "minimal";
            panel.menuB.versionPlayback.stepcount.text = "Minimal";
        }
        else if (versionPlayback == 0)
        {
            versionPlayback = 2;
            UIDis = "hide";
            panel.menuB.versionPlayback.stepcount.text = "Hidden";
        } // end else if
    };
    panel.menuB.slow20.onPress = function ()
    {
        slowmonumber = 37.500000;
        Lastslownumber = 37.500000;
        BLINK_RATE = 0.214286;
    };
    panel.menuB.slow10.onPress = function ()
    {
        slowmonumber = 75;
        Lastslownumber = 75;
        BLINK_RATE = 0.107143;
    };
    panel.menuB.slow5.onPress = function ()
    {
        slowmonumber = 200;
        Lastslownumber = 200;
        BLINK_RATE = 0.053571;
    };
    panel.menuB.slow2.onPress = function ()
    {
        slowmonumber = 375;
        Lastslownumber = 375;
        BLINK_RATE = 0.010714;
    };
    panel.menuB.slow1.onPress = function ()
    {
        slowmonumber = 750;
        Lastslownumber = 750;
        BLINK_RATE = 0.010714;
    };
    panel.menuB.ZoomOff.onPress = function ()
    {
        zoomstat = "off";
        zoomBuf = 200;
        INVSCALE = 200;
    };
    panel.menuB.zoomcurrent.onPress = function ()
    {
        zoomstat = "current";
    };
    panel.menuB.zoomcustom.onPress = function ()
    {
        zoomstat = "custom";
    };
    panel.menuB.customZoomCount.stepUp.onPress = function ()
    {
        if (CUSTSCALE < 2400 && CUSTSCALE != -50)
        {
            if (zoomstat == "customB")
            {
                CUSTSCALE = Math.round(CUSTSCALE / 100) * 100;
            } // end if
            CUSTSCALE = CUSTSCALE + 50;
            panel.menuB.zoomcustom.selected = true;
            zoomstat = "custom";
        }
        else if (CUSTSCALE == -50)
        {
            if (zoomstat == "customB")
            {
                CUSTSCALE = Math.round(CUSTSCALE / 100) * 100;
            } // end if
            CUSTSCALE = CUSTSCALE + 100;
            panel.menuB.zoomcustom.selected = true;
            zoomstat = "custom";
        } // end else if
        panel.menuB.customZoomCount.stepcount.text = CUSTSCALE;
    };
    panel.menuB.customZoomCount.stepdown.onPress = function ()
    {
        if (CUSTSCALE > -2400 && CUSTSCALE != 50)
        {
            if (zoomstat == "customB")
            {
                CUSTSCALE = Math.round(CUSTSCALE / 100) * 100;
            } // end if
            CUSTSCALE = CUSTSCALE - 50;
            panel.menuB.zoomcustom.selected = true;
            zoomstat = "custom";
        }
        else if (CUSTSCALE == 50)
        {
            if (zoomstat == "customB")
            {
                CUSTSCALE = Math.round(CUSTSCALE / 100) * 100;
            } // end if
            CUSTSCALE = CUSTSCALE - 100;
            panel.menuB.zoomcustom.selected = true;
            zoomstat = "custom";
        } // end else if
        panel.menuB.customZoomCount.stepcount.text = CUSTSCALE;
    };
    panel.menuB.ffmodifier.stepcount.text = ffNumber;
    panel.menuB.rwmodifier.stepcount.text = rwNumber;
    panel.menuB.ffmodifier.stepUp.onPress = function ()
    {
        if (ffNumber < 16)
        {
            ++ffNumber;
        } // end if
        panel.menuB.ffmodifier.stepcount.text = ffNumber;
    };
    panel.menuB.ffmodifier.stepdown.onPress = function ()
    {
        if (ffNumber > 1)
        {
            --ffNumber;
        } // end if
        panel.menuB.ffmodifier.stepcount.text = ffNumber;
    };
    panel.menuB.rwmodifier.stepUp.onPress = function ()
    {
        if (rwNumber < 16)
        {
            ++rwNumber;
        } // end if
        panel.menuB.rwmodifier.stepcount.text = rwNumber;
    };
    panel.menuB.rwmodifier.stepdown.onPress = function ()
    {
        if (rwNumber > 1)
        {
            --rwNumber;
        } // end if
        panel.menuB.rwmodifier.stepcount.text = rwNumber;
    };
    panel.menuB.focusMod.stepcount.text = pointNames[cameraPoint];
    panel.menuB.focusMod.stepdown.onPress = function ()
    {
        if (cameraPoint > 0)
        {
            --cameraPoint;
        }
        else
        {
            cameraPoint = 9;
        } // end else if
        panel.menuB.focusMod.stepcount.text = pointNames[cameraPoint];
    };
    panel.menuB.focusMod.stepUp.onPress = function ()
    {
        if (cameraPoint < 9)
        {
            ++cameraPoint;
        }
        else
        {
            cameraPoint = 0;
        } // end else if
        panel.menuB.focusMod.stepcount.text = pointNames[cameraPoint];
    };
    panel.menuB.camSensMod.stepcount.text = cameraNames[cameraPan];
    panel.menuB.camSensMod.stepdown.onPress = function ()
    {
        if (cameraPan > 0)
        {
            --cameraPan;
        }
        else
        {
            cameraPan = 3;
        } // end else if
        panel.menuB.camSensMod.stepcount.text = cameraNames[cameraPan];
    };
    panel.menuB.camSensMod.stepUp.onPress = function ()
    {
        if (cameraPan < 3)
        {
            ++cameraPan;
        }
        else
        {
            cameraPan = 0;
        } // end else if
        panel.menuB.camSensMod.stepcount.text = cameraNames[cameraPan];
    };
    panel.menuB.minutesB.stepUp.onPress = function ()
    {
        if (autocalltime < 36000000)
        {
            autocalltime = autocalltime + fivemin;
            calltime = autocalltime;
            panel.menuB.minutesB.stepcount.text = autocalltime / 60000;
        } // end if
        updateTimedAutosave();
    };
    panel.menuB.minutesB.stepdown.onPress = function ()
    {
        if (autocalltime > 300000)
        {
            autocalltime = autocalltime - fivemin;
            calltime = autocalltime;
            panel.menuB.minutesB.stepcount.text = autocalltime / 60000;
        } // end if
        updateTimedAutosave();
    };
    panel.menuB.lines.stepUp.onPress = function ()
    {
        if (linecountauto < 10000)
        {
            linecountauto = linecountauto + 100;
        } // end if
        panel.menuB.lines.stepcount.text = linecountauto;
    };
    panel.menuB.lines.stepdown.onPress = function ()
    {
        if (linecountauto > 100)
        {
            linecountauto = linecountauto - 100;
        } // end if
        panel.menuB.lines.stepcount.text = linecountauto;
    };
    panel.menuB.lockFlag.onPress = function ()
    {
        if (flaglock == false)
        {
            flaglock = true;
        }
        else if (flaglock != false)
        {
            flaglock = false;
        } // end else if
    };
    panel.menuB.flagGhost.onPress = function ()
    {
        if (ghost == false)
        {
            ghost = true;
        }
        else if (ghost != false)
        {
            ghost = false;
        } // end else if
    };
    panel.menuB.lockscroll.onPress = function ()
    {
        if (scrollzoom == false)
        {
            scrollzoom = true;
        }
        else if (scrollzoom != false)
        {
            scrollzoom = false;
        } // end else if
    };
    panel.menuB.Contact.onPress = function ()
    {
        if (contactpoints == false)
        {
            contactpoints = true;
        }
        else if (contactpoints != false)
        {
            contactpoints = false;
        } // end else if
    };
    panel.menuB.xy45Box.onPress = function ()
    {
        if (xysnap_toggled == false)
        {
            xysnap_toggled = true;
        }
        else if (xysnap_toggled != false)
        {
            xysnap_toggled = false;
        } // end else if
    };
    panel.menuB.lineSnapBox.onPress = function ()
    {
        if (snapping == false)
        {
            snapping = true;
        }
        else if (snapping != false)
        {
            snapping = false;
        } // end else if
    };
    panel.menuB.trackSettings.onPress = function ()
    {
        if (settings == false)
        {
            settings = true;
        }
        else if (contactpoints != false)
        {
            settings = false;
        } // end else if
    };
    panel.menuB.trackFlag.onPress = function ()
    {
        if (flagSaving == false)
        {
            flagSaving = true;
        }
        else if (flagSaving != false)
        {
            flagSaving = false;
        } // end else if
    };
    panel.menuB.trackSes.onPress = function ()
    {
        if (trackSes == false)
        {
            trackSes = true;
        }
        else if (trackSes != false)
        {
            trackSes = false;
        } // end else if
    };
    panel.menuB.timed.onPress = function ()
    {
        if (timedauto == false)
        {
            timedauto = true;
            panel.menuB.minutesB.stepUp._visible = panel.menuB.minutesB.stepdown._visible = true;
            updateTimedAutosave();
        }
        else if (timedauto != false)
        {
            timedauto = false;
            panel.menuB.minutesB.stepUp._visible = panel.menuB.minutesB.stepdown._visible = false;
        } // end else if
    };
    panel.menuB.lineCount.onPress = function ()
    {
        if (lineauto == true)
        {
            lineauto = false;
            panel.menuB.lines.stepUp._visible = panel.menuB.lines.stepdown._visible = false;
        }
        else if (lineauto == false)
        {
            lineauto = true;
            panel.menuB.lines.stepUp._visible = panel.menuB.lines.stepdown._visible = true;
        } // end else if
    };
    panel.menuB.debugCheck.onPress = function ()
    {
        if (hitTestBool == false)
        {
            hitTestBool = true;
        }
        else if (hitTestBool == true)
        {
            hitTestBool = false;
        } // end else if
    };
    panel.menuB.liveDraw.onPress = function ()
    {
        if (liveDraw == false)
        {
            liveDraw = true;
        }
        else if (liveDraw == true)
        {
            liveDraw = false;
        } // end else if
    };
    panel.menuB.zeroStart.onPress = function ()
    {
        if (zeroStartBool == false)
        {
            zeroStartBool = true;
            vOffSet = 0;
        }
        else if (zeroStartBool == true)
        {
            zeroStartBool = false;
            vOffSet = 0.800000;
        } // end else if
    };
    panel.menuB.tailFakieSelect.onPress = function ()
    {
        if (dualFakie == false)
        {
            dualFakie = true;
        }
        else if (dualFakie == true)
        {
            dualFakie = false;
        } // end else if
    };
    panel.menuB.defaultCookies.onPress = function ()
    {
        applyDefaults();
    };
    panel.menuB.foolsCheck.onPress = function ()
    {
        globalFoolBool = foolsCheck.selected;
    };
} // End of the function
function cookiesSave()
{
    var _loc1 = [settings, autocalltime, linecountauto, timedauto, flagSaving, trackSes, flaglock, ghost, contactpoints, buildVersion, lineauto, UIDis, waterMark, snapping];
    userData.data.profile = _loc1;
    userData.flush();
} // End of the function
function applyDefaults()
{
    panel.menuB.closeB.onPress();
    userData.data.profile = [];
    panel.menuB.slow20.onPress();
    ffNumber = 4;
    colorplay = false;
    userData.flush();
    cookiesLoadAndApply();
    cookiesSave();
    panel.settingsB.onPress();
} // End of the function
function cookiesLoadAndApply(trackData, trackDetails)
{
    var _loc1 = userData.data.profile;
    var _loc2 = trackData[2];
    var _loc5 = trackData;
    autocalltime = Math.round(_loc1[1]);
    linecountauto = _loc1[2];
    displayMessage("Update " + buildVersion, 2500);
    if (_loc1[0] == true)
    {
        panel.menuB.trackSettings.selected = true;
        settings = true;
    }
    else if (_loc1[0] == false)
    {
        panel.menuB.trackSettings.selected = false;
        settings = false;
    } // end else if
    if (_loc1[3] == true)
    {
        timedauto = true;
        panel.menuB.timed.selected = true;
        panel.menuB.minutesB.stepUp._visible = panel.menuB.minutesB.stepdown._visible = true;
    }
    else if (_loc1[3] == false)
    {
        timedauto = false;
        panel.menuB.timed.selected = false;
        panel.menuB.minutesB.stepUp._visible = panel.menuB.minutesB.stepdown._visible = false;
    } // end else if
    if (_loc1[4] == true)
    {
        panel.menuB.trackFlag.selected = true;
        flagSaving = true;
    }
    else if (_loc1[4] == false)
    {
        panel.menuB.trackFlag.selected = false;
        flagSaving = false;
    } // end else if
    if (_loc1[5] == true)
    {
        panel.menuB.trackSes.selected = true;
        trackSes = true;
    }
    else if (_loc1[5] == false)
    {
        panel.menuB.trackSes.selected = false;
        trackSes = false;
    } // end else if
    if (_loc1[6] == true)
    {
        panel.menuB.lockFlag.selected = true;
        flaglock = true;
    }
    else if (_loc1[6] == false)
    {
        panel.menuB.lockFlag.selected = false;
        flaglock = false;
    }
    else if (_loc1[6] == undefined)
    {
        panel.menuB.lockFlag.selected = false;
        flaglock = false;
    } // end else if
    if (_loc1[7] == true)
    {
        panel.menuB.flagGhost.selected = true;
        ghost = true;
    }
    else if (_loc1[7] == false)
    {
        panel.menuB.flagGhost.selected = false;
        ghost = false;
    } // end else if
    if (_loc1[8] == true)
    {
        panel.menuB.Contact.selected = true;
        contactpoints = true;
    }
    else if (_loc1[8] == false)
    {
        panel.menuB.Contact.selected = false;
        contactpoints = false;
    } // end else if
    if (_loc1[9] == true)
    {
        panel.menuB.minutesB.stepUp._visible = panel.menuB.minutesB.stepdown._visible = true;
        panel.menuB.timed.selected = true;
        if (_loc1[1] == undefined)
        {
            autocalltime = 300000;
        }
        else
        {
            autocalltime = _loc1[1];
        } // end else if
        updateTimedAutosave();
    }
    else if (_loc1[9] == false)
    {
        panel.menuB.minutesB.stepUp._visible = panel.menuB.minutesB.stepdown._visible = false;
        panel.menuB.timed.selected = false;
        if (_loc1[1] == undefined)
        {
            autocalltime = 300000;
        }
        else
        {
            autocalltime = _loc1[1];
        } // end else if
    }
    else if (_loc1[9] == undefined)
    {
        panel.menuB.minutesB.stepUp._visible = panel.menuB.minutesB.stepdown._visible = true;
        panel.menuB.timed.selected = true;
        autocalltime = _loc1[1];
        if (_loc1[1] == undefined)
        {
            autocalltime = 300000;
        } // end else if
    } // end else if
    if (_loc1[10] == true)
    {
        panel.menuB.lines.stepUp._visible = panel.menuB.lines.stepdown._visible = true;
        panel.menuB.lineCount.selected = true;
        lineauto = true;
        linecountauto = _loc1[2];
        if (_loc1[2] == undefined)
        {
            linecountauto = 500;
        } // end if
    }
    else if (_loc1[10] == false)
    {
        panel.menuB.lines.stepUp._visible = panel.menuB.lines.stepdown._visible = false;
        panel.menuB.lineCount.selected = false;
        lineauto = false;
        linecountauto = _loc1[2];
        if (_loc1[2] == undefined)
        {
            linecountauto = 500;
        } // end if
    }
    else if (_loc1[10] == undefined)
    {
        panel.menuB.lines.stepUp._visible = panel.menuB.lines.stepdown._visible = true;
        panel.menuB.linecount.selected = true;
        linecountauto = _loc1[2];
        if (_loc1[2] == undefined)
        {
            linecountauto = 500;
        } // end else if
    } // end else if
    if (_loc1[12] == String || _loc1[12] != undefined)
    {
        panel.menuB.statusTextLock.text = _loc1[12];
        waterMark = _loc1[12];
    }
    else
    {
        panel.menuB.statusTextLock.text = "40 fps";
        waterMark = "40 fps";
    } // end else if
    if (_loc1[13] == true)
    {
        panel.menuB.lineSnapBox.selected = true;
        snapping = true;
    }
    else if (_loc1[13] == true || _loc1[13] == undefined)
    {
        panel.menuB.lineSnapBox.selected = false;
        snapping = false;
    } // end else if
    if (_loc2[5] != undefined)
    {
        zeroStartBool = _loc2[5];
    }
    else
    {
        zeroStartBool = false;
    } // end else if
    if (_loc2[6] != undefined)
    {
        dualFakie = _loc2[6];
    }
    else
    {
        dualFakie = false;
    } // end else if
    if (_loc2[7] != undefined)
    {
        cameraPoint = _loc2[7];
    } // end if
    if (_loc2[8] != undefined)
    {
        cameraPan = _loc2[8];
    } // end if
    if (dualFakie)
    {
        panel.menuB.tailFakieSelect.selected = true;
    }
    else
    {
        panel.menuB.tailFakieSelect.selected = false;
    } // end else if
    if (zeroStartBool)
    {
        panel.menuB.zeroStart.selected = true;
        vOffSet = 0;
    }
    else
    {
        panel.menuB.zeroStart.selected = false;
        vOffSet = 0.800000;
    } // end else if
    if (trackDetails)
    {
        if (_loc1[0] == true)
        {
            if (_loc1[5] == true)
            {
                tla._xscale = tla._yscale = _loc5[1][2];
                bufScale = tla._xscale;
                tla._x = _loc5[1][0];
                tla._y = _loc5[1][1];
                canvasX = tla._x;
                canvasY = tla._y;
            } // end if
            var _loc3 = _loc2[0];
            var _loc4 = _loc2[1];
            var _loc6 = _loc2[2];
            if (_loc6 == false)
            {
                colorplay = false;
                panel.menuB.colorPlay.selected = false;
            }
            else if (_loc6 == true)
            {
                colorplay = true;
                panel.menuB.colorPlay.selected = true;
            }
            else if (_loc6 == undefined)
            {
                colorplay = false;
                panel.menuB.colorPlay.selected = false;
            } // end else if
            if (_loc4 == "off")
            {
                panel.menuB.ZoomOff.onPress();
                panel.menuB.ZoomOff.selected = true;
                zoomstat = "off";
            }
            else if (_loc4 == "current")
            {
                panel.menuB.zoomcurrent.onPress();
                panel.menuB.zoomcurrent.selected = true;
                panel.menuB.ZoomOff.selected = false;
                zoomstat = "current";
            }
            else if (_loc4 == "custom" || _loc4 == "customB")
            {
                panel.menuB.zoomcustom.onPress();
                panel.menuB.zoomcustom.selected = true;
                panel.menuB.ZoomOff.selected = false;
                zoomstat = "custom";
                CUSTSCALE = _loc2[3];
                if (_loc2[3] == undefined)
                {
                    CUSTSACLE = 200;
                } // end if
            }
            else if (_loc4 == undefined)
            {
                panel.menuB.ZoomOff.onPress();
                panel.menuB.ZoomOff.selected = true;
            } // end else if
            if (_loc3 == 37.500000)
            {
                panel.menuB.slow20.onPress();
                panel.menuB.slow20.selected = true;
            }
            else if (_loc3 == 75)
            {
                panel.menuB.slow10.onPress();
                panel.menuB.slow10.selected = true;
            }
            else if (_loc3 == 200)
            {
                panel.menuB.slow5.onPress();
                panel.menuB.slow5.selected = true;
            }
            else if (_loc3 == 375)
            {
                panel.menuB.slow2.onPress();
                panel.menuB.slow2.selected = true;
            }
            else if (_loc3 == 750)
            {
                panel.menuB.slow1.onPress();
                panel.menuB.slow1.selected = true;
            }
            else if (_loc3 == undefined)
            {
                panel.menuB.slow5.onPress();
                panel.menuB.slow5.selected = true;
            } // end else if
        } // end else if
    } // end else if
} // End of the function
function dragStartPoint()
{
    if (Mode != "save")
    {
        if (Key.isDown(16))
        {
            var _loc1 = getFirstLine();
            if (_loc1 != undefined)
            {
                tla.startPoint._x = _loc1.x1;
                tla.startPoint._y = _loc1.y1 - 50 * Math.sqrt(SCALEDOWN * SCALEDOWN);
                pointToStartPoint();
            } // end if
        }
        else if (Key.isDown(68))
        {
            tla.startPoint.enabled = true;
            startDrag (tla.startPoint, false);
            active2 = false;
            cursor._visible = false;
            onMouseMove = function ()
            {
                tla.startPoint.startDrag(false);
            };
            tla.startPoint.onRelease = function ()
            {
                stopDrag ();
                panel[lastTool + "B"].onPress();
                tla.startPoint.stopDrag(false);
                pointToStartPoint();
                tla.startPoint.onMouseMove = function ()
                {
                };
            };
        } // end if
    } // end else if
} // End of the function
function updateTimedAutosave()
{
    setInterval(function ()
    {
        if (timedauto == true && simulation == false)
        {
            autosaving = true;
            safeToSave = true;
            if (simulation != true)
            {
                var _loc1 = getDateAndTime();
                displayMessage("Saving track!", 1500);
                messageDis = false;
                var _loc2 = setInterval(function ()
                {
                    if (safeToSave == true)
                    {
                        saveFunction("Autosave " + _loc1, true);
                        messageDis = true;
                        safeToSave = false;
                        this.clearInterval(_loc2);
                    } // end if
                }, 1500);
            } // end if
        } // end if
    }, autocalltime);
} // End of the function
function getDateAndTime()
{
    var _loc1 = date_save.getDate() + "/" + (date_save.getMonth() + 1) + "/" + date_save.getFullYear() + " ~" + date_save.getHours() + ":00";
    return (_loc1);
} // End of the function
function displayMessage(msg, len)
{
    if (messageDis != false)
    {
        if (versionPlayback == 0 && simulation == true)
        {
            statusB.text = msg;
        }
        else if (simulation == false)
        {
            statusB.text = msg;
        } // end else if
        var iteration = 0;
        var total = len / 15;
        tla.onEnterFrame = function ()
        {
            if (statusB.text != "")
            {
                ++iteration;
                if (iteration >= total)
                {
                    statusB.text = "";
                    jumpZoomBool = false;
                } // end if
            } // end if
        };
    } // end if
} // End of the function
function launchDemoBox()
{
    var demoMinute = 0;
    var demoSecond = 0;
    var demoFrame = 0;
    panel.demoBox.gotoAndStop(1);
    cursorImage("normal");
    panel.menuB._visible = false;
    panel.demoBox._visible = true;
    panel.demoBox.cancelDemo.onPress = function ()
    {
        panel.settingsB.onPress();
    };
    panel.demoBox.demoMin.stepcount.text = 0;
    panel.demoBox.demoSec.stepcount.text = 0;
    panel.demoBox.demoFr.stepcount.text = 0;
    panel.demoBox.demoMin.stepUp.onPress = function ()
    {
        ++demoMinute;
        panel.demoBox.demoMin.stepcount.text = demoMinute;
    };
    panel.demoBox.demoMin.stepdown.onPress = function ()
    {
        if (demoMinute > 0)
        {
            --demoMinute;
        } // end if
        panel.demoBox.demoMin.stepcount.text = demoMinute;
    };
    panel.demoBox.demoSec.stepUp.onPress = function ()
    {
        if (demoSecond < 59)
        {
            ++demoSecond;
        } // end if
        panel.demoBox.demoSec.stepcount.text = demoSecond;
    };
    panel.demoBox.demoSec.stepdown.onPress = function ()
    {
        if (demoSecond > 0)
        {
            --demoSecond;
        } // end if
        panel.demoBox.demoSec.stepcount.text = demoSecond;
    };
    panel.demoBox.demoFr.stepUp.onPress = function ()
    {
        if (demoFrame < 39)
        {
            ++demoFrame;
        } // end if
        panel.demoBox.demoFr.stepcount.text = demoFrame;
    };
    panel.demoBox.demoFr.stepdown.onPress = function ()
    {
        if (demoFrame > 0)
        {
            --demoFrame;
        } // end if
        panel.demoBox.demoFr.stepcount.text = demoFrame;
    };
    panel.demoBox.recordDemo.onPress = function ()
    {
        var _loc3 = demoMinute * 60 * 40;
        var _loc2 = demoSecond * 40;
        var _loc1 = demoFrame + _loc2 + _loc3;
        createDemo(_loc1);
    };
} // End of the function
function createDemo(frames)
{
    var savedDemo = SharedObject.getLocal("LRDemo", "/");
    panel.demoBox.gotoAndStop(2);
    var _loc1 = frames;
    var _loc2 = 0;
    var _loc4 = time(frames);
    massPointCache = [];
    massPointScarfCache = [];
    resetPosition();
    BindStick.crash = false;
    world.sled.gotoAndStop(1);
    moveToStartPos();
    tla.onEnterFrame = function ()
    {
        if (_loc2 < _loc1)
        {
            for (var _loc2 = 0; _loc2 < 40; ++_loc2)
            {
                if (_loc2 < _loc1)
                {
                    verlet(riderAnchors);
                    scarfAnchors[1].x = scarfAnchors[1].x + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dx, 125);
                    scarfAnchors[1].y = scarfAnchors[1].y + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dy, 125);
                    verlet(scarfAnchors);
                    satisfyConstraints();
                    ++_loc2;
                    storeFrame(_loc2 - 1);
                    render();
                    panel.demoBox.demoProgress.text = Math.round(_loc2 / _loc1 * 100) + "% complete; " + _loc2 + "/" + _loc1 + " frames recorded.";
                    continue;
                } // end if
                panel.demoBox.demoProgress.text = "Finalizing demo";
            } // end of for
        }
        else
        {
            delete this.onEnterFrame;
            savedDemo.clear();
            savedDemo.data.recorded_rider_frames = massPointCache;
            savedDemo.data.recorded_scarf_frames = massPointScarfCache;
            savedDemo.flush();
            panel.settingsB.onPress();
        } // end else if
    };
} // End of the function
var buildVersion = "3.4.25 \n 19/APR/2015";
var buildVersionDisplayMenu = "Update 3.4.25 19/APR/2015";
var savedTracks = SharedObject.getLocal("savedLines", "/");
var sPoint = new startPoint(0, 0);
var massCollisionCache = [];
var preShift = false;
var dualFakie = false;
var tailFakie = false;
var noseFakie = false;
var cameraPoint = 4;
var cameraPan = 0;
var locked40 = false;
var gameFPS;
var frameTimes = [];
var tFrameCount = 0;
world.onEnterFrame = function ()
{
    ++tFrameCount;
    if (frameTimes.length < 10)
    {
        frameTimes.push(getTimer());
    }
    else
    {
        frameTimes.shift();
        frameTimes.push(getTimer());
    } // end else if
    var _loc1 = frameTimes[frameTimes.length - 1] - frameTimes[0];
    var _loc2 = _loc1 / (frameTimes.length - 1);
    if (tFrameCount % 10 == 0)
    {
        gameFPS = int(1000 / _loc2);
    } // end if
};
var vOffSet = 0.800000;
var liveHitTest = false;
var massPointCache = [];
var massPointScarfCache = [];
var versionPlayback = 0;
var ffNumber = 4;
var rwNumber = 1;
var pointNames = ["2nd peg", "Tail", "Nose", "String", "Butt", "Shoulder", "Hand 1", "Hand 2", "Foot 1", "Foot 2"];
var cameraNames = ["Default", "Center", "Wide", "Fixed"];
var randomCollisionCheck = [];
var contactpoints = false;
var hitTestBool = false;
var advancedMode = true;
var edges;
var edges2;
var riderAnchors;
var scarfAnchors;
var ITERATE = 6;
var SCALEDOWN = 0.500000;
var INVSCALE = 200;
var CUSTSCALE = 200;
var ENDURANCE = 0.057000;
var BLINK_RATE = 0.428571;
var AIR_FRICTION = 0.900000;
var stickyShiftBool = true;
var slowstat = 0;
var drawing = false;
var SNAP_DISTANCE = 20;
var ERASER_SIZE = 5;
var MAX_LENGTH = 2000;
var MIN_LENGTH = 14;
var GRIDSIZE = 14;
var TO_DEG = 57.295780;
var simulation = false;
var frameCounter = 0;
var canvasX = 0;
var canvasY = 0;
var bufScale = 100;
var a = {x: 0, y: 0.350000 * Math.sqrt(SCALEDOWN * SCALEDOWN)};
var colided;
var active = true;
var active2 = true;
var point1 = new Object();
var tmpPoint = new Object();
var dataStorage = new Object();
var startLine;
var saved = false;
var saveNow = false;
var riding;
var sledState;
var faceState;
var Lines = 0;
var totLines = 0;
var lines = new Object();
var redoList = [];
var pencilMode = 0;
var lastTool;
var tempZoom;
var ttZoom;
var undoList = [];
var pre = 0;
var bur = 0;
var slowMotion = false;
var segmentsRemainingToLoad;
var tempLine = new Object();
var checks = [];
var prevLine;
var snaped;
var tempLines;
var loadPerFrame = 15;
var VERSION = "6.2";
var compatible = VERSION;
var currTrackName;
var newLines = 0;
var redLines = 0;
var blueLines = 0;
var greenLines = 0;
var frames = 0;
var colorEraser = false;
var xysnap_toggled = false;
var activeManipLine;
var flaglock = false;
var zoomstat = "off";
var autosave = true;
var autosaving = false;
var Autoslow = false;
var scrollzoom = true;
var erasesticky = false;
var colorplay = false;
var zoomplay = false;
var slowmonumber = 200;
var Lastslownumber = 200;
var stattextvis = false;
var panelvis = false;
var slowstat = false;
var topSpeed = 0;
var scrollslow = slowmonumber;
var ghost = false;
var savetype = "manual";
var pointnum = 0;
var timer = 5;
var framescount = true;
var savedelay = false;
var autocalltime = 300000;
var linecountauto = 500;
var timeflag = 0;
var flaggedstat = [0, 0];
var nogreenload = false;
var loadtype = false;
var date_save = new Date();
var today = new Date();
var calltime = 300000;
var linecountauto = 500;
var autolines = false;
var autotime = true;
var timedauto = true;
var lineauto = false;
var setlines = 500;
var linecount = 0;
var fivemin = 300000;
var trackSes = false;
var settings = true;
var flagSaving = true;
var UIDis = "Full";
var snapping = true;
var preview = false;
var liveDraw = false;
var zeroStartBool = false;
statusText.text = "0 Lines";
statusText_blue.text = "0 Floor";
statusText_red.text = "0 Accel";
statusText_green.text = "0 Scene";
statusB.text = "";
var solName = "savedLines";
var lastSwatch;
panel.saveB.onPress = function ()
{
    var savedTracks = SharedObject.getLocal(solName, "/");
    jumpZoomBool = false;
    if (Key.isDown(16) && simulation == false)
    {
        if (Lines != 0)
        {
            var _loc4 = getDateAndTime();
            saveFunction("Quick save " + _loc4, false, ver);
            displayMessage("Quick Save! \n rev " + ver, 1500);
        } // end if
    }
    else
    {
        panel.fileDialog.savedTracks.dataProvider = savedTracks.data.trackList;
        tla.startPoint._visible = false;
        panel.menuB._visible = false;
        panel.stopB.onPress();
        cursorImage("normal");
        active = false;
        active2 = false;
        panel.fileDialog._visible = true;
        enableFileButtons();
        panelMode("save");
        var Tname = removeSpaces(panel.fileDialog.name.text);
        var ver = compatible;
        panel.menuB.dummyBox.setFocus();
        if (panel.fileDialog.name.text == "" || panel.fileDialog.name.text == "there is nothing to save :)")
        {
            _loc4 = getDateAndTime();
            panel.fileDialog.name.text = "Untitled " + _loc4;
        } // end if
        panel.fileDialog.saveButton.onRelease = function ()
        {
            var _loc1 = false;
            for (var _loc2 in savedTracks.data.trackList)
            {
                if (panel.fileDialog.name.text == savedTracks.data.trackList[_loc2].label)
                {
                    _loc1 = true;
                } // end if
            } // end of for...in
            if (Lines != 0 && _loc1 == true)
            {
                panel.fileDialog.name.enabled = panel.fileDialog.settingsB.enabled = panel.fileDialog.close.enabled = panel.fileDialog.saveButton.enabled = panel.fileDialog.savedTracks.enabled = panel.fileDialog.loadButton.enabled = panel.fileDialog.deleteButton.enabled = panel.fileDialog.nosceneryload.enabled = false;
                panel.confirmDialog._visible = true;
                var _loc1 = ver;
                if (_loc1 == "6.2")
                {
                    var _loc3 = "6.2 and newer.";
                }
                else
                {
                    _loc3 = _loc1;
                } // end else if
                panel.confirmDialog.text.text = "Are you sure you want to save the track? \n Save format Revision " + _loc3;
                enableConfirmButtons("load");
                panel.confirmDialog.Yes.onRelease = function ()
                {
                    if (panel.fileDialog.name.text == "")
                    {
                        Tname = "Untitled " + date_track_today;
                    }
                    else
                    {
                        var Tname = removeSpaces(panel.fileDialog.name.text);
                    } // end else if
                    saveFunction(Tname, false, _loc1);
                    panel.confirmDialog._visible = false;
                    disableConfirmButtons();
                    panel.fileDialog.name.enabled = panel.fileDialog.settingsB.enabled = panel.fileDialog.close.enabled = panel.fileDialog.saveButton.enabled = panel.fileDialog.savedTracks.enabled = panel.fileDialog.loadButton.enabled = panel.fileDialog.deleteButton.enabled = panel.fileDialog.nosceneryload.enabled = true;
                };
                panel.confirmDialog.No.onRelease = function ()
                {
                    panel.confirmDialog._visible = false;
                    panel.fileDialog._visible = true;
                    disableConfirmButtons();
                    panel.fileDialog.name.enabled = panel.fileDialog.settingsB.enabled = panel.fileDialog.close.enabled = panel.fileDialog.saveButton.enabled = panel.fileDialog.savedTracks.enabled = panel.fileDialog.loadButton.enabled = panel.fileDialog.deleteButton.enabled = panel.fileDialog.nosceneryload.enabled = true;
                };
                panel.confirmDialog.force.onPress = function ()
                {
                    if (_loc1 == "6.2")
                    {
                        _loc1 = "6.1";
                    }
                    else if (_loc1 == "6.1")
                    {
                        _loc1 = "6";
                    }
                    else if (_loc1 == "6")
                    {
                        _loc1 = "6.2";
                    } // end else if
                    if (_loc1 == "6.2")
                    {
                        var _loc1 = "6.2 and newer.";
                    }
                    else
                    {
                        _loc1 = _loc1;
                    } // end else if
                    panel.confirmDialog.text.text = "Are you sure you want to save the track? \n Save format Revision " + _loc1;
                };
            }
            else if (Lines != 0 && _loc1 == false)
            {
                if (panel.fileDialog.name.text == "")
                {
                    Tname = "Untitled " + date_track_today;
                }
                else
                {
                    var Tname = removeSpaces(panel.fileDialog.name.text);
                } // end else if
                saveFunction(Tname, false, _loc1);
            }
            else
            {
                panel.fileDialog.name.text = "there is nothing to save :)";
            } // end else if
        };
        panel.fileDialog.loadButton.onRelease = function ()
        {
            if (Lines == 0)
            {
                var _loc1 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].version;
                loadFunction(_loc1);
            }
            else
            {
                var _loc1 = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].version;
                panel.confirmDialog._visible = true;
                if (_loc1 == "6.2")
                {
                    var _loc1 = "6.2 and newer.";
                }
                else
                {
                    _loc1 = _loc1;
                } // end else if
                panel.confirmDialog.text.text = "Are you sure you want to load the track? \n Load format Revision " + _loc1;
                enableConfirmButtons("load");
                panel.fileDialog._visible = false;
                panel.confirmDialog.Yes.onRelease = function ()
                {
                    loadFunction(_loc1);
                    panel.confirmDialog._visible = false;
                    panel.fileDialog._visible = false;
                    disableConfirmButtons();
                };
                panel.confirmDialog.No.onRelease = function ()
                {
                    panel.confirmDialog._visible = false;
                    panel.fileDialog._visible = true;
                    disableConfirmButtons();
                };
                panel.confirmDialog.force.onPress = function ()
                {
                    if (_loc1 == "6.2")
                    {
                        _loc1 = "6.1";
                    }
                    else if (_loc1 == "6.1")
                    {
                        _loc1 = "6";
                    }
                    else if (_loc1 == "6")
                    {
                        _loc1 = "6.2";
                    } // end else if
                    if (_loc1 == "6.2")
                    {
                        var _loc1 = "6.2 and newer.";
                    }
                    else
                    {
                        _loc1 = _loc1;
                    } // end else if
                    panel.confirmDialog.text.text = "Are you sure you want to load the track? \n Load format Revision " + _loc1;
                };
            } // end else if
        };
        panel.fileDialog.deleteButton.onRelease = function ()
        {
            if (!Key.isDown(16))
            {
                panel.confirmDialog._visible = true;
                panel.confirmDialog.text.text = "Are you sure you want to delete the track?";
                enableConfirmButtons("null");
                panel.fileDialog._visible = false;
                panel.confirmDialog.Yes.onRelease = function ()
                {
                    var _loc1 = panel.fileDialog.savedTracks.selectedIndex;
                    savedTracks.data.trackList.removeItemAt(_loc1);
                    panel.fileDialog.savedTracks.selectedIndex = Math.min(_loc1, panel.fileDialog.savedTracks.length - 1);
                    disableConfirmButtons();
                    panel.fileDialog._visible = true;
                    panel.confirmDialog._visible = false;
                };
                panel.confirmDialog.No.onRelease = function ()
                {
                    panel.confirmDialog._visible = false;
                    disableConfirmButtons();
                    panel.fileDialog._visible = true;
                };
            }
            else
            {
                var _loc1 = panel.fileDialog.savedTracks.selectedIndex;
                savedTracks.data.trackList.removeItemAt(_loc1);
                panel.fileDialog.savedTracks.selectedIndex = Math.min(_loc1, panel.fileDialog.savedTracks.length - 1);
            } // end else if
        };
        panel.fileDialog.close.onPress = function ()
        {
            active = true;
            panel[lastTool + "B"].onPress();
            cursorImage(cursorMode);
            panel.fileDialog._visible = false;
            panel.menuB._visible = false;
            panelMode("draw");
            disableFileButtons();
            panel.menuB.dummyBox.setFocus();
            cookiesSave();
        };
    } // end else if
};
var savedPointsCache = [];
var zoomBuf = 200;
var dots = false;
panel.onEnterFrame = function ()
{
    if (_root.preload == true)
    {
        panel.saveB.onPress();
        _root.preload = false;
        panel.menuB._visible = false;
        cookiesLoadAndApply();
    } // end if
};
var Mode = "draw";
panelMode = function (Mode)
{
    if (Mode == "draw")
    {
        panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.settingsB.enabled = panel.flagB.enabled = tla.startPoint.enabled = true;
        panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = panel.settingsB._alpha = panel.dragB._alpha = 100;
        panel.flagB.gotoAndStop(2);
        active2 = true;
        compas._visible = true;
        tla.startPoint._visible = true;
    }
    else if (Mode == "simulate")
    {
        panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.settingsB.enabled = panel.dragB.enabled = false;
        panel.saveB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = true;
        panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.settingsB._alpha = panel.dragB._alpha = 30;
        panel.saveB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 100;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
        compas._visible = false;
        tla.startPoint._visible = false;
        panel.playbackcon._visible = true;
    }
    else if (Mode == "save")
    {
        panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = panel.settingsB.enabled = tla.startPoint.enabled = false;
        panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = panel.settingsB._alpha = 30;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
        panel.handTools._visible = false;
        panel.playbackcon._visible = false;
    } // end else if
};
panel.lineB.onRollOver = panel.swatches.green.onRollOver = panel.swatches.red.onRollOver = panel.swatches.blue.onRollOver = panel.zoomB.onRollOver = panel.eraserB.onRollOver = panel.flagB.onRollOver = panel.handB.onRollOver = panel.pencilB.onRollOver = panel.playB.onRollOver = panel.stopB.onRollOver = panel.saveB.onRollOver = panel.trashB.onRollOver = panel.settingsB.onRollOver = function ()
{
    active2 = false;
    cursor._visible = false;
    Mouse.show();
};
panel.lineB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.settingsB.onRollOut = commandconsole.inputB.onRollOut = panel.lineB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = panel.settingsB.onReleaseOutside = panel.dragB.onReleaseOutside = paenl.menuB.onReleaseOutside = function ()
{
    active2 = true;
    cursorImage(cursorMode);
};
tla.startPoint.onRelease = function ()
{
    stopDrag ();
    panel[lastTool + "B"].onPress();
    tla.startPoint.gotoAndStop(1);
    tla.startPoint.onMouseMove = function ()
    {
    };
};
if (Key.isDown(68) && simulation == false)
{
    cursorMode = "normal";
}
else
{
    panel[lastTool + "B"].onPress();
} // end else if
tla.startPoint.onRollOver = function ()
{
    if (Key.isDown(68))
    {
        cursorMode = "normal";
        active2 = false;
        cursor._visible = false;
        Mouse.show();
        tla.startPoint.onPress = function ()
        {
            dragStartPoint();
        };
    } // end if
};
tla.startPoint.onRollOut = function ()
{
    if (!Key.isDown(1))
    {
        tla.startPoint.help._visible = false;
        active2 = true;
        cursorImage(cursorMode);
        cursor._visible = true;
        Mouse.hide();
    } // end if
};
panel.handB.onPress = function ()
{
    if (lastTool == "eraser")
    {
        panel.pencilB.onPress();
        panel.handB.onPress();
    } // end if
    cursorMode = "hand";
    if (handMode == 1)
    {
        drawPencil();
    }
    else
    {
        lineEditPoint();
    } // end else if
    tla._x = canvasX;
    tla._y = canvasY;
    panel.swatches._visible = false;
    panel.handTools._visible = false;
    lastTool = "hand";
    jumpZoomBool = false;
};
panel.swatches.blue.onPress = function ()
{
    pencilMode = 0;
    cursor.pencil.gotoAndStop(1);
    cursor.crosshair.gotoAndStop(1);
    panel.swatches.selected._x = 15;
    panel.swatches.selected._visible = true;
    jumpZoomBool = false;
    if (lastTool == "eraser")
    {
        lastSwatch = 0;
        colorEraser = true;
    } // end if
};
panel.swatches.red.onPress = function ()
{
    pencilMode = 1;
    cursor.pencil.gotoAndStop(2);
    cursor.crosshair.gotoAndStop(2);
    panel.swatches.selected._x = 45;
    panel.swatches.selected._visible = true;
    jumpZoomBool = false;
    if (lastTool == "eraser")
    {
        lastSwatch = 1;
        colorEraser = true;
    } // end if
};
panel.swatches.green.onPress = function ()
{
    pencilMode = 2;
    cursor.pencil.gotoAndStop(3);
    cursor.crosshair.gotoAndStop(3);
    panel.swatches.selected._x = 75;
    panel.swatches.selected._visible = true;
    jumpZoomBool = false;
    if (lastTool == "eraser")
    {
        lastSwatch = 2;
        colorEraser = true;
    } // end if
};
panel.handTools.dragB.onPress = function ()
{
    handMode = 1;
    panel.handB.onPress();
};
panel.handTools.pointB.onPress = function ()
{
    handMode = 2;
    panel.handB.onPress();
};
panel.pencilB.onPress = function ()
{
    cursorMode = "pencil";
    jumpZoomBool = false;
    drawPencil();
    panel.swatches._visible = true;
    panel.swatches.selected._visible = true;
    panel.handTools._visible = false;
    lastTool = "pencil";
};
panel.lineB.onPress = function ()
{
    cursorMode = "line";
    cursor.crosshair.gotoAndStop(pencilMode + 1);
    if (!Key.isDown(68))
    {
        drawLine();
    } // end if
    panel.swatches._visible = true;
    panel.swatches.selected._visible = true;
    panel.handTools._visible = false;
    lastTool = "line";
    jumpZoomBool = false;
};
panel.trashB.onPress = function ()
{
    cursorImage("normal");
    switchToVersion(VERSION);
    panelMode("save");
    panel.confirmDialog._visible = true;
    panel.confirmDialog.text.text = "Are you sure you want to delete the track? \n All unsaved progress will be lost.";
    enableConfirmButtons("save");
    jumpZoomBool = false;
    panel.confirmDialog.Yes.onRelease = function ()
    {
        frames = 0;
        flaggedStat[0] = 0;
        linetracker = 0;
        var _loc1 = getDateAndTime();
        panel.fileDialog.name.text = "Untitled " + _loc1;
        disableConfirmButtons();
        saved = false;
        tla.dummy._visible = false;
        tla.flag._visible = false;
        statusText.text = "0 Lines";
        statusText_blue.text = "0 Floor";
        statusText_red.text = "0 Accel";
        statusText_green.text = "0 Scene";
        displayMessage("Cleared Canvas", 1500);
        reset();
        panel.confirmDialog._visible = false;
        cursorImage(lastTool);
        panelMode("draw");
        panel[lastTool + "B"].onPress();
        undoList = [];
    };
    panel.confirmDialog.No.onRelease = function ()
    {
        panel.confirmDialog._visible = false;
        cursorImage(lastTool);
        panelMode("draw");
        panel[lastTool + "B"].onPress();
        disableConfirmButtons();
    };
    panel.confirmDialog.save.onPress = function ()
    {
        var _loc1 = getDateAndTime();
        saveFunction("Stashed " + _loc1, true);
        linetracker = 0;
        panel.fileDialog.name.text = "Untitled " + date_track_today;
        disableConfirmButtons();
        saved = false;
        tla.dummy._visible = false;
        tla.flag._visible = false;
        statusText.text = "0 Lines";
        statusText_blue.text = "0 Floor";
        statusText_red.text = "0 Accel";
        statusText_green.text = "0 Scene";
        displayMessage("Stashed track", 1500);
        reset();
        panel.confirmDialog._visible = false;
        cursorImage(lastTool);
        panelMode("draw");
        panel[lastTool + "B"].onPress();
        undoList = [];
    };
};
var prevZoom = 100;
panel.zoomB.onPress = function ()
{
    panelMode("draw");
    tla._x = canvasX;
    tla._y = canvasY;
    if (Key.isDown(16))
    {
        jumpZoomBool = true;
        prevZoom = Math.round(tla._xscale / 100) * 100;
        if (prevZoom == 0)
        {
            prevZoom = 50;
        } // end if
        displayMessage("Jump to " + prevZoom + ".x zoom \n press enter to apply", 3500);
    }
    else if (!Key.isDown(16))
    {
        jumpZoomBool = false;
        cursorMode = "zoom";
        panel.swatches._visible = false;
        panel.handTools._visible = false;
        zoom();
        lastTool = "zoom";
    } // end else if
};
panel.flagB.onPress = function ()
{
    if (flaglock == true)
    {
        if (simulation && Key.isDown(16))
        {
            saveNow = true;
            saved = true;
            flagCoor[0] = tla.flag._x;
            flagCoor[1] = tla.flag._y;
            flagsaved = true;
            timeflag = statusText_blue.text;
            var _loc1 = time(frames + 1);
            tla.flag.flagTime.text = _loc1;
            flaggedstat = [frames + 1];
            ++flagCount;
        }
        else if (advancedMode && Key.isDown(16))
        {
            saved = false;
            tla.dummy._visible = false;
            tla.flag._visible = false;
            flagsaved = false;
            anchors[0] = "empty";
            anchors[1] = "empty";
            flaggedstat = [0, 0];
        } // end if
    } // end else if
    if (flaglock == false)
    {
        if (simulation)
        {
            saveNow = true;
            saved = true;
            flagCoor[0] = tla.flag._x;
            flagCoor[1] = tla.flag._y;
            flagsaved = true;
            timeflag = statusText_blue.text;
            _loc1 = time(frames + 1);
            tla.flag.flagTime.text = _loc1;
            flaggedstat = [frames + 1];
            ++flagCount;
        }
        else if (advancedMode)
        {
            saved = false;
            tla.dummy._visible = false;
            tla.flag._visible = false;
            flagsaved = false;
            anchors[0] = "empty";
            anchors[1] = "empty";
            flaggedstat = [0, 0];
        } // end if
    } // end else if
    jumpZoomBool = false;
};
var massFlagCache = [];
var flagCount = 0;
var currentFlag = 0;
var lineToUndo = 0;
var redoLineList = [];
var i = 0;
var frameTimes = [];
var tFrameCount = 0;
panel.playbackcon._visible = false;
panel.customSol._visible = false;
tla.manipBase._visible = false;
tla.manip.gotoAndStop(1);
tla.manip.onPress = function ()
{
    function onMouseMove()
    {
        activeManipLine.x1 = tla.manip._x;
        activeManipLine.y1 = tla.manip._y;
    } // End of the function
    tla.manip.startDrag(false);
};
tla.manip.onRelease = function ()
{
    function onMouseMove()
    {
    } // End of the function
    stopDrag ();
};
tla.manip2.onMouseDown = function ()
{
    function onMouseMove()
    {
        activeManipLine.x2 = tla.manip2._x;
        activeManipLine.y2 = tla.manip2._y;
    } // End of the function
    tla.manip2.startDrag(false);
};
tla.manip2.onMouseUp = function ()
{
    function onMouseMove()
    {
    } // End of the function
    stopDrag ();
};
var framesInSecond = 0;
stop ();
Stage.align = "TL";
barrierR = Stage.width * 0.618030;
barrierL = Stage.width * 0.381970;
barrierT = Stage.height * 0.381970;
barrierB = Stage.height * 0.618030;
resize = new Object();
navodila._x = Stage.width * 0.500000;
navodila._y = Stage.height * 0.500000;
navodila.cover._width = Stage.width;
navodila.cover._height = Stage.height;
navodila.cover._x = -Stage.width * 0.500000;
navodila.cover._y = -Stage.height * 0.500000;
compas.distance.autoSize = "left";
panel._x = Stage.width / 2;
resize.onResize = function ()
{
    statusText._x = Stage.width - statusText.width;
    statusText_blue._width = statusText._width;
    statusText_blue._x = statusText._x;
    statusText_blue._y = statusText._y + statusText.height;
    statusText_red._width = statusText._width;
    statusText_red._x = statusText._x;
    statusText_red._y = statusText_blue._y + statusText_blue.height;
    statusText_green._width = statusText._width;
    statusText_green._x = statusText._x;
    statusText_green._y = statusText_red._y + statusText_red.height;
    statusB._x = statusText._x;
    statusB._width = statusText._width;
    statusB._y = statusText_green._y + statusText_green.height;
    barrierR = Stage.width * 0.618030;
    barrierL = Stage.width * 0.381970;
    barrierT = Stage.height * 0.381970;
    barrierB = Stage.height * 0.618030;
    navodila._x = Stage.width * 0.500000;
    navodila._y = Stage.height * 0.500000;
    navodila.cover._width = Stage.width;
    navodila.cover._height = Stage.height;
    navodila.cover._x = -Stage.width * 0.500000;
    navodila.cover._y = -Stage.height * 0.500000;
    camBound._x = Stage.width / 2;
    camBound._y = Stage.height / 2;
    compas._y = Stage.height - 14;
    compas._x = Stage.width * 0.500000;
    panel.menuB._y = stage.height / 2;
    panel._x = Stage.width / 2;
};
resize.onResize();
Stage.addListener(resize);
Key.addListener(this);
BindStick.crash = false;
FloorBase.zone = 20 * Math.sqrt(SCALEDOWN * SCALEDOWN);
world.sled._xscale = world.sled._yscale = world.body._xscale = world.body._yscale = world.arm1._xscale = world.arm1._yscale = world.arm2._xscale = world.arm2._yscale = world.leg1._xscale = world.leg1._yscale = world.leg2._xscale = world.leg2._yscale = Math.sqrt(SCALEDOWN * SCALEDOWN) * 100;
tla.dummy.sled._xscale = tla.dummy.sled._yscale = tla.dummy.body._xscale = tla.dummy.body._yscale = tla.dummy.arm1._xscale = tla.dummy.arm1._yscale = tla.dummy.arm2._xscale = tla.dummy.arm2._yscale = tla.dummy.leg1._xscale = tla.dummy.leg1._yscale = tla.dummy.leg2._xscale = tla.dummy.leg2._yscale = Math.sqrt(SCALEDOWN * SCALEDOWN) * 100;
tla.dummy._visible = false;
tla.flag._visible = false;
tla.startPoint.help._visible = false;
kakica.focusEnabled = true;
if (savedTracks.data.trackList == undefined)
{
    savedTracks.data.trackList = [];
} // end if
panel.fileDialog.savedTracks.defaultIcon = "rev6.2";
panel.fileDialog.savedTracks.iconFunction = function (item)
{
    var _loc1 = item.version;
    switch (_loc1)
    {
        case "6.1":
        {
            return ("rev6.1");
            break;
        } 
        case "6.2":
        {
            return ("rev6.2");
            break;
        } 
        default:
        {
            return ("rev6");
            break;
        } 
    } // End of switch
};
var jumpZoomBool = false;
panel.fileDialog._visible = false;
panel.confirmDialog._visible = false;
helpscreen._visible = false;
helpscreen.Continue.onPress = function ()
{
    helpscreen._visible = false;
    cursorImage(lastTool);
};
var mouseListener = new Object();
mouseListener.onMouseWheel = function (delta)
{
    if (simulation == false && scrollzoom == true && panel.fileDialog._visible == false && panel.confirmDialog._visible == false && jumpZoomBool == false)
    {
        var _loc7 = tla._xscale;
        var _loc4 = Math.min(Math.max(_loc7 + _loc7 * 0.040000 * delta, 5), 2400);
        if (tla._xscale != 5)
        {
            var _loc3 = (_root._xmouse - Stage.width / 2) / 20;
            var _loc6 = (_root._ymouse - Stage.height / 2) / 20;
        }
        else
        {
            _loc6 = 0;
            _loc3 = 0;
        } // end else if
        tla._x = Stage.width * 0.500000 + (canvasX - Stage.width * 0.500000) * (_loc4 / _loc7) - _loc3 * delta;
        tla._y = Stage.height * 0.500000 + (canvasY - Stage.height * 0.500000) * (_loc4 / _loc7) - _loc6 * delta;
        tla._xscale = tla._yscale = _loc4;
        displayMessage(Math.round(_loc7 * 10) / 10 + " zoom", 1500);
        bufScale = tla._xscale;
        canvasX = tla._x;
        canvasY = tla._y;
        zoomBuf = Math.round(_loc7);
    }
    else if (jumpZoomBool == true)
    {
        var _loc5 = delta > 0 ? (1) : (-1);
        _loc7 = prevZoom + 50 * _loc5;
        _loc4 = Math.min(Math.max(_loc7, 50), 2400);
        prevZoom = _loc4;
        displayMessage("Jump to " + _loc4 + ".x zoom \n press Enter to apply", 2500);
    } // end else if
    if (simulation == true && pauseStatus == true)
    {
        if (delta > 0)
        {
            verlet(riderAnchors);
            scarfAnchors[1].x = scarfAnchors[1].x + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dx, 125);
            scarfAnchors[1].y = scarfAnchors[1].y + Math.random() * 0.300000 * -Math.min(riderAnchors[5].dy, 125);
            verlet(scarfAnchors);
            satisfyConstraints();
            ++frames;
            storeFrame(frames - 1);
            render();
        }
        else if (delta < 0)
        {
            if (frames > 0)
            {
                injectPoint(frames - 1);
            } // end if
            render();
        } // end if
    } // end else if
    if (simulation == true && slowMotion == true && pauseStatus == false)
    {
        _loc6 = Math.min(Math.max(slowmonumber + delta * -3.333333, 0), 750);
        scrollslow = Math.round(_loc6);
        slowmonumber = scrollslow;
    } // end if
};
var savedPositionCache = [];
var massPositionCache = [];
var tracedFlag = [];
var massFlagCache = [];
var scrollslow = 0;
Mouse.addListener(mouseListener);
cursor.onMouseMove = function ()
{
    if (active == true && active2 == true && simulation == false)
    {
        cursor._x = _xmouse;
        cursor._y = _ymouse;
        if (!Key.isDown(32))
        {
            cursorImage(lastTool);
        }
        else
        {
            cursorImage("hand");
        } // end if
    } // end else if
};
var handMode = 1;
cursorImage = function (Mode)
{
    switch (Mode)
    {
        case "pencil":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(1);
            cursorMode = Mode;
            break;
        } 
        case "hand":
        {
            Mouse.hide();
            cursor._visible = true;
            if (handMode == 1)
            {
                cursor.gotoAndStop(2);
            }
            else if (handMode == 2)
            {
                cursor.gotoAndStop(6);
            } // end else if
            cursorMode = Mode;
            break;
        } 
        case "eraser":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(3);
            cursorMode = Mode;
            break;
        } 
        case "zoom":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(4);
            cursorMode = Mode;
            break;
        } 
        case "normal":
        {
            Mouse.show();
            cursor._visible = false;
            cursorMode = Mode;
            break;
        } 
        case "line":
        {
            Mouse.hide();
            cursor._visible = true;
            cursor.gotoAndStop(5);
            cursorMode = Mode;
            break;
        } 
    } // End of switch
};
var oldScale;
var oldy;
var bufScale = 100;
registerInGrid = function (line)
{
    var _loc1 = gridPos(line.x1, line.y1);
    var _loc10 = gridPos(line.x2, line.y2);
    var _loc13 = line.dx > 0 ? (_loc10.x) : (_loc1.x);
    var _loc11 = line.dx > 0 ? (_loc1.x) : (_loc10.x);
    var _loc7 = line.dy > 0 ? (_loc10.y) : (_loc1.y);
    var _loc12 = line.dy > 0 ? (_loc1.y) : (_loc10.y);
    if (line.dx == 0 && line.dy == 0 || _loc1.x == _loc10.x && _loc1.y == _loc10.y)
    {
        register(line, _loc1.x, _loc1.y);
        return;
    }
    else
    {
        register(line, _loc1.x, _loc1.y);
    } // end else if
    var _loc4 = line.x1;
    var _loc3 = line.y1;
    var _loc8 = 1 / line.dx;
    var _loc9 = 1 / line.dy;
    while (true)
    {
        var _loc5;
        if (_loc1.x < 0)
        {
            difX = line.dx > 0 ? (GRIDSIZE + _loc1.gx) : (-GRIDSIZE - _loc1.gx);
        }
        else
        {
            difX = line.dx > 0 ? (GRIDSIZE - _loc1.gx) : (-(_loc1.gx + 1));
        } // end else if
        if (_loc1.y < 0)
        {
            _loc5 = line.dy > 0 ? (GRIDSIZE + _loc1.gy) : (-GRIDSIZE - _loc1.gy);
        }
        else
        {
            _loc5 = line.dy > 0 ? (GRIDSIZE - _loc1.gy) : (-(_loc1.gy + 1));
        } // end else if
        if (line.dx == 0)
        {
            _loc3 = _loc3 + _loc5;
        }
        else if (line.dy == 0)
        {
            _loc4 = _loc4 + difX;
        }
        else
        {
            var _loc6 = _loc3 + line.dy * difX * _loc8;
            if (Math.abs(_loc6 - _loc3) < Math.abs(_loc5))
            {
                _loc4 = _loc4 + difX;
                _loc3 = _loc6;
            }
            else if (Math.abs(_loc6 - _loc3) == Math.abs(_loc5))
            {
                _loc4 = _loc4 + difX;
                _loc3 = _loc3 + _loc5;
            }
            else
            {
                _loc4 = _loc4 + line.dx * _loc5 * _loc9;
                _loc3 = _loc3 + _loc5;
            } // end else if
        } // end else if
        _loc1 = gridPos(_loc4, _loc3);
        if (_loc1.x >= _loc11 && _loc1.x <= _loc13 && _loc1.y >= _loc12 && _loc1.y <= _loc7)
        {
            register(line, _loc1.x, _loc1.y);
            continue;
        } // end if
        return;
    } // end while
};
init();
reset();
drawPencil();
setInterval(blink, 1000);
panel.pencilB.onPress();
cursorImage("pencil");
panel.menuB._visible = false;
panel.menuB.makeDemo.onPress = function ()
{
    panel.menuB._visible = false;
    panel.confirmDialog._visible = true;
    panel.confirmDialog.text.text = "Creating a new demo will overwrite current demo. \n Continue with operation?";
    enableConfirmButtons("null");
    panel.confirmDialog.Yes.onPress = function ()
    {
        panel.makeDemo.onPress = launchDemoBox();
        disableConfirmDialog();
        panel.confirmDialog._visible = false;
    };
    panel.confirmDialog.No.onPress = function ()
    {
        panel.settingsB.onPress();
        disableConfirmDialog();
        panel.confirmDialog._visible = false;
    };
};
panel.settingsB.onPress = function ()
{
    tla.startPoint._visible = false;
    jumpZoomBool = false;
    panel.menuB._visible = true;
    panel.demoBox._visible = false;
    panel.fileDialog._visible = false;
    panel.menuB.cameradis._visible = false;
    cursorImage("normal");
    panelMode("save");
    panel.menuB._y = Stage.height / 2;
    active = false;
    active2 = false;
    panel.menuB.customZoomCount.stepcount.text = CUSTSCALE;
    panel.menuB.minutesB.stepcount.text = autocalltime / 60000;
    panel.menuB.lines.stepcount.text = linecountauto;
    adjustSettings();
    panel.menuB.buildVersionText.text = buildVersionDisplayMenu;
};
panel.menuB.onEnterFrame = function ()
{
    panel.menuB._x = Stage.width - Stage.width;
    panel.menuB._y = Stage.height / 2;
};
var waterMark = "40 fps";
panel.menuB.closeB.onPress = function ()
{
    panel.menuB._visible = false;
    panelMode("draw");
    cursorImage(lastTool);
    cookiesSave();
    active = true;
    active2 = true;
    panel.menuB.dummyBox.setFocus();
    waterMark = panel.menuB.statusTextLock.text;
};
panelMode = function (Mode)
{
    if (Mode == "draw")
    {
        panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.settingsB.enabled = panel.flagB.enabled = panel.dragB.enabled = true;
        panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = panel.settingsB._alpha = panel.dragB._alpha = 100;
        panel.flagB.gotoAndStop(2);
        active2 = true;
        compas._visible = true;
        tla.startPoint._visible = true;
        panel.handTools._visible = false;
        panel.playbackcon._visible = false;
    }
    else if (Mode == "simulate")
    {
        panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.settingsB.enabled = panel.dragB.enabled = false;
        panel.saveB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = true;
        panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.settingsB._alpha = panel.dragB._alpha = 30;
        panel.saveB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 100;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
        compas._visible = false;
        tla.startPoint._visible = false;
        panel.playbackcon._visible = true;
    }
    else if (Mode == "save")
    {
        panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = panel.settingsB.enabled = false;
        panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = panel.settingsB._alpha = 30;
        panel.flagB.gotoAndStop(1);
        panel.swatches._visible = false;
        panel.playbackcon._visible = false;
        tla.startPoint._visible = false;
    } // end else if
};
panel.lineB.onRollOver = panel.swatches.green.onRollOver = panel.swatches.red.onRollOver = panel.swatches.blue.onRollOver = panel.handTools.pointB.onRollOver = panel.handTools.dragB.onRollOver = panel.zoomB.onRollOver = panel.eraserB.onRollOver = panel.flagB.onRollOver = panel.handB.onRollOver = panel.pencilB.onRollOver = panel.playB.onRollOver = panel.stopB.onRollOver = panel.saveB.onRollOver = panel.trashB.onRollOver = panel.settingsB.onRollOver = panel.dragB.onRollOver = commandconsole.inputB.onRollOver = function ()
{
    active2 = false;
    cursor._visible = false;
    Mouse.show();
};
panel.lineB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.handTools.pointB.onRollOut = panel.handTools.dragB.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.settingsB.onRollOut = panel.dragB.onRollOut = commandconsole.inputB.onRollOut = panel.lineB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = panel.settingsB.onReleaseOutside = panel.dragB.onReleaseOutside = commandconsole.inputB.onReleaseOutside = function ()
{
    active2 = true;
    cursorImage(cursorMode);
};
panel.playB.onPress = function ()
{
    if (Lines > 0)
    {
        slowmonumber = Lastslownumber;
        pauseStatus = false;
        if (stattextvis == true)
        {
            statusText._visible = false;
            statusText_blue._visible = false;
            statusText_red._visible = false;
            statusText_green._visible = false;
        } // end if
        if (panelvis == true)
        {
            panel._visible = false;
        } // end if
        jumpZoomBool = false;
        pausestatus = false;
        var _loc5 = cursorMode;
        world.body.face.gotoAndStop(1);
        if (saved && !Key.isDown(65))
        {
            restore();
            frames = flaggedstat[0];
            if (!riding)
            {
                BindStick.crash = false;
                world.sled.gotoAndStop(sledState);
                world.body.face.gotoAndStop(faceState);
            } // end if
        }
        else
        {
            if (!saved)
            {
                cleanUp();
                init();
                frames = 0;
            }
            else
            {
                frames = 0;
                resetPosition();
                BindStick.crash = false;
                world.sled.gotoAndStop(1);
            } // end else if
            moveToStartPos();
            topSpeed = 0;
        } // end else if
        tla.clear();
        if (!simulation)
        {
            simulation = true;
            panelMode("simulate");
            cursorImage("normal");
        } // end if
        if (!Key.isDown(16) && zoomstat == "off")
        {
            tla._xscale = tla._yscale = world._xscale = world._yscale = INVSCALE;
        }
        else if (zoomstat == "current" && Key.isDown(16))
        {
            tla._xscale = tla._yscale = world._xscale = world._yscale = INVSCALE;
        }
        else if (zoomstat == "custom" && !Key.isDown(16))
        {
            tla._xscale = tla._yscale = world._xscale = world._yscale = CUSTSCALE;
        } // end else if
        world._xscale = world._yscale = tla._yscale;
        world._visible = true;
        help._visible = false;
        if (Key.isDown(90))
        {
            var _loc3 = tla._xscale;
            var _loc4 = Math.max(_loc3 * 0.900000, 5);
            world._xscale = world._yscale = tla._xscale = tla._yscale = _loc4;
            world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc4 / _loc3);
            world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc4 / _loc3);
        } // end if
        if (Key.isDown(88))
        {
            _loc3 = tla._xscale;
            _loc4 = Math.min(_loc3 * 1.100000, 2400);
            world._xscale = world._yscale = tla._xscale = tla._yscale = _loc4;
            world._x = tla._x = Stage.width * 0.500000 + (tla._x - Stage.width * 0.500000) * (_loc4 / _loc3);
            world._y = tla._y = Stage.height * 0.500000 + (tla._y - Stage.height * 0.500000) * (_loc4 / _loc3);
        } // end if
        _loc5 = new Object();
        _loc5.x = riderAnchors[5].x;
        _loc5.y = riderAnchors[5].y;
        world.localToGlobal(_loc5);
        var _loc7 = Stage.width * 0.500000 - _loc5.x;
        var _loc8 = Stage.height * 0.500000 - _loc5.y;
        tla._x = world._x = world._x + _loc7;
        tla._y = world._y = world._y + _loc8;
        wipe();
        if (!Key.isDown(67) && colorplay == false)
        {
            var _loc2 = "simulation";
        }
        else if (Key.isDown(67) && colorplay == false)
        {
            _loc2 = "simColor";
        }
        else if (!Key.isDown(67) && colorplay == true)
        {
            _loc2 = "simColor";
        } // end else if
        if (Key.isDown(67) && colorplay == true)
        {
            _loc2 = "simulation";
        } // end if
        for (var _loc6 in lines)
        {
            var _loc1 = lines[_loc6];
            renderLine(_loc1, _loc2);
        } // end of for...in
        panel.playbackcon.pauseb._visible = true;
        panel.playbackcon.resumeb._visible = false;
        panel.handB._visible = false;
        if (!Key.isDown(17) && liveDraw == false)
        {
            onMouseMove = function ()
            {
            };
            onMouseDown = function ()
            {
            };
            onMouseUp = function ()
            {
            };
        }
        else if (Key.isDown(17) || liveDraw == false)
        {
        } // end else if
        render();
        simulate();
    } // end if
};
var foolCount;
var canvasX = 0;
var canvasY = 0;
var bufScale = 100;
var storedFlag = [];
panel.stopB.onPress = function ()
{
    slowmonum = Lastslownumber;
    panel.handB._visible = true;
    panel.settingsB._visible = true;
    framesInSecond = 0;
    if (lastTool == "pencil")
    {
        panel.pencilB.onPress();
    }
    else if (lastTool == "line")
    {
        panel.pencilB.onPress();
        panel.lineB.onPress();
    }
    else if (lastTool == "eraser")
    {
        panel.pencilB.onPress();
        panel.eraserB.onPress();
    }
    else if (lastTool == "hand")
    {
        panel.pencilB.onPress();
        panel.handB.onPress();
    }
    else if (lastTool == "zoom")
    {
        panel.pencilB.onPress();
        panel.zoomB.onPress();
    } // end else if
    if (tla.flag._visible)
    {
        panel.flagB.flagUp.gotoAndStop(2);
    } // end if
    panel._visible = true;
    statusText._visible = true;
    statusText_blue._visible = true;
    statusText_red._visible = true;
    statusText_green._visible = true;
    framestext._visible = true;
    world._visible = false;
    tla._x = canvasX;
    tla._y = canvasY;
    tla._xscale = tla._yscale = bufScale;
    simulation = false;
    for (var _loc2 in lines)
    {
        var _loc1 = lines[_loc2];
        if (preview == false)
        {
            renderLine(_loc1, "editor");
            continue;
        } // end if
        renderLine(_loc1, "preview");
    } // end of for...in
    clearInterval(framerateInterval);
    statusText.text = Lines + " Lines";
    panelMode("draw");
    help._visible = true;
    lines[foolCount].fool = false;
    if (saved)
    {
        ++currentFlag;
        massFlagCache[currentFlag] = new flag(tla.flag._x, tla.flag._y, frames, riderAnchors, flagCount);
        ++flagCount;
    } // end if
};
var globalFoolBool = false;
var seeFoolSetting = false;
panel.eraserB.onPress = function ()
{
    panel.swatches._visible = true;
    panel.handTools._visible = false;
    cursorMode = "eraser";
    jumpZoomBool = false;
    onMouseDown = function ()
    {
        jumpZoomBool = false;
        if (active2)
        {
            if (Key.isDown(32))
            {
                pan();
            }
            else
            {
                statusB.text = "";
                erase(tla._xmouse, tla._ymouse);
                onMouseMove = function ()
                {
                    erase(tla._xmouse, tla._ymouse);
                };
            } // end if
        } // end else if
    };
    onMouseUp = function ()
    {
        stopDrag ();
        if (!simulation)
        {
            canvasX = tla._x;
            canvasY = tla._y;
        } // end if
        onMouseMove = function ()
        {
        };
    };
    onEnterFrame = function ()
    {
    };
    if (lastTool != "eraser")
    {
        if (colorEraser == true)
        {
            pencilMode = lastSwatch;
            if (lastSwatch == 0)
            {
                panel.swatches.blue.onPress();
            }
            else if (lastSwatch == 1)
            {
                panel.swatches.red.onPress();
            }
            else if (lastSwatch == 2)
            {
                panel.swatches.green.onPress();
            } // end else if
        }
        else
        {
            panel.swatches.selected._visible = false;
        } // end else if
        lastTool = "eraser";
    }
    else
    {
        colorEraser = false;
        panel.swatches.selected._visible = false;
    } // end else if
};
helpmenu._visible = false;
panel.playbackcon.resumeb.onPress = function ()
{
    pauseStatus = false;
    panel.playbackcon.pauseb._visible = true;
    panel.playbackcon.resumeb._visible = false;
};
panel.playbackcon.pauseb.onPress = function ()
{
    pauseStatus = true;
    panel.playbackcon.pauseb._visible = false;
    panel.playbackcon.resumeb._visible = true;
};
var safeToSave = false;
var userData = SharedObject.getLocal("LRProfile", "/");
cookiesLoadAndApply();
var messageDis = true;
var lastSwatch = 0;
panel.demoBox._visible = false;
