class PointAirFri extends Point
{
	var airFriction;
   function PointAirFri(__x, __y, __afr)
   {
      super();
      this.x = __x;
      this.y = __y;
      this.dx = 0;
      this.dy = 0;
      this.vx = 0;
      this.vy = 0;
      this.airFriction = __afr;
   }
   function verlet(a)
   {
      this.dx = (this.x - this.vx) * this.airFriction + a.x;
      this.dy = (this.y - this.vy) * this.airFriction + a.y;
      this.vx = this.x;
      this.vy = this.y;
      this.x += this.dx;
      this.y += this.dy;
   }
}
