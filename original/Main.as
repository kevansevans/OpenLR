
                                             function blink()
{
   if(Math.random() < BLINK_RATE)
   {
      world.sankac.face.uch1.play();
      world.sankac.face.uch2.play();
   }
}
function onKeyUp()
{
   if(Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "hand") && helpscreen._visible == false)
   {
      cursorImage(cursor.temp);
   }
   if(Key.getCode() == 72 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      helpscreen._visible = !helpscreen._visible;
      if(helpscreen._visible)
      {
         tla.startPoint.help._visible = false;
         tla.startPoint.onReleaseOutside = tla.startPoint.onRollOut = panel.lineB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.lineB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = function()
         {
         };
         panel._visible = false;
         cursor._visible = false;
         Mouse.show();
         active2 = false;
      }
      else
      {
         tla.startPoint.onRollOut = function()
         {
            tla.startPoint.help._visible = false;
            active2 = true;
            cursorImage(cursorMode);
         };
         tla.startPoint.onReleaseOutside = function()
         {
            tla.startPoint.onRelease();
            tla.startPoint.onRollOut();
         };
         panel.lineB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.lineB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = function()
         {
            active2 = true;
            cursorImage(cursorMode);
         };
         panel._visible = true;
         cursor._visible = true;
         Mouse.hide();
         active2 = true;
      }
   }
   if(Key.getCode() == 81 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.pencilB.onPress();
      cursorImage("pencil");
   }
   if(Key.getCode() == 87 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.lineB.onPress();
      cursorImage("line");
   }
   if(Key.getCode() == 69 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.eraserB.onPress();
      cursorImage("eraser");
   }
   if(Key.getCode() == 82 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.zoomB.onPress();
      cursorImage("zoom");
   }
   if(Key.getCode() == 84 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.handB.onPress();
      cursorImage("hand");
   }
   if(Key.getCode() == 89 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.playB.onPress();
   }
   if(Key.getCode() == 85 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.stopB.onPress();
   }
   if(Key.getCode() == 73 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.flagB.onPress();
   }
   if(Key.getCode() == 79 && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.saveB.onPress();
   }
   if(Key.getCode() == 80 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      panel.trashB.onPress();
   }
   if(Key.getCode() == 49 && panel.swatches._visible == true)
   {
      panel.swatches.blue.onPress();
   }
   if(Key.getCode() == 50 && panel.swatches._visible == true)
   {
      panel.swatches.red.onPress();
   }
   if(Key.getCode() == 51 && panel.swatches._visible == true)
   {
      panel.swatches.green.onPress();
   }
   if(Key.getCode() == 9 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      if(tempZoom == undefined || tla._xscale != ttZoom)
      {
         trace(tempLines);
         if(Lines != tempLines)
         {
            tempLines = Lines;
            trace("gotBounds");
            getBounds();
         }
         tempZoom = tla._xscale;
         showAll();
         ttZoom = tla._xscale;
      }
      else
      {
         var _loc7_ = tla._xmouse;
         var _loc6_ = tla._ymouse;
         var _loc5_ = _xmouse;
         var _loc4_ = _ymouse;
         canvasX = tla._x = - _loc7_ * tempZoom * 0.01 - _loc5_;
         canvasY = tla._y = - _loc6_ * tempZoom * 0.01 - _loc4_;
         bufScale = tla._xscale = tla._yscale = tempZoom;
         tempZoom = undefined;
      }
   }
   if(Key.getCode() == 8 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      undo();
   }
   if(Key.getCode() == 36 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      tmpPoint.x = tla.startPoint._x;
      tmpPoint.y = tla.startPoint._y;
      tla.localToGlobal(tmpPoint);
      canvasX = tla._x = Stage.width * 0.5 - tmpPoint.x + tla._x;
      canvasY = tla._y = Stage.height * 0.5 - tmpPoint.y + tla._y;
   }
   if(Key.getCode() == 35 && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      var _loc1_ = getLastLine();
      if(_loc1_ != undefined)
      {
         tmpPoint.x = _loc1_.x2;
         tmpPoint.y = _loc1_.y2;
         tla.localToGlobal(tmpPoint);
         canvasX = tla._x = Stage.width * 0.5 - tmpPoint.x + tla._x;
         canvasY = tla._y = Stage.height * 0.5 - tmpPoint.y + tla._y;
      }
   }
   if(Key.getCode() == 70 && tla.flag._visible == true && simulation == false && panel.fileDialog._visible == false && panel.confirmDialog._visible == false)
   {
      tmpPoint.x = tla.flag._x;
      tmpPoint.y = tla.flag._y;
      tla.localToGlobal(tmpPoint);
      canvasX = tla._x = Stage.width * 0.5 - tmpPoint.x + tla._x;
      canvasY = tla._y = Stage.height * 0.5 - tmpPoint.y + tla._y;
   }
   if(Key.getCode() == 77 && simulation == true)
   {
      slowMotion = !slowMotion;
   }
   if(Key.getCode() == 66)
   {
      for(var _loc3_ in lines)
      {
         _loc1_ = lines[_loc3_];
         var _loc2_ = new Array(_loc1_.x1,_loc1_.y1,_loc1_.x2,_loc1_.y2,_loc1_.lim,Number(_loc1_.inv),_loc1_.prevLine,_loc1_.nextLine,_loc1_.name,_loc1_.type);
         trace(_loc2_);
      }
   }
}
function showAll()
{
   var _loc6_ = maxX - minX;
   var _loc5_ = maxY - minY;
   var _loc4_ = Stage.width / _loc6_;
   var _loc3_ = Stage.height / _loc5_;
   var _loc2_ = Math.min(_loc4_,3);
   var _loc1_ = Math.min(_loc3_,3);
   if(_loc4_ > _loc3_)
   {
      bufScale = tla._xscale = tla._yscale = _loc1_ * 100;
      canvasX = tla._x = (- minX) * _loc1_ + (Stage.width - _loc6_ * _loc1_) * 0.5;
      canvasY = tla._y = (- minY) * _loc1_;
   }
   else
   {
      bufScale = tla._xscale = tla._yscale = _loc2_ * 100;
      canvasX = tla._x = (- minX) * _loc2_;
      canvasY = tla._y = (- minY) * _loc2_ + (Stage.height - _loc5_ * _loc2_) * 0.5;
   }
}
function onKeyDown()
{
   if(Key.getCode() == 32 && (cursorMode == "pencil" || cursorMode == "zoom" || cursorMode == "eraser" || cursorMode == "line") && drawing == false && helpscreen._visible == false)
   {
      var _loc1_ = cursorMode;
      cursor.temp = _loc1_;
      cursorImage("hand");
   }
}
function pointToStartPoint()
{
   var _loc1_ = new Object();
   _loc1_.x = tla.startPoint._x;
   _loc1_.y = tla.startPoint._y;
   tla.localToGlobal(_loc1_);
   compas.distance.text = Math.floor(Math.sqrt(Math.pow(_loc1_.x - compas._x,2) + Math.pow(_loc1_.y - compas._y,2))) + " pixels";
   compas.dial._rotation = Math.atan2(_loc1_.y - compas._y,_loc1_.x - compas._x) * TO_DEG;
}
function removeSpaces(str)
{
   while(str.charAt(str.length - 1) == " ")
   {
      str = str.substr(0,str.length - 1);
   }
   return str;
}
function finishLoad()
{
   panel.onEnterFrame = function()
   {
   };
   if(lines["line" + savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine] == undefined && typeof savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine == "number")
   {
      var _loc1_ = [];
      _loc1_[0] = 100;
      _loc1_[1] = 100;
   }
   else if(typeof savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine == "number")
   {
      _loc1_ = [];
      _loc1_[0] = lines["line" + savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine].x1;
      _loc1_[1] = lines["line" + savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine].y1 - 50 * SCALEDOWN;
   }
   else
   {
      _loc1_ = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].startLine;
   }
   tla.startPoint._x = _loc1_[0];
   tla.startPoint._y = _loc1_[1];
   totLines = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].level;
   panel[lastTool + "B"].onPress();
   cursorImage(cursorMode);
   panelMode("draw");
   pointToStartPoint();
   steuc.text = Lines + " lines";
}
function disableFileButtons()
{
   fucusManager.enabled = false;
   panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = false;
   panel.fileDialog.name.editable = false;
   panel.fileDialog.saveButton.onRelease = panel.fileDialog.loadButton.onRelease = panel.fileDialog.deleteButton.onRelease = panel.fileDialog.close.onPress = function()
   {
   };
}
function enableFileButtons()
{
   panel.fileDilag.saveButton.enabled = panel.fileDilag.loadButton.enabled = panel.fileDilag.deleteButton.enabled = panel.fileDilag.close.enabled = true;
   panel.fileDialog.name.editable = true;
}
function disableConfirmButtons()
{
   panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = false;
   panel.confirmDialog.Yes.onRelease = panel.confirmDialog.No.onRelease = function()
   {
   };
}
function enableConfirmButtons()
{
   panel.confirmDialog.Yes.enabled = panel.confirmDialog.No.enabled = true;
}
function getBounds()
{
   maxX = 0;
   maxY = 0;
   minX = Stage.width;
   minY = Stage.height;
   for(var _loc2_ in lines)
   {
      var _loc1_ = lines[_loc2_];
      maxX = Math.max(maxX,Math.max(_loc1_.x1,_loc1_.x2));
      maxY = Math.max(maxY,Math.max(_loc1_.y1,_loc1_.y2));
      minX = Math.min(minX,Math.min(_loc1_.x1,_loc1_.x2));
      minY = Math.min(minY,Math.min(_loc1_.y1,_loc1_.y2));
   }
}
function loadBounds(linez)
{
   maxX = 0;
   maxY = 0;
   minX = Stage.width;
   minY = Stage.height;
   for(var _loc3_ in linez)
   {
      var _loc1_ = linez[_loc3_];
      maxX = Math.max(maxX,Math.max(_loc1_[0],_loc1_[2]));
      maxY = Math.max(maxY,Math.max(_loc1_[1],_loc1_[3]));
      minX = Math.min(minX,Math.min(_loc1_[0],_loc1_[2]));
      minY = Math.min(minY,Math.min(_loc1_[1],_loc1_[3]));
   }
}
function init()
{
   BindStick.crash = false;
   dots = [];
   dots2 = [];
   dots[0] = new Point(0,0,0.8);
   dots[1] = new Point(0,10,0);
   dots[2] = new Point(30,10,0);
   dots[3] = new Point(35,0,0);
   dots[4] = new Point(10,0,0.8);
   dots[5] = new Point(10,-11,0.8);
   dots[6] = new Point(23,-10,0.1,true);
   dots[7] = new Point(23,-10,0.1);
   dots[8] = new Point(20,10,0);
   dots[9] = new Point(20,10,0);
   dots2[0] = new PointAirFri(7,-10,AIR_FRICTION);
   dots2[1] = new PointAirFri(3,-10,AIR_FRICTION);
   dots2[2] = new PointAirFri(0,-10,AIR_FRICTION);
   dots2[3] = new PointAirFri(-4,-10,AIR_FRICTION);
   dots2[4] = new PointAirFri(-7,-10,AIR_FRICTION);
   dots2[5] = new PointAirFri(-11,-10,AIR_FRICTION);
   var _loc1_ = 0;
   while(_loc1_ < dots.length)
   {
      dots[_loc1_].x *= SCALEDOWN;
      dots[_loc1_].y *= SCALEDOWN;
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < dots2.length)
   {
      dots2[_loc1_].x *= SCALEDOWN;
      dots2[_loc1_].y *= SCALEDOWN;
      _loc1_ = _loc1_ + 1;
   }
   world.sanke.gotoAndStop(1);
   world.sanke._xscale = world.sanke._yscale = world.sankac._xscale = world.sankac._yscale = world.roka1._xscale = world.roka1._yscale = world.roka2._xscale = world.roka2._yscale = world.noga1._xscale = world.noga1._yscale = world.noga2._xscale = world.noga2._yscale = SCALEDOWN * 100;
   edges = [];
   edges2 = [];
   edges[0] = new Stick(dots[0],dots[1]);
   edges[1] = new Stick(dots[1],dots[2]);
   edges[2] = new Stick(dots[2],dots[3]);
   edges[3] = new Stick(dots[3],dots[0]);
   edges[4] = new Stick(dots[0],dots[2]);
   edges[5] = new Stick(dots[3],dots[1]);
   edges[6] = new BindStick(dots[0],dots[4],ENDURANCE);
   edges[8] = new BindStick(dots[1],dots[4],ENDURANCE);
   edges[9] = new BindStick(dots[2],dots[4],ENDURANCE);
   edges[10] = new Stick(dots[5],dots[4]);
   edges[11] = new Stick(dots[5],dots[6]);
   edges[12] = new Stick(dots[5],dots[7]);
   edges[13] = new Stick(dots[4],dots[8]);
   edges[14] = new Stick(dots[4],dots[9]);
   edges[15] = new Stick(dots[5],dots[7]);
   edges[16] = new BindStick(dots[5],dots[0],ENDURANCE);
   edges[17] = new BindStick(dots[3],dots[6],ENDURANCE);
   edges[18] = new BindStick(dots[3],dots[7],ENDURANCE);
   edges[19] = new BindStick(dots[8],dots[2],ENDURANCE);
   edges[20] = new BindStick(dots[9],dots[2],ENDURANCE);
   edges[21] = new RepellStick(dots[5],dots[8]);
   edges[22] = new RepellStick(dots[5],dots[9]);
   edges[21].restLength *= 0.5;
   edges[22].restLength *= 0.5;
   edges2[0] = new Shal(dots[5],dots2[0]);
   edges2[1] = new Shal(dots2[0],dots2[1]);
   edges2[2] = new Shal(dots2[1],dots2[2]);
   edges2[3] = new Shal(dots2[2],dots2[3]);
   edges2[4] = new Shal(dots2[3],dots2[4]);
   edges2[5] = new Shal(dots2[4],dots2[5]);
}
function reset()
{
   clearFloor();
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
}
function snap(x, y, vert, invert)
{
   var _loc2_ = Math.pow(SNAP_DISTANCE / (tla._xscale * 0.01),2);
   var _loc11_ = x;
   var _loc10_ = y;
   var _loc17_ = undefined;
   var _loc18_ = undefined;
   var _loc6_ = undefined;
   var _loc7_ = undefined;
   var _loc9_ = false;
   var _loc15_ = gridPos(x,y);
   var _loc8_ = undefined;
   if(!Key.isDown(83))
   {
      var _loc14_ = -1;
      while(_loc14_ < 2)
      {
         var _loc4_ = "x" + (_loc15_.x + _loc14_);
         if(grid[_loc4_] != undefined)
         {
            var _loc5_ = -1;
            while(_loc5_ < 2)
            {
               var _loc3_ = "y" + (_loc15_.y + _loc5_);
               if(grid[_loc4_][_loc3_] != undefined)
               {
                  for(var _loc16_ in grid[_loc4_][_loc3_].storage2)
                  {
                     var _loc1_ = grid[_loc4_][_loc3_].storage2[_loc16_];
                     _loc6_ = Math.pow(x - _loc1_.x1,2) + Math.pow(y - _loc1_.y1,2);
                     _loc7_ = Math.pow(x - _loc1_.x2,2) + Math.pow(y - _loc1_.y2,2);
                     if(_loc6_ < _loc2_ && _loc1_.prevLine == undefined)
                     {
                        _loc2_ = _loc6_;
                        _loc11_ = _loc1_.x1;
                        _loc10_ = _loc1_.y1;
                        _loc9_ = 1;
                        _loc8_ = _loc1_;
                     }
                     if(_loc7_ < _loc2_ && _loc1_.nextLine == undefined)
                     {
                        _loc2_ = _loc7_;
                        _loc11_ = _loc1_.x2;
                        _loc10_ = _loc1_.y2;
                        _loc9_ = 2;
                        _loc8_ = _loc1_;
                     }
                  }
               }
               _loc5_ = _loc5_ + 1;
            }
         }
         _loc14_ = _loc14_ + 1;
      }
      _loc17_ = vert == _loc9_;
      _loc18_ = invert == _loc8_.inv;
      if(!(_loc17_ && !_loc18_ || !_loc17_ && _loc18_) || _loc8_.type == 2)
      {
         _loc9_ = false;
         _loc8_ = undefined;
         _loc11_ = x;
         _loc10_ = y;
      }
   }
   return [_loc11_,_loc10_,_loc9_,_loc8_];
}
function resetPosition()
{
   dots[0].x = 0;
   dots[0].y = 0;
   dots[1].x = 0;
   dots[1].y = 10;
   dots[2].x = 30;
   dots[2].y = 10;
   dots[3].x = 35;
   dots[3].y = 0;
   dots[4].x = 10;
   dots[4].y = 0;
   dots[5].x = 10;
   dots[5].y = -11;
   dots[6].x = 23;
   dots[6].y = -10;
   dots[7].x = 23;
   dots[7].y = -10;
   dots[8].x = 20;
   dots[8].y = 10;
   dots[9].x = 20;
   dots[9].y = 10;
   dots2[0].x = 7;
   dots2[0].y = -10;
   dots2[1].x = 3;
   dots2[1].y = -10;
   dots2[2].x = 0;
   dots2[2].y = -10;
   dots2[3].x = -4;
   dots2[3].y = -10;
   dots2[4].x = -7;
   dots2[4].y = -10;
   dots2[5].x = -11;
   dots2[5].y = -10;
   var _loc1_ = 0;
   while(_loc1_ < dots.length)
   {
      dots[_loc1_].x *= SCALEDOWN;
      dots[_loc1_].y *= SCALEDOWN;
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < dots2.length)
   {
      dots2[_loc1_].x *= SCALEDOWN;
      dots2[_loc1_].y *= SCALEDOWN;
      _loc1_ = _loc1_ + 1;
   }
}
function erase(x, y)
{
   var _loc15_ = gridPos(x,y);
   var _loc8_ = 1 / (tla._xscale * 0.01);
   var _loc14_ = -1;
   while(_loc14_ < 2)
   {
      var _loc6_ = "x" + (_loc15_.x + _loc14_);
      if(grid[_loc6_] != undefined)
      {
         var _loc7_ = -1;
         while(_loc7_ < 2)
         {
            var _loc4_ = "y" + (_loc15_.y + _loc7_);
            if(grid[_loc6_][_loc4_] != undefined)
            {
               for(var _loc16_ in grid[_loc6_][_loc4_].storage2)
               {
                  var _loc1_ = grid[_loc6_][_loc4_].storage2[_loc16_];
                  var _loc3_ = x - _loc1_.x1;
                  var _loc2_ = y - _loc1_.y1;
                  var _loc9_ = Math.sqrt(Math.pow(_loc3_,2) + Math.pow(_loc2_,2));
                  var _loc10_ = Math.sqrt(Math.pow(x - _loc1_.x2,2) + Math.pow(y - _loc1_.y2,2));
                  var _loc11_ = Math.abs(_loc1_.nx * _loc3_ + _loc1_.ny * _loc2_);
                  var _loc5_ = (_loc3_ * _loc1_.dx + _loc2_ * _loc1_.dy) * _loc1_.invSqrDis;
                  if(_loc9_ < ERASER_SIZE * _loc8_ || _loc10_ < ERASER_SIZE * _loc8_ || _loc11_ < ERASER_SIZE * _loc8_ && _loc5_ >= 0 && _loc5_ <= 1)
                  {
                     removeLine(_loc1_);
                  }
               }
            }
            _loc7_ = _loc7_ + 1;
         }
      }
      _loc14_ = _loc14_ + 1;
   }
}
function save()
{
   for(var _loc1_ in dots)
   {
      dots[_loc1_].savePoint();
   }
   for(var _loc2_ in dots2)
   {
      dots2[_loc2_].savePoint();
   }
}
function restore()
{
   for(var _loc1_ in dots)
   {
      dots[_loc1_].restore();
   }
   for(var _loc2_ in dots2)
   {
      dots2[_loc2_].restore();
   }
}
function pan()
{
   var _loc1_ = tla._xscale * 0.01;
   tla.startDrag(false);
   pointToStartPoint();
}
function zoom()
{
   onMouseDown = function()
   {
      if(active2)
      {
         oldScale = tla._xscale;
         oldy = _ymouse;
         if(cursor._currentframe == 2)
         {
            pan();
         }
         else
         {
            onMouseMove = function()
            {
               var _loc1_ = Math.min(Math.max(oldScale + (oldy - _ymouse) * 0.5,5),600);
               tla._xscale = tla._yscale = _loc1_;
               tla._x = Stage.width * 0.5 + (canvasX - Stage.width * 0.5) * (_loc1_ / oldScale);
               tla._y = Stage.height * 0.5 + (canvasY - Stage.height * 0.5) * (_loc1_ / oldScale);
            };
         }
      }
   };
   onMouseMove = function()
   {
   };
   onMouseUp = function()
   {
      stopDrag();
      pointToStartPoint();
      bufScale = tla._xscale;
      canvasX = tla._x;
      canvasY = tla._y;
      onMouseMove = function()
      {
      };
   };
   onEnterFrame = function()
   {
   };
}
function makeStartPoint(line)
{
   tla.startPoint._x = line.x1;
   tla.startPoint._y = line.y1 - 50 * SCALEDOWN;
   pointToStartPoint();
}
function getLastLine()
{
   var _loc2_ = undoList.length - 1;
   var _loc1_ = undefined;
   while(_loc1_ == undefined && Lines > 0)
   {
      _loc1_ = lines["line" + undoList[_loc2_]];
      _loc2_ = _loc2_ - 1;
   }
   return _loc1_;
}
function getFirstLine()
{
   var _loc2_ = 0;
   var _loc1_ = undefined;
   while(_loc1_ == undefined && Lines > 0)
   {
      _loc1_ = lines["line" + undoList[_loc2_]];
      _loc2_ = _loc2_ + 1;
   }
   return _loc1_;
}
function undo()
{
   var _loc1_ = undefined;
   while(_loc1_ == undefined && Lines > 0)
   {
      _loc1_ = lines["line" + undoList.pop()];
   }
   if(Lines > 0)
   {
      removeLine(_loc1_);
   }
}
function addLine(line)
{
   line.name = totLines;
   undoList.push(totLines);
   if(Lines == 0)
   {
      makeStartPoint(line);
   }
   Lines++;
   steuc.text = Lines + " lines";
   totLines++;
   registerInGrid(line);
   lines["line" + line.name] = line;
   var _loc2_ = tla.createEmptyMovieClip(line.name,tla.getNextHighestDepth());
   line.parent = _loc2_;
   renderLine(line);
}
function removeLine(line)
{
   Lines--;
   steuc.text = Lines + " lines";
   tla[line.name].removeMovieClip();
   removeFromGrid(line);
   if(Lines == 0)
   {
      startLine = undefined;
   }
   if(lines["line" + line.nextLine].prevLine == line.name)
   {
      lines["line" + line.nextLine].prevLine = undefined;
      switch(lines["line" + line.nextLine].lim)
      {
         case 1:
            lines["line" + line.nextLine].lim = 0;
            break;
         case 3:
            lines["line" + line.nextLine].lim = 2;
      }
   }
   if(lines["line" + line.nextLine].nextLine == line.name)
   {
      lines["line" + line.nextLine].nextLine = undefined;
      switch(lines["line" + line.nextLine].lim)
      {
         case 2:
            lines["line" + line.nextLine].lim = 0;
            break;
         case 3:
            lines["line" + line.nextLine].lim = 1;
      }
   }
   if(lines["line" + line.prevLine].prevLine == line.name)
   {
      lines["line" + line.prevLine].prevLine = undefined;
      switch(lines["line" + line.prevLine].lim)
      {
         case 1:
            lines["line" + line.prevLine].lim = 0;
            break;
         case 3:
            lines["line" + line.prevLine].lim = 2;
      }
   }
   if(lines["line" + line.prevLine].nextLine == line.name)
   {
      lines["line" + line.prevLine].nextLine = undefined;
      switch(lines["line" + line.prevLine].lim)
      {
         case 2:
            lines["line" + line.prevLine].lim = 0;
            break;
         case 3:
            lines["line" + line.prevLine].lim = 1;
      }
   }
   delete lines["line" + line.name];
   false;
   if(Lines == 0)
   {
      undoList = [];
      switchToVersion(VERSION);
   }
}
function clearFloor()
{
   startLine = undefined;
   for(var _loc1_ in lines)
   {
      removeLine(lines[_loc1_]);
   }
}
function checkAngles(line1, line2)
{
   var _loc4_ = Math.acos((line1.dx * line2.dx + line1.dy * line2.dy) / (line1.dst * line2.dst));
   var _loc1_ = line1.dx * line2.dy - line2.dx * line1.dy > 0;
   var _loc6_ = undefined;
   var _loc5_ = undefined;
   if(line1.inv)
   {
      if(line1.inv == line2.inv)
      {
         _loc6_ = !_loc1_ ? true : _loc4_ < 1.5707963267948966;
         _loc5_ = !_loc1_;
      }
      else
      {
         _loc6_ = !_loc1_ ? _loc4_ > 1.5707963267948966 : true;
         _loc5_ = _loc1_;
      }
   }
   else if(line1.inv == line2.inv)
   {
      _loc6_ = !_loc1_ ? _loc4_ < 1.5707963267948966 : true;
      _loc5_ = _loc1_;
   }
   else
   {
      _loc6_ = !_loc1_ ? true : _loc4_ > 1.5707963267948966;
      _loc5_ = !_loc1_;
   }
   return [_loc6_,_loc5_,_loc4_];
}
function drawPencil()
{
   tla._xscale = tla._yscale = bufScale;
   onMouseDown = function()
   {
      tempLine.valid = false;
      if(active2)
      {
         if(cursor._currentframe == 2)
         {
            pan();
         }
         else
         {
            drawing = true;
            prevLine = undefined;
            snaped = false;
            tempLine.inv = Key.isDown(16);
            tempLine.x1 = tla._xmouse;
            tempLine.y1 = tla._ymouse;
            var _loc1_ = snap(tempLine.x1,tempLine.y1,1,tempLine.inv);
            if(_loc1_[2] != false)
            {
               var _loc4_ = _loc1_[2] != 2 ? 1 : -1;
               tempLine.x1 = _loc1_[0];
               tempLine.y1 = _loc1_[1];
               prevLine = _loc1_[3];
               snaped = _loc1_[2];
            }
            onMouseMove = function()
            {
               if(active && active2 && cursor._currentframe != 2)
               {
                  tempLine.x2 = tla._xmouse;
                  tempLine.y2 = tla._ymouse;
                  tempLine.dx = tempLine.x2 - tempLine.x1;
                  tempLine.dy = tempLine.y2 - tempLine.y1;
                  tempLine.dst = Math.sqrt(Math.pow(tempLine.dx,2) + Math.pow(tempLine.dy,2));
                  var _loc2_ = 1 / (tla._xscale * 0.01);
                  if(prevLine != undefined && pencilMode != 2)
                  {
                     checks = checkAngles(tempLine,prevLine);
                     tempLine.valid = tempLine.dst > MIN_LENGTH * _loc2_ && checks[0] && checks[2] > MIN_ANGLE && tempLine.dst < MAX_LENGTH;
                  }
                  else
                  {
                     tempLine.valid = tempLine.dst > MIN_LENGTH * _loc2_ && tempLine.dst < MAX_LENGTH;
                  }
                  if(tempLine.valid && _xmouse < Stage.width && _xmouse > 0 && _ymouse < Stage.height && _ymouse > 0)
                  {
                     tempLine.valid = false;
                     switch(pencilMode)
                     {
                        case 0:
                           var _loc1_ = new Floor(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
                           break;
                        case 1:
                           _loc1_ = new FloorAcc(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
                           break;
                        case 2:
                           _loc1_ = new FloorScenery(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2);
                     }
                     addLine(_loc1_);
                     if(pencilMode != 2)
                     {
                        if(prevLine != undefined)
                        {
                           if(snaped == 1)
                           {
                              prevLine.addPrevLine(_loc1_,checks[1]);
                           }
                           else
                           {
                              prevLine.addNextLine(_loc1_,checks[1]);
                           }
                           _loc1_.addPrevLine(prevLine,checks[1]);
                        }
                        prevLine = _loc1_;
                     }
                     tempLine.x1 = tla._xmouse;
                     tempLine.y1 = tla._ymouse;
                     tla.clear();
                  }
                  else
                  {
                     tla.clear();
                     tla.lineStyle(1,16711680,100);
                     tla.moveTo(tempLine.x1,tempLine.y1);
                     tla.lineTo(tempLine.x2,tempLine.y2);
                  }
               }
            };
         }
      }
   };
   onMouseUp = function()
   {
      stopDrag();
      canvasX = tla._x;
      canvasY = tla._y;
      tla.clear();
      drawing = false;
      onMouseMove = function()
      {
      };
      pointToStartPoint();
      if(active2 && tempLine.valid && cursor._currentframe != 2)
      {
         nextLine = undefined;
         var _loc2_ = snap(tempLine.x2,tempLine.y2,2,tempLine.inv);
         if(_loc2_[2])
         {
            checks2 = checkAngles(_loc2_[3],tempLine);
            if(checks2[0])
            {
               tempLine.x2 = _loc2_[0];
               tempLine.y2 = _loc2_[1];
               nextLine = _loc2_[3];
            }
         }
         switch(pencilMode)
         {
            case 0:
               var _loc1_ = new Floor(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 1:
               _loc1_ = new FloorAcc(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 2:
               _loc1_ = new FloorScenery(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2);
         }
         addLine(_loc1_);
         if(pencilMode != 2)
         {
            if(prevLine != undefined)
            {
               if(snaped == 1)
               {
                  prevLine.addPrevLine(_loc1_,checks[1]);
               }
               else
               {
                  prevLine.addNextLine(_loc1_,checks[1]);
               }
               _loc1_.addPrevLine(prevLine,checks[1]);
            }
            if(nextLine != undefined)
            {
               if(_loc2_[2] == 1)
               {
                  nextLine.addPrevLine(_loc1_,checks2[1]);
               }
               else
               {
                  nextLine.addNextLine(_loc1_,checks2[1]);
               }
               _loc1_.addNextLine(nextLine,checks2[1]);
            }
         }
      }
   };
   onEnterFrame = function()
   {
   };
}
function drawLine()
{
   tla._xscale = tla._yscale = bufScale;
   onMouseDown = function()
   {
      tempLine.valid = false;
      if(active2)
      {
         if(cursor._currentframe == 2)
         {
            pan();
         }
         else
         {
            drawing = true;
            prevLine = undefined;
            snaped = false;
            tempLine.inv = Key.isDown(16);
            tempLine.x1 = tla._xmouse;
            tempLine.y1 = tla._ymouse;
            tempLine.valid = false;
            var _loc1_ = snap(tempLine.x1,tempLine.y1,1,tempLine.inv);
            if(_loc1_[2] != false)
            {
               var _loc3_ = _loc1_[2] != 2 ? 1 : -1;
               tempLine.x1 = _loc1_[0];
               tempLine.y1 = _loc1_[1];
               prevLine = _loc1_[3];
               snaped = _loc1_[2];
            }
            onMouseMove = function()
            {
               tempLine.x2 = tla._xmouse;
               tempLine.y2 = tla._ymouse;
               tempLine.dx = tempLine.x2 - tempLine.x1;
               tempLine.dy = tempLine.y2 - tempLine.y1;
               tempLine.dst = Math.sqrt(Math.pow(tempLine.dx,2) + Math.pow(tempLine.dy,2));
               var _loc1_ = 1 / (tla._xscale * 0.01);
               if(prevLine != undefined && pencilMode != 2)
               {
                  checks = checkAngles(tempLine,prevLine);
                  tempLine.valid = tempLine.dst > MIN_LENGTH * _loc1_ && checks[0] && tempLine.dst < MAX_LENGTH;
               }
               else
               {
                  tempLine.valid = tempLine.dst > MIN_LENGTH * _loc1_ && tempLine.dst < MAX_LENGTH;
               }
               if(tempLine.valid && _xmouse < Stage.width && _xmouse > 0 && _ymouse < Stage.height && _ymouse > 0 && cursor._currentframe != 2)
               {
                  tla.clear();
                  tla.lineStyle(1,7829367,100);
                  tla.moveTo(tempLine.x1,tempLine.y1);
                  tla.lineTo(tempLine.x2,tempLine.y2);
               }
               else
               {
                  tla.clear();
                  tla.lineStyle(1,16711680,100);
                  tla.moveTo(tempLine.x1,tempLine.y1);
                  tla.lineTo(tempLine.x2,tempLine.y2);
               }
            };
         }
      }
   };
   onMouseUp = function()
   {
      stopDrag();
      canvasX = tla._x;
      canvasY = tla._y;
      tla.clear();
      onMouseMove = function()
      {
      };
      drawing = false;
      pointToStartPoint();
      if(active2 && tempLine.valid && cursor._currentframe != 2)
      {
         nextLine = undefined;
         var _loc2_ = snap(tempLine.x2,tempLine.y2,2,tempLine.inv);
         if(_loc2_[2])
         {
            checks2 = checkAngles(_loc2_[3],tempLine);
            if(checks2[0])
            {
               tempLine.x2 = _loc2_[0];
               tempLine.y2 = _loc2_[1];
               nextLine = _loc2_[3];
            }
         }
         switch(pencilMode)
         {
            case 0:
               var _loc1_ = new Floor(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 1:
               _loc1_ = new FloorAcc(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2,tempLine.inv);
               break;
            case 2:
               _loc1_ = new FloorScenery(tempLine.x1,tempLine.y1,tempLine.x2,tempLine.y2);
         }
         addLine(_loc1_);
         if(pencilMode != 2)
         {
            if(prevLine != undefined)
            {
               if(snaped == 1)
               {
                  prevLine.addPrevLine(_loc1_,checks[1]);
               }
               else
               {
                  prevLine.addNextLine(_loc1_,checks[1]);
               }
               _loc1_.addPrevLine(prevLine,checks[1]);
            }
            if(nextLine != undefined)
            {
               if(_loc2_[2] == 1)
               {
                  nextLine.addPrevLine(_loc1_,checks2[1]);
               }
               else
               {
                  nextLine.addNextLine(_loc1_,checks2[1]);
               }
               _loc1_.addNextLine(nextLine,checks2[1]);
            }
         }
      }
   };
   onEnterFrame = function()
   {
   };
   onMouseMove = function()
   {
   };
}
function simulate()
{
   if(!Key.isDown(17))
   {
      onMouseDown = function()
      {
      };
      onMouseUp = function()
      {
      };
   }
   bur = getTimer();
   onEnterFrame = function()
   {
      bur = getTimer();
      if(!slowMotion || bur - pre > 200)
      {
         pre = bur;
         verlet(dots);
         dots2[1].x += Math.random() * 0.3 * (- Math.min(dots[5].dx,125));
         dots2[1].y += Math.random() * 0.3 * (- Math.min(dots[5].dy,125));
         verlet(dots2);
         satisfyConstraints();
         render();
         if(saveNow)
         {
            save();
            if(Key.isDown(67))
            {
               tla.flag._visible = false;
               tla.dummy._visible = true;
               tla.dummy.sankac._x = world.sankac._x;
               tla.dummy.sankac._y = world.sankac._y;
               tla.dummy.sankac._rotation = world.sankac._rotation;
               tla.dummy.roka1._x = world.roka1._x;
               tla.dummy.roka1._y = world.roka1._y;
               tla.dummy.roka1._rotation = world.roka1._rotation;
               tla.dummy.roka2._x = world.roka2._x;
               tla.dummy.roka2._y = world.roka2._y;
               tla.dummy.roka2._rotation = world.roka2._rotation;
               tla.dummy.noga1._x = world.noga1._x;
               tla.dummy.noga1._y = world.noga1._y;
               tla.dummy.noga1._rotation = world.noga1._rotation;
               tla.dummy.noga2._x = world.noga2._x;
               tla.dummy.noga2._y = world.noga2._y;
               tla.dummy.noga2._rotation = world.noga2._rotation;
               tla.dummy.sanke._x = world.sanke._x;
               tla.dummy.sanke._y = world.sanke._y;
               tla.dummy.sanke._rotation = world.sanke._rotation;
               tla.dummy.sanke._yscale = world.sanke._yscale;
               tla.dummy.sanke.gotoAndStop(world.sanke._currentframe);
               tla.dummy.sankac.face.gotoAndStop(world.sankac.face._currentframe);
            }
            else
            {
               tla.dummy._visible = false;
               tla.flag._visible = true;
               if(BindStick.crash)
               {
                  tla.flag._x = dots[4].x;
                  tla.flag._y = dots[4].y;
               }
               else
               {
                  tla.flag._x = dots[1].x;
                  tla.flag._y = dots[1].y;
               }
            }
            saveNow = false;
            riding = BindStick.crash;
            sledState = world.sanke._currentframe;
            faceState = sankac.face._currentframe;
         }
      }
      frameCounter++;
   };
   onMouseMove = function()
   {
   };
}
function nothing()
{
   onMouseDown = function()
   {
   };
   onMouseMove = function()
   {
   };
   onMouseUp = function()
   {
   };
   onEnterFrame = function()
   {
   };
}
function gridPos(x, y)
{
   ggridPos = new Object();
   ggridPos.x = Math.floor(x / GRIDSIZE);
   ggridPos.y = Math.floor(y / GRIDSIZE);
   ggridPos.gx = x - GRIDSIZE * ggridPos.x;
   ggridPos.gy = y - GRIDSIZE * ggridPos.y;
   return ggridPos;
}
function register(line, x, y)
{
   var _loc1_ = "x" + x;
   var _loc2_ = "y" + y;
   var _loc4_ = new Object();
   _loc4_.storage = [];
   _loc4_.storage2 = [];
   if(grid[_loc1_] == undefined)
   {
      grid[_loc1_] = [];
   }
   if(grid[_loc1_][_loc2_] == undefined)
   {
      grid[_loc1_][_loc2_] = _loc4_;
   }
   line.grids.push([x,y]);
   if(line.type != 2)
   {
      grid[_loc1_][_loc2_].storage[line.name] = line;
   }
   grid[_loc1_][_loc2_].storage2[line.name] = line;
}
function removeFromGrid(line)
{
   var _loc1_ = 0;
   while(_loc1_ < line.grids.length)
   {
      delete grid["x" + line.grids[_loc1_][0]]["y" + line.grids[_loc1_][1]].storage[line.name];
      delete grid["x" + line.grids[_loc1_][0]]["y" + line.grids[_loc1_][1]].storage2[line.name];
      _loc1_ = _loc1_ + 1;
   }
}
function lineBoxCheck(line, box)
{
   var _loc7_ = line.x - box.x;
   var _loc6_ = line.y - box.y;
   var _loc4_ = Math.abs(line.nx);
   var _loc3_ = Math.abs(line.ny);
   var _loc9_ = (_loc4_ * box.hx + box.hy * _loc3_) * _loc4_ + (_loc4_ * box.hx + _loc3_ * box.hy) * _loc3_;
   var _loc5_ = line.nx * _loc7_ + line.ny * _loc6_;
   var _loc8_ = Math.abs(_loc5_ * line.nx) + Math.abs(_loc5_ * line.ny);
   
   if(line.hx + box.hx < Math.abs(_loc7_))
   {
      return false;
   }
   if(line.hy + box.hy < Math.abs(_loc6_))
   {
      return false;
   }
   if(_loc9_ < _loc8_)
   {
      return false;
   }
   return true;
}
function verlet(dots)
{
   var _loc1_ = 0;
   while(_loc1_ < dots.length)
   {
      dots[_loc1_].verlet(a);
      _loc1_ = _loc1_ + 1;
   }
}
function renderLine(line)
{
   var _loc2_ = line.parent;
   _loc2_.clear();
   var _loc4_ = line.nx <= 0 ? Math.floor(line.nx) : Math.ceil(line.nx);
   var _loc3_ = line.ny <= 0 ? Math.floor(line.ny) : Math.ceil(line.ny);
   switch(line.type)
   {
      case 0:
         _loc2_.lineStyle(4 * SCALEDOWN,26367,100,true,"normal","round");
         _loc2_.moveTo(line.x1 + _loc4_,line.y1 + _loc3_);
         _loc2_.lineTo(line.x2 + _loc4_,line.y2 + _loc3_);
         _loc2_.lineStyle(4 * SCALEDOWN,0,100,true,"normal","round");
         _loc2_.moveTo(line.x1,line.y1);
         _loc2_.lineTo(line.x2,line.y2);
         break;
      case 1:
         _loc2_.lineStyle(5 * SCALEDOWN,13369344,100,true,"normal","none","miter");
         _loc2_.moveTo(line.x1 + _loc4_,line.y1 + _loc3_);
         _loc2_.lineTo(line.x2 + _loc4_,line.y2 + _loc3_);
         _loc2_.moveTo(line.x2,line.y2);
         _loc2_.lineTo(line.x2 + (line.nx * 4 - line.dx * line.invDst * 5),line.y2 + (line.ny * 4 - line.dy * line.invDst * 5));
         _loc2_.lineTo(line.x2 - line.dx * line.invDst * 5,line.y2 - line.dy * line.invDst * 5);
         _loc2_.lineStyle(4 * SCALEDOWN,0,100,true,"normal","round");
         _loc2_.moveTo(line.x1,line.y1);
         _loc2_.lineTo(line.x2,line.y2);
         break;
      case 2:
         _loc2_.lineStyle(4 * SCALEDOWN,52224,100,true,"normal","round");
         _loc2_.moveTo(line.x1,line.y1);
         _loc2_.lineTo(line.x2,line.y2);
   }
   _loc2_.cacheAsBitmap = true;
}
function render()
{
   if(Key.isDown(88))
   {
      var _loc3_ = tla._xscale;
      var _loc1_ = Math.max(_loc3_ * 0.9,20);
      world._xscale = world._yscale = tla._xscale = tla._yscale = _loc1_;
      world._x = tla._x = Stage.width * 0.5 + (tla._x - Stage.width * 0.5) * (_loc1_ / _loc3_);
      world._y = tla._y = Stage.height * 0.5 + (tla._y - Stage.height * 0.5) * (_loc1_ / _loc3_);
   }
   if(Key.isDown(90))
   {
      _loc3_ = tla._xscale;
      _loc1_ = Math.min(_loc3_ * 1.1,300);
      world._xscale = world._yscale = tla._xscale = tla._yscale = _loc1_;
      world._x = tla._x = Stage.width * 0.5 + (tla._x - Stage.width * 0.5) * (_loc1_ / _loc3_);
      world._y = tla._y = Stage.height * 0.5 + (tla._y - Stage.height * 0.5) * (_loc1_ / _loc3_);
   }
   point1.x = dots[0].x;
   point1.y = dots[0].y;
   world.localToGlobal(point1);
   point2.x = dots[4].x;
   point2.y = dots[4].y;
   world.localToGlobal(point2);
   point3.x = dots[5].x;
   point3.y = dots[5].y;
   world.localToGlobal(point3);
   if(point2.x > barrierR)
   {
      var _loc5_ = barrierR - point2.x;
   }
   else if(point2.x < barrierL)
   {
      _loc5_ = barrierL - point2.x;
   }
   else
   {
      _loc5_ = 0;
   }
   if(point2.y > barrierB)
   {
      offsety = barrierB - point2.y;
   }
   else if(point2.y < barrierT)
   {
      offsety = barrierT - point2.y;
   }
   else
   {
      var offsety = 0;
   }
   tla._x = world._x += _loc5_;
   tla._y = world._y += offsety;
   world.clear();
   world.lineStyle(1 * SCALEDOWN,0,100);
   if(!BindStick.crash)
   {
      world.lineStyle(1 * SCALEDOWN,0,100);
      edges[17].render(world);
      edges[18].render(world);
   }
   else if(world.sankac.face._currentframe != 14)
   {
      world.sankac.face.play();
   }
   world.lineStyle(4 * SCALEDOWN * tla._xscale / 100,16777215,100,false,"none","none");
   edges2[0].render(world);
   edges2[2].render(world);
   edges2[4].render(world);
   world.lineStyle(4 * SCALEDOWN * tla._xscale / 100,13763074,100,false,"none","none");
   edges2[1].render(world);
   edges2[3].render(world);
   edges2[5].render(world);
   world.sanke._x = dots[0].x;
   world.sanke._y = dots[0].y;
   world.sankac._x = dots[4].x;
   world.sankac._y = dots[4].y;
   world.roka1._x = world.roka2._x = dots[5].x;
   world.roka1._y = world.roka2._y = dots[5].y;
   world.noga1._x = world.noga2._x = dots[4].x;
   world.noga1._y = world.noga2._y = dots[4].y;
   var _loc4_ = dots[3].x - dots[0].x;
   var _loc2_ = dots[3].y - dots[0].y;
   if(_loc4_ * (dots[1].y - dots[0].y) - _loc2_ * (dots[1].x - dots[0].x) < 0)
   {
      BindStick.crash = true;
      if(world.sanke._yscale != (- SCALEDOWN) * 100)

      {
         world.sanke._yscale = (- SCALEDOWN) * 100;
         world.sanke.gotoAndStop(2);
      }
   }
   else if(world.sanke._yscale != SCALEDOWN * 100)
   {
      world.sanke._yscale = SCALEDOWN * 100;
   }
   if(_loc4_ * (dots[5].y - dots[4].y) - _loc2_ * (dots[5].x - dots[4].x) > 0)
   {
      BindStick.crash = true;
   }
   world.sanke._rotation = Math.atan2(_loc2_,_loc4_) * TO_DEG;
   world.sankac._rotation = Math.atan2(dots[5].y - dots[4].y,dots[5].x - dots[4].x) * TO_DEG;
   world.noga1._rotation = Math.atan2(dots[8].y - dots[4].y,dots[8].x - dots[4].x) * TO_DEG;
   world.roka1._rotation = Math.atan2(dots[7].y - dots[5].y,dots[7].x - dots[5].x) * TO_DEG;
   world.noga2._rotation = Math.atan2(dots[9].y - dots[4].y,dots[9].x - dots[4].x) * TO_DEG;
   world.roka2._rotation = Math.atan2(dots[6].y - dots[5].y,dots[6].x - dots[5].x) * TO_DEG;
}
function satisfyConstraints()
{
   colided = false;
   var _loc1_ = 0;
   while(_loc1_ < ITERATE)
   {
      satisfyDistance(edges);
      satisfyBoundaries();
      _loc1_ = _loc1_ + 1;
   }
   satisfyDistance(edges2);
}
function satisfyBoundaries()
{
   var _loc7_ = 0;
   while(_loc7_ < dots.length)
   {
      var _loc5_ = dots[_loc7_];
      var _loc6_ = gridPos(_loc5_.x,_loc5_.y);
      var _loc4_ = -1;
      while(_loc4_ < 2)
      {
         var _loc2_ = "x" + (_loc6_.x + _loc4_);
         if(grid[_loc2_] != undefined)
         {
            var _loc3_ = -1;
            while(_loc3_ < 2)
            {
               var _loc1_ = "y" + (_loc6_.y + _loc3_);
               if(grid[_loc2_][_loc1_] != undefined)
               {
                  for(var _loc8_ in grid[_loc2_][_loc1_].storage2)
                  {
                     if(grid[_loc2_][_loc1_].storage[_loc8_].colide(_loc5_))
                     {
                        colided = true;
                     }
                  }
               }
               _loc3_ = _loc3_ + 1;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc7_ = _loc7_ + 1;
   }
}
function satisfyDistance(edges)
{
   var _loc1_ = 0;
   while(_loc1_ < edges.length)
   {
      if(!edges[_loc1_].satisfyDistance())
      {
      }
      _loc1_ = _loc1_ + 1;
   }
}
function cleanUp()
{
   var _loc1_ = 0;
   while(_loc1_ < edges.length)
   {
      delete edges.register1;
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < dots.length)
   {
      delete dots.register1;
      _loc1_ = _loc1_ + 1;
   }
}
function framerate()
{
   steuc.text = frameCounter + " fps";
   frameCounter = 0;
}
function moveToStartPos()
{
   var _loc1_ = 0;
   while(_loc1_ < dots.length)
   {
      dots[_loc1_].x += tla.startPoint._x;
      dots[_loc1_].y += tla.startPoint._y;
      dots[_loc1_].vx = dots[_loc1_].x - 0.8 * SCALEDOWN;
      dots[_loc1_].vy = dots[_loc1_].y;
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < dots2.length)
   {
      dots2[_loc1_].x += tla.startPoint._x;
      dots2[_loc1_].y += tla.startPoint._y;
      dots2[_loc1_].vx = dots2[_loc1_].x - 0.8 * SCALEDOWN;
      dots2[_loc1_].vy = dots2[_loc1_].y;
      _loc1_ = _loc1_ + 1;
   }
}
function switchToVersion(ver)
{
   switch(ver)
   {
      case "6":
         compatible = "6";
         MAX_LENGTH = 2000;
         trace("version 6 mode");
         registerInGrid = function(line)
         {
            var _loc7_ = gridPos(line.x1,line.y1);
            var _loc8_ = gridPos(line.x2,line.y2);
            var _loc6_ = Math.min(_loc7_.x,_loc8_.x);
            while(_loc6_ <= Math.max(_loc8_.x,_loc7_.x))
            {
               var _loc4_ = Math.min(_loc7_.y,_loc8_.y);
               while(_loc4_ <= Math.max(_loc8_.y,_loc7_.y))
               {
                  var _loc1_ = new Object();
                  _loc1_.storage = [];
                  _loc1_.storage2 = [];
                  _loc1_.x = _loc6_ * GRIDSIZE + GRIDSIZE * 0.5;
                  _loc1_.y = _loc4_ * GRIDSIZE + GRIDSIZE * 0.5;
                  _loc1_.hx = _loc1_.hy = GRIDSIZE * 0.5;
                  burek = lineBoxCheck(line,_loc1_);
                  if(burek)
                  {
                     var _loc2_ = "x" + _loc6_;
                     var _loc5_ = "y" + _loc4_;
                     if(grid[_loc2_] == undefined)
                     {
                        grid[_loc2_] = [];
                     }
                     if(grid[_loc2_][_loc5_] == undefined)
                     {
                        grid[_loc2_][_loc5_] = _loc1_;
                     }
                     line.grids.push([_loc6_,_loc4_]);
                     if(line.type != 2)
                     {
                        grid[_loc2_][_loc5_].storage[line.name] = line;
                     }
                     grid[_loc2_][_loc5_].storage2[line.name] = line;
                  }
                  _loc4_ = _loc4_ + 1;
               }
               _loc6_ = _loc6_ + 1;
            }
         };
         break;
      case "6.1":
         compatible = "6.1";
         MAX_LENGTH = 2000;
         trace("version 6.1 mode");
         registerInGrid = function(line)
         {
            var _loc1_ = gridPos(line.x1,line.y1);
            var _loc10_ = gridPos(line.x2,line.y2);
            var _loc12_ = line.dx <= 0 ? _loc1_.x : _loc10_.x;
            var _loc15_ = line.dx <= 0 ? _loc10_.x : _loc1_.x;
            var _loc11_ = line.dy <= 0 ? _loc1_.y : _loc10_.y;
            var _loc14_ = line.dy <= 0 ? _loc10_.y : _loc1_.y;
            if(line.dx == 0 && line.dy == 0 || _loc1_.x == _loc10_.x && _loc1_.y == _loc10_.y)
            {
               register(line,_loc1_.x,_loc1_.y);
               return undefined;
            }
            register(line,_loc1_.x,_loc1_.y);
            var _loc5_ = line.x1;
            var _loc2_ = line.y1;
            if(line.dx != 0 && line.dy != 0)
            {
               var _loc9_ = line.dy / line.dx;
               var _loc13_ = 1 / _loc9_;
               var _loc8_ = line.y1 - _loc9_ * line.x1;
            }
            while(true)
            {
               var _loc6_ = line.dx <= 0 ? - _loc1_.gx + 1 : GRIDSIZE - _loc1_.gx;
               var _loc4_ = line.dy <= 0 ? - _loc1_.gy + 1 : GRIDSIZE - _loc1_.gy;
               if(line.dx == 0)
               {
                  _loc2_ += _loc4_;
               }
               else if(line.dy == 0)
               {
                  _loc5_ += _loc6_;
               }
               else
               {
                  var _loc7_ = Math.round(_loc9_ * (_loc5_ + _loc6_) + _loc8_);
                  if(Math.abs(_loc7_ - _loc2_) < Math.abs(_loc4_))
                  {
                     _loc5_ += _loc6_;
                     _loc2_ = _loc7_;
                  }
                  else if(Math.abs(_loc7_ - _loc2_) == Math.abs(_loc4_))
                  {
                     _loc5_ += _loc6_;
                     _loc2_ += _loc4_;
                  }
                  else
                  {
                     _loc5_ = Math.round((_loc2_ + _loc4_ - _loc8_) * _loc13_);
                     _loc2_ += _loc4_;
                  }
               }
               _loc1_ = gridPos(_loc5_,_loc2_);
               if(!(_loc1_.x >= _loc15_ && _loc1_.x <= _loc12_ && _loc1_.y >= _loc14_ && _loc1_.y <= _loc11_))
               {
                  break;
               }
               register(line,_loc1_.x,_loc1_.y);
            }
            return undefined;
         };
         break;
      case "6.2":
         compatible = "6.2";
         MAX_LENGTH = 2000;
         trace("version 6.2 mode");
         registerInGrid = function(line)
         {
            var _loc1_ = gridPos(line.x1,line.y1);
            var _loc7_ = gridPos(line.x2,line.y2);
            var _loc11_ = line.dx <= 0 ? _loc1_.x : _loc7_.x;
            var _loc13_ = line.dx <= 0 ? _loc7_.x : _loc1_.x;
            var _loc10_ = line.dy <= 0 ? _loc1_.y : _loc7_.y;
            var _loc12_ = line.dy <= 0 ? _loc7_.y : _loc1_.y;
            if(line.dx == 0 && line.dy == 0 || _loc1_.x == _loc7_.x && _loc1_.y == _loc7_.y)
            {
               register(line,_loc1_.x,_loc1_.y);
               return undefined;
            }
            register(line,_loc1_.x,_loc1_.y);
            var _loc5_ = line.x1;
            var _loc4_ = line.y1;
            var _loc9_ = 1 / line.dx;
            var _loc8_ = 1 / line.dy;
			
            while(true)
            {
               var _loc3_ = undefined;
               if(_loc1_.x < 0)
               {
                  difX = line.dx <= 0 ? - GRIDSIZE - _loc1_.gx : GRIDSIZE + _loc1_.gx;
               }
               else
               {
                  difX = line.dx <= 0 ? - _loc1_.gx + 1 : GRIDSIZE - _loc1_.gx;
               }
               if(_loc1_.y < 0)
               {
                  _loc3_ = line.dy <= 0 ? - GRIDSIZE - _loc1_.gy : GRIDSIZE + _loc1_.gy;
               }
               else
               {
                  _loc3_ = line.dy <= 0 ? - _loc1_.gy + 1 : GRIDSIZE - _loc1_.gy;
               }
               if(line.dx == 0)
               {
                  _loc4_ += _loc3_;
               }
               else if(line.dy == 0)
               {
                  _loc5_ += difX;
               }
               else
               {
                  var _loc6_ = _loc4_ + line.dy * difX * _loc9_;
                  if(Math.abs(_loc6_ - _loc4_) < Math.abs(_loc3_))
                  {
                     _loc5_ += difX;
                     _loc4_ = _loc6_;
                  }
                  else if(Math.abs(_loc6_ - _loc4_) == Math.abs(_loc3_))
                  {
                     _loc5_ += difX;
                     _loc4_ += _loc3_;
                  }
                  else
                  {
                     _loc5_ += line.dx * _loc3_ * _loc8_;
                     _loc4_ += _loc3_;
                  }
               }
               _loc1_ = gridPos(_loc5_,_loc4_);
               if(!(_loc1_.x >= _loc13_ && _loc1_.x <= _loc11_ && _loc1_.y >= _loc12_ && _loc1_.y <= _loc10_))
               {
                  break;
               }
               register(line,_loc1_.x,_loc1_.y);
            }
            return undefined;
         };
   }
}
stop();
Stage.align = "TL";
barrierR = Stage.width * 0.61803;
barrierL = Stage.width * 0.38197000000000003;
barrierT = Stage.height * 0.38197000000000003;
barrierB = Stage.height * 0.61803;
resize = new Object();
navodila._x = Stage.width * 0.5;
navodila._y = Stage.height * 0.5;
navodila.cover._width = Stage.width;
navodila.cover._height = Stage.height;
navodila.cover._x = (- Stage.width) * 0.5;
navodila.cover._y = (- Stage.height) * 0.5;
compas.distance.autoSize = "left";
resize.onResize = function()
{
   helpscreen.icons._x = helpscreen.texts._x = panel._x = Stage.width * 0.5;
   steuc._width = Stage.width - (panel._x + panel._width * 0.5) - 25;
   steuc._x = Math.max(Stage.width - steuc._width - 15,panel._x + panel._width * 0.5);
   barrierR = Stage.width * 0.61803;
   barrierL = Stage.width * 0.38197000000000003;
   barrierT = Stage.height * 0.38197000000000003;
   barrierB = Stage.height * 0.61803;
   navodila._x = Stage.width * 0.5;
   navodila._y = Stage.height * 0.5;
   navodila.cover._width = Stage.width;
   navodila.cover._height = Stage.height;
   navodila.cover._x = (- Stage.width) * 0.5;
   navodila.cover._y = (- Stage.height) * 0.5;
   helpscreen.back._y = help._y = Stage.height - 24;
   compas._y = Stage.height - 14;
   compas._x = Stage.width * 0.5;
   helpscreen.icons._x = Stage.width * 0.5;
   helpscreen.background._width = Stage.width;
   helpscreen.background._height = Stage.height;
};
resize.onResize();
Stage.addListener(resize);
var edges;
var edges2;
var dots;
var dots2;
var ITERATE = 6;
var SCALEDOWN = 0.5;
var INVSCALE = 200;
var ENDURANCE = 0.057;
var BLINK_RATE = 0.42857142857142855;
var AIR_FRICTION = 0.9;
var SNAP_DISTANCE = 14;
var ERASER_SIZE = 5;
var MAX_LENGTH = 10000;
var MIN_LENGTH = 10;
var MIN_ANGLE = 0.03;
var GRIDSIZE = 14;
var TO_DEG = 57.29577951308232;
var simulation = false;
var frameCounter = 0;
var canvasX = 0;
var canvasY = 0;
var bufScale = 100;
var a = {x:0,y:0.35 * SCALEDOWN};
var colided;
var active = true;
var active2 = true;
var point1 = new Object();
var point2 = new Object();
var point3 = new Object();
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
Key.addListener(this);
BindStick.crash = false;
FloorBase.zone = 20 * SCALEDOWN;
world.sanke._xscale = world.sanke._yscale = world.sankac._xscale = world.sankac._yscale = world.roka1._xscale = world.roka1._yscale = world.roka2._xscale = world.roka2._yscale = world.noga1._xscale = world.noga1._yscale = world.noga2._xscale = world.noga2._yscale = SCALEDOWN * 100;
tla.dummy.sanke._xscale = tla.dummy.sanke._yscale = tla.dummy.sankac._xscale = tla.dummy.sankac._yscale = tla.dummy.roka1._xscale = tla.dummy.roka1._yscale = tla.dummy.roka2._xscale = tla.dummy.roka2._yscale = tla.dummy.noga1._xscale = tla.dummy.noga1._yscale = tla.dummy.noga2._xscale = tla.dummy.noga2._yscale = SCALEDOWN * 100;
tla.dummy._visible = false;
tla.flag._visible = false;
tla.startPoint.help._visible = false;
kakica.focusEnabled = true;
var savedTracks = SharedObject.getLocal("savedLines","/");
if(savedTracks.data.trackList == undefined)
{
   savedTracks.data.trackList = [];
}
panel.fileDialog.savedTracks.dataProvider = savedTracks.data.trackList;
panel.fileDialog.savedTracks.defaultIcon = "rev6";
panel.fileDialog.savedTracks.iconFunction = function(item)
{
   var _loc1_ = item.version;
   switch(_loc1_)
   {
      case "6.1":
         return "rev6.1";
      case "6.2":
         return "rev6.2";
      default:
         return "rev6";
   }
};
panel.fileDialog._visible = false;
panel.confirmDialog._visible = false;
helpscreen._visible = false;
helpscreen.Continue.onPress = function()
{
   helpscreen._visible = false;
   cursorImage(lastTool);
};
var mouseListener = new Object();
mouseListener.onMouseWheel = function(delta)
{
   if(simulation == false && cursorMode == "zoom")
   {
      var _loc1_ = tla._xscale;
      var _loc2_ = Math.min(Math.max(_loc1_ + _loc1_ * 0.04 * delta,5),300);
      tla._x = Stage.width * 0.5 + (canvasX - Stage.width * 0.5) * (_loc2_ / _loc1_);
      tla._y = Stage.height * 0.5 + (canvasY - Stage.height * 0.5) * (_loc2_ / _loc1_);
      tla._xscale = tla._yscale = _loc2_;
      bufScale = tla._xscale;
      canvasX = tla._x;
      canvasY = tla._y;
   }
};
Mouse.addListener(mouseListener);
cursor.onMouseMove = function()
{
   cursor._x = _xmouse;
   cursor._y = _ymouse;
};
cursorImage = function(Mode)
{
   switch(Mode)
   {
      case "pencil":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(1);
         cursorMode = Mode;
         break;
      case "hand":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(2);
         cursorMode = Mode;
         break;
      case "eraser":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(3);
         cursorMode = Mode;
         break;
      case "zoom":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(4);
         cursorMode = Mode;
         break;
      case "normal":
         Mouse.show();
         cursor._visible = false;
         cursorMode = Mode;
         break;
      case "line":
         Mouse.hide();
         cursor._visible = true;
         cursor.gotoAndStop(5);
         cursorMode = Mode;
   }
};
panelMode = function(Mode)
{
   if(Mode == "draw")
   {
      panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = true;
      panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 100;
      panel.flagB.gotoAndStop(2);
      active2 = true;
      compas._visible = true;
      tla.startPoint._visible = true;
   }
   else if(Mode == "simulate")
   {
      panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = false;
      panel.saveB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = true;
      panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = 30;
      panel.saveB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 100;
      panel.flagB.gotoAndStop(1);
      panel.swatches._visible = false;
      compas._visible = false;
      tla.startPoint._visible = false;
   }
   else if(Mode == "save")
   {
      panel.saveB.enabled = panel.lineB.enabled = panel.zoomB.enabled = panel.eraserB.enabled = panel.handB.enabled = panel.pencilB.enabled = panel.trashB.enabled = panel.playB.enabled = panel.stopB.enabled = panel.flagB.enabled = false;
      panel.saveB._alpha = panel.lineB._alpha = panel.zoomB._alpha = panel.eraserB._alpha = panel.handB._alpha = panel.pencilB._alpha = panel.trashB._alpha = panel.playB._alpha = panel.stopB._alpha = panel.flagB._alpha = 30;
      panel.flagB.gotoAndStop(1);
      panel.swatches._visible = false;
   }
};
panel.lineB.onRollOver = panel.swatches.green.onRollOver = panel.swatches.red.onRollOver = panel.swatches.blue.onRollOver = panel.zoomB.onRollOver = panel.eraserB.onRollOver = panel.flagB.onRollOver = panel.handB.onRollOver = panel.pencilB.onRollOver = panel.playB.onRollOver = panel.stopB.onRollOver = panel.saveB.onRollOver = panel.trashB.onRollOver = function()
{
   active2 = false;
   cursor._visible = false;
   Mouse.show();
};
panel.lineB.onRollOut = panel.swatches.blue.onRollOut = panel.swatches.red.onRollOut = panel.swatches.green.onRollOut = panel.zoomB.onRollOut = panel.eraserB.onRollOut = panel.flagB.onRollOut = panel.handB.onRollOut = panel.pencilB.onRollOut = panel.playB.onRollOut = panel.stopB.onRollOut = panel.saveB.onRollOut = panel.trashB.onRollOut = panel.lineB.onReleaseOutside = panel.swatches.blue.onReleaseOutside = panel.swatches.red.onReleaseOutside = panel.swatches.green.onReleaseOutside = panel.zoomB.onReleaseOutside = panel.eraserB.onReleaseOutside = panel.flagB.onReleaseOutside = panel.handB.onReleaseOutside = panel.pencilB.onReleaseOutside = panel.playB.onReleaseOutside = panel.stopB.onReleaseOutside = panel.saveB.onReleaseOutside = panel.trashB.onReleaseOutside = function()
{
   active2 = true;
   cursorImage(cursorMode);
};
tla.startPoint.onPress = function()
{
   if(Key.isDown(68))
   {
      if(Key.isDown(16))
      {
         var _loc1_ = getFirstLine();
         if(_loc1_ != undefined)
         {
            tla.startPoint._x = _loc1_.x1;
            tla.startPoint._y = _loc1_.y1 - 50 * SCALEDOWN;
            pointToStartPoint();
         }
      }
      else
      {
         startDrag(tla.startPoint,0);
         tla.startPoint.gotoAndStop(2);
         tla.startPoint.onMouseMove = function()
         {
            pointToStartPoint();
         };
      }
   }
};
tla.startPoint.onRelease = function()
{
   stopDrag();
   tla.startPoint.gotoAndStop(1);
   tla.startPoint.onMouseMove = function()
   {
   };
};
tla.startPoint.onRollOver = function()
{
   tla.startPoint.help._visible = true;
   active2 = false;
   cursor._visible = false;
   Mouse.show();
};
tla.startPoint.onRollOut = function()
{
   tla.startPoint.help._visible = false;
   active2 = true;
   cursorImage(cursorMode);
};
panel.handB.onPress = function()
{
   cursorMode = "hand";
   drawPencil();
   tla._x = canvasX;
   tla._y = canvasY;
   panel.swatches._visible = false;
   lastTool = "hand";
};
panel.swatches.blue.onPress = function()
{
   pencilMode = 0;
   cursor.pencil.gotoAndStop(1);
   panel.swatches.selected._x = 15;
};
panel.swatches.red.onPress = function()
{
   pencilMode = 1;
   cursor.pencil.gotoAndStop(2);
   panel.swatches.selected._x = 45;
};
panel.swatches.green.onPress = function()
{
   pencilMode = 2;
   cursor.pencil.gotoAndStop(3);
   panel.swatches.selected._x = 75;
};
panel.pencilB.onPress = function()
{
   cursorMode = "pencil";
   drawPencil();
   tla._x = canvasX;
   tla._y = canvasY;
   panel.swatches._visible = true;
   lastTool = "pencil";
};
panel.lineB.onPress = function()
{
   cursorMode = "line";
   drawLine();
   tla._x = canvasX;
   tla._y = canvasY;
   panel.swatches._visible = true;
   lastTool = "line";
};
panel.trashB.onPress = function()
{
   cursorImage("normal");
   switchToVersion(VERSION);
   panelMode("save");
   panel.confirmDialog._visible = true;
   panel.confirmDialog.text.text = "Are you sure you want to delete the track?";
   enableConfirmButtons();
   panel.confirmDialog.Yes.onRelease = function()
   {
      disableConfirmButtons();
      saved = false;
      tla.dummy._visible = false;
      tla.flag._visible = false;
      steuc.text = "0 lines";
      reset();
      panel.confirmDialog._visible = false;
      cursorImage(lastTool);
      panelMode("draw");
      panel[lastTool + "B"].onPress();
      undoList = [];
   };
   panel.confirmDialog.No.onRelease = function()
   {
      panel.confirmDialog._visible = false;
      cursorImage(lastTool);
      panelMode("draw");
      panel[lastTool + "B"].onPress();
      disableConfirmButtons();
   };
};
panel.zoomB.onPress = function()
{
   if(Key.isDown(16))
   {
      var _loc2_ = tla._xscale;
      var _loc1_ = 100;
      tla._xscale = tla._yscale = _loc1_;
      tla._x = Stage.width * 0.5 + (canvasX - Stage.width * 0.5) * (_loc1_ / _loc2_);
      tla._y = Stage.height * 0.5 + (canvasY - Stage.height * 0.5) * (_loc1_ / _loc2_);
   }
   cursorMode = "zoom";
   panel.swatches._visible = false;
   zoom();
   lastTool = "zoom";
};
panel.playB.onPress = function()
{
   if(Lines > 0)
   {
      clearInterval(framerateInterval);
      framerateInterval = setInterval(framerate,1000);
      var _loc5_ = cursorMode;
      slowMotion = false;
      cursorImage("normal");
      world.sankac.face.gotoAndStop(1);
      if(saved && !Key.isDown(65))
      {
         restore();
         if(!riding)
         {
            BindStick.crash = false;
            world.sanke.gotoAndStop(sledState);
            world.sankac.face.gotoAndStop(faceState);
         }
      }
      else
      {
         if(!saved)
         {
            cleanUp();
            init();
         }
         else
         {
            resetPosition();
            BindStick.crash = false;
            world.sanke.gotoAndStop(1);
         }
         moveToStartPos();
      }
      tla.clear();
      if(!simulation)
      {
         simulation = true;
         panelMode("simulate");
         for(var _loc2_ in lines)
         {
            var _loc1_ = lines[_loc2_];
            _loc1_.parent.clear();
            _loc1_.parent.lineStyle(4 * SCALEDOWN,0,100,false,"normal","round");
            _loc1_.parent.moveTo(_loc1_.x1,_loc1_.y1);
            _loc1_.parent.lineTo(_loc1_.x2,_loc1_.y2);
         }
      }
      if(!Key.isDown(16))
      {
         tla._xscale = tla._yscale = world._xscale = world._yscale = INVSCALE;
      }
      world._xscale = world._yscale = tla._yscale;
      world._visible = true;
      help._visible = false;
      if(Key.isDown(90))
      {
         var _loc4_ = tla._xscale;
         var _loc3_ = Math.max(_loc4_ * 0.9,20);
         world._xscale = world._yscale = tla._xscale = tla._yscale = _loc3_;
         world._x = tla._x = Stage.width * 0.5 + (tla._x - Stage.width * 0.5) * (_loc3_ / _loc4_);
         world._y = tla._y = Stage.height * 0.5 + (tla._y - Stage.height * 0.5) * (_loc3_ / _loc4_);
      }
      if(Key.isDown(88))
      {
         _loc4_ = tla._xscale;
         _loc3_ = Math.min(_loc4_ * 1.1,400);
         world._xscale = world._yscale = tla._xscale = tla._yscale = _loc3_;
         world._x = tla._x = Stage.width * 0.5 + (tla._x - Stage.width * 0.5) * (_loc3_ / _loc4_);
         world._y = tla._y = Stage.height * 0.5 + (tla._y - Stage.height * 0.5) * (_loc3_ / _loc4_);
      }
      render();
      simulate();
   }
};
panel.stopB.onPress = function()
{
   panel[lastTool + "B"].onPress();
   if(tla.flag._visible)
   {
      panel.flagB.flagUp.gotoAndStop(2);
   }
   world._visible = false;
   tla._x = canvasX;
   tla._y = canvasY;
   tla._xscale = tla._yscale = bufScale;
   simulation = false;
   for(var _loc1_ in lines)
   {
      renderLine(lines[_loc1_]);
   }
   clearInterval(framerateInterval);
   steuc.text = Lines + " lines";
   panelMode("draw");
   help._visible = true;
};
panel.saveB.onPress = function()
{
   panel.stopB.onPress();
   cursorImage("normal");
   active = false;
   active2 = false;
   panel.fileDialog._visible = true;
   enableFileButtons();
   panelMode("save");
   var ver = compatible;
   trace("save mode " + ver);
   panel.fileDialog.saveButton.onRelease = function()
   {
      if(Lines > 0)
      {
         active = true;
         var _loc6_ = new Array(Lines);
         var _loc3_ = 0;
         for(var _loc7_ in lines)
         {
            var _loc1_ = lines[_loc7_];
            _loc6_[_loc3_] = [_loc1_.x1,_loc1_.y1,_loc1_.x2,_loc1_.y2,_loc1_.lim,Number(_loc1_.inv),_loc1_.prevLine,_loc1_.nextLine,_loc1_.name,_loc1_.type];
            _loc3_ = _loc3_ + 1;
         }
         var _loc5_ = removeSpaces(panel.fileDialog.name.text);
         var _loc4_ = undefined;
         var _loc2_ = 0;
         while(_loc2_ < savedTracks.data.trackList.length)
         {
            if(savedTracks.data.trackList[_loc2_].label == _loc5_)
            {
               _loc4_ = _loc2_;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc4_ != undefined)
         {
            var _loc13_ = savedTracks.data.trackList.splice(_loc4_,1);
         }
         savedTracks.data.trackList.addItemAt(0,{label:_loc5_,data:_loc6_,level:totLines,startLine:[tla.startPoint._x,tla.startPoint._y],version:ver});
         savedTracks.flush(savedTracks.getSize());
         panel.fileDialog._visible = false;
         panelMode("draw");
         panel[lastTool + "B"].onPress();
         cursorImage(cursorMode);
         disableFileButtons();
      }
      else
      {
         panel.fileDialog.name.text = "there is nothing to save:)";
      }
   };
   panel.fileDialog.loadButton.onRelease = function()
   {
      if(panel.fileDialog.savedTracks.selectedIndex != undefined)
      {
         disableFileButtons();
         undoList = [];
         reset();
         active = true;
         saved = false;
         tla.dummy._visible = false;
         tla.flag._visible = false;
         trace(panel.fileDialog.savedTracks.selectedIndex);
         buffer = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].data;
         var _loc5_ = savedTracks.data.trackList[panel.fileDialog.savedTracks.selectedIndex].version;
         if(_loc5_ == undefined)
         {
            _loc5_ = "6";
         }
         switchToVersion(_loc5_);
         panel.fileDialog._visible = false;
         segmentsRemainingToLoad = buffer.length;
         loadPerFrame = Math.max(1,Math.round(segmentsRemainingToLoad * 0.002));
         loadBounds(buffer);
         showAll();
         if(tla._xscale > 100)
         {
            tla._xscale = tla._yscale = bufScale = 100;
            tla._x = tla._y = canvasX = canvasY = 0;
         }
         panel.onEnterFrame = function()
         {
            if(segmentsRemainingToLoad > 0)
            {
               var _loc3_ = 0;
               while(_loc3_ < loadPerFrame && segmentsRemainingToLoad > 0)
               {
                  var _loc1_ = buffer[segmentsRemainingToLoad - 1];
                  segmentsRemainingToLoad--;
                  if(_loc1_[9] == undefined)
                  {
                     _loc1_[9] = 0;
                  }
                  switch(_loc1_[9])
                  {
                     case 0:
                        var _loc2_ = new Floor(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],Boolean(_loc1_[5]),_loc1_[4]);
                        break;
                     case 1:
                        _loc2_ = new FloorAcc(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],Boolean(_loc1_[5]),_loc1_[4]);
                        break;
                     case 2:
                        continue;
                  }
                  Lines++;
                  _loc2_.name = _loc1_[8];
                  undoList.push(_loc1_[8]);
                  _loc2_.prevLine = _loc1_[6];
                  _loc2_.nextLine = _loc1_[7];
                  registerInGrid(_loc2_);
                  lines["line" + _loc2_.name] = _loc2_;
                  var _loc4_ = tla.createEmptyMovieClip(_loc2_.name,tla.getNextHighestDepth());
                  _loc2_.parent = _loc4_;
                  renderLine(_loc2_);
                  _loc3_ = _loc3_ + 1;
               }
               steuc.text = Math.floor((buffer.length - segmentsRemainingToLoad) / buffer.length * 100) + "% loaded";
            }
            else
            {
               finishLoad();
            }
         };
      }
   };
   panel.fileDialog.deleteButton.onRelease = function()
   {
      enableConfirmButtons();
      panel.confirmDialog._visible = true;
      panel.confirmDialog.text.text = "Are you sure you want to delete the track?";
      panel.confirmDialog.Yes.onRelease = function()
      {
         disableConfirmButtons();
         panel.confirmDialog._visible = false;
         var _loc1_ = panel.fileDialog.savedTracks.selectedIndex;
         savedTracks.data.trackList.removeItemAt(_loc1_);
         panel.fileDialog.savedTracks.selectedIndex = Math.min(_loc1_,panel.fileDialog.savedTracks.length - 1);
      };
      panel.confirmDialog.No.onRelease = function()
      {
         disableConfirmButtons();
         panel.confirmDialog._visible = false;
      };
   };
   panel.fileDialog.close.onPress = function()
   {
      active = true;
      panel[lastTool + "B"].onPress();
      cursorImage(cursorMode);
      panel.fileDialog._visible = false;
      panelMode("draw");
      disableFileButtons();
   };
};
panel.flagB.onPress = function()
{
   if(simulation)
   {
      saveNow = true;
      saved = true;
   }
   else
   {
      saved = false;
      tla.dummy._visible = false;
      tla.flag._visible = false;
   }
};
panel.eraserB.onPress = function()
{
   cursorMode = "eraser";
   panel.swatches._visible = false;
   onMouseDown = function()
   {
      if(active2)
      {
         if(cursor._currentframe == 2)
         {
            pan();
         }
         else
         {
            erase(tla._xmouse,tla._ymouse);
            onMouseMove = function()
            {
               erase(tla._xmouse,tla._ymouse);
            };
         }
      }
   };
   onMouseUp = function()
   {
      canvasX = tla._x;
      canvasY = tla._y;
      onMouseMove = function()
      {
      };
      stopDrag();
      pointToStartPoint();
   };
   onEnterFrame = function()
   {
   };
   lastTool = "eraser";
};
var oldScale;
var oldy;
var bufScale = 100;
registerInGrid = function(line)
{
   var _loc1_ = gridPos(line.x1,line.y1);
   var _loc7_ = gridPos(line.x2,line.y2);
   var _loc11_ = line.dx <= 0 ? _loc1_.x : _loc7_.x;
   var _loc13_ = line.dx <= 0 ? _loc7_.x : _loc1_.x;
   var _loc10_ = line.dy <= 0 ? _loc1_.y : _loc7_.y;
   var _loc12_ = line.dy <= 0 ? _loc7_.y : _loc1_.y;
   if(line.dx == 0 && line.dy == 0 || _loc1_.x == _loc7_.x && _loc1_.y == _loc7_.y)
   {
      register(line,_loc1_.x,_loc1_.y);
      return undefined;
   }
   register(line,_loc1_.x,_loc1_.y);
   var _loc5_ = line.x1;
   var _loc4_ = line.y1;
   var _loc9_ = 1 / line.dx;
   var _loc8_ = 1 / line.dy;
   while(true)
   {
      var _loc3_ = undefined;
      if(_loc1_.x < 0)
      {
         difX = line.dx <= 0 ? - GRIDSIZE - _loc1_.gx : GRIDSIZE + _loc1_.gx;
      }
      else
      {
         difX = line.dx <= 0 ? - _loc1_.gx + 1 : GRIDSIZE - _loc1_.gx;
      }
      if(_loc1_.y < 0)
      {
         _loc3_ = line.dy <= 0 ? - GRIDSIZE - _loc1_.gy : GRIDSIZE + _loc1_.gy;
      }
      else
      {
         _loc3_ = line.dy <= 0 ? - _loc1_.gy + 1 : GRIDSIZE - _loc1_.gy;
      }
      if(line.dx == 0)
      {
         _loc4_ += _loc3_;
      }
      else if(line.dy == 0)
      {
         _loc5_ += difX;
      }
      else
      {
         var _loc6_ = _loc4_ + line.dy * difX * _loc9_;
         if(Math.abs(_loc6_ - _loc4_) < Math.abs(_loc3_))
         {
            _loc5_ += difX;
            _loc4_ = _loc6_;
         }
         else if(Math.abs(_loc6_ - _loc4_) == Math.abs(_loc3_))
         {
            _loc5_ += difX;
            _loc4_ += _loc3_;
         }
         else
         {
            _loc5_ += line.dx * _loc3_ * _loc8_;
            _loc4_ += _loc3_;
         }
      }
      _loc1_ = gridPos(_loc5_,_loc4_);
      if(!(_loc1_.x >= _loc13_ && _loc1_.x <= _loc11_ && _loc1_.y >= _loc12_ && _loc1_.y <= _loc10_))
      {
         break;
      }
      register(line,_loc1_.x,_loc1_.y);
   }
   return undefined;
};
helpscreen.icons.pencilB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(2);
   mouse.show();
};
helpscreen.icons.lineB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(3);
   mouse.show();
};
helpscreen.icons.eraserB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(4);
   mouse.show();
};
helpscreen.icons.zoomB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(6);
   mouse.show();
};
helpscreen.icons.handB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(7);
   mouse.show();
};
helpscreen.icons.playB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(8);
   mouse.show();
};
helpscreen.icons.stopB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(9);
   mouse.show();
};
helpscreen.icons.flagB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(10);
   mouse.show();
};
helpscreen.icons.saveB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(11);
   mouse.show();
};
helpscreen.icons.trashB.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(12);
   mouse.show();
};
helpscreen.icons.editor.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(13);
   mouse.show();
};
helpscreen.icons.simulator.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(14);
   mouse.show();
};
helpscreen.icons.red.onRollOver = helpscreen.icons.green.onRollOver = helpscreen.icons.blue.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(5);
   mouse.show();
};
helpscreen.icons.startPoint.onRollOver = function()
{
   helpscreen.texts.gotoAndStop(15);
   mouse.show();
};
init();
reset();
drawPencil();
setInterval(blink,1000);
panel.pencilB.onPress();
cursorImage("pencil");

                                        