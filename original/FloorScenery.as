class FloorScenery extends FloorBase
{
   var type = 2;
   var inv, dx, dy, C, invSqrDis, nx, ny, x, y, dst, invDst, hx, hy, prevLine, nextLine;
   function FloorScenery(_x1, _y1, _x2, _y2)
   {
      super(_x1,_y1,_x2,_y2);
      this.calculateConstants();
   }
   function calculateConstants()
   {
      this.dx = this.x2 - this.x1;
      this.dy = this.y2 - this.y1;
      this.C = this.dy * this.x1 - this.dx * this.y1;
      var _loc2_ = Math.pow(this.dx,2) + Math.pow(this.dy,2);
      this.invSqrDis = 1 / _loc2_;
      this.dst = Math.sqrt(_loc2_);
      var _loc3_ = 1 / this.dst;
      this.nx = (- this.dy) * _loc3_;
      this.ny = this.dx * _loc3_;
      this.x = this.x1 + this.dx * 0.5;
      this.y = this.y1 + this.dy * 0.5;
      this.hx = Math.abs(this.dx) * 0.5;
      this.hy = Math.abs(this.dy) * 0.5;
   }
   function colide(dot)
   {
   }
}
