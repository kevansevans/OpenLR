class FloorAcc extends FloorBase
{
   static var ACC = 0.1;
   var type = 1;
   var inv, dx, dy, C, invSqrDis, nx, ny, x, y, dst, invDst, hx, hy, prevLine, nextLine, accx, accy;
   function FloorAcc(_x1, _y1, _x2, _y2, _inv, _lim)
   {
      super(_x1,_y1,_x2,_y2);
      this.inv = _inv;
      this.calculateConstants();
      this.__set__lim(_lim != undefined ? _lim : 0);
   }
   function calculateConstants()
   {
      this.dx = this.x2 - this.x1;
      this.dy = this.y2 - this.y1;
      this.C = this.dy * this.x1 - this.dx * this.y1;
      var _loc2_ = Math.pow(this.dx,2) + Math.pow(this.dy,2);
      this.invSqrDis = 1 / _loc2_;
      this.dst = Math.sqrt(_loc2_);
      this.invDst = 1 / this.dst;
      this.nx = this.dy * this.invDst * (!this.inv ? -1 : 1);
      this.ny = this.dx * this.invDst * (!this.inv ? 1 : -1);
      this.x = this.x1 + this.dx * 0.5;
      this.y = this.y1 + this.dy * 0.5;
      this.hx = Math.abs(this.dx) * 0.5;
      this.hy = Math.abs(this.dy) * 0.5;
      this.accx = this.ny * FloorAcc.ACC * (!this.inv ? -1 : 1);
      this.accy = this.nx * FloorAcc.ACC * (!this.inv ? 1 : -1);
      this.LIM = Math.min(0.25,FloorBase.zone / this.dst);
   }
   function addPrevLine(line, extend)
   {
      if(extend && line.type == 1)
      {
         switch(this.__get__lim())
         {
            case 0:
               this.__set__lim(1);
               break;
            case 2:
               this.__set__lim(3);
         }
      }
      this.prevLine = line.name;
   }
   function addNextLine(line, extend)
   {
      if(extend && line.type == 1)
      {
         switch(this.__get__lim())
         {
            case 0:
               this.__set__lim(2);
               break;
            case 1:
               this.__set__lim(3);
         }
      }
      this.nextLine = line.name;
   }
   function colide(dot)
   {
      var _loc6_ = dot.x - this.x1;
      var _loc5_ = dot.y - this.y1;
      var _loc3_ = this.nx * _loc6_ + this.ny * _loc5_;
      var _loc4_ = (_loc6_ * this.dx + _loc5_ * this.dy) * this.invSqrDis;
      if(dot.dx * this.nx + dot.dy * this.ny > 0)
      {
         if(_loc3_ > 0 && _loc3_ < FloorBase.zone && _loc4_ >= this._lim1 && _loc4_ <= this._lim2)
         {
            dot.x -= _loc3_ * this.nx;
            dot.y -= _loc3_ * this.ny;
            dot.vx = dot.vx + this.ny * dot.friction * _loc3_ * (dot.vx >= dot.x ? -1 : 1) + this.accx;
            dot.vy = dot.vy - this.nx * dot.friction * _loc3_ * (dot.vy >= dot.y ? 1 : -1) + this.accy;
            return true;
         }
      }
   }
}
