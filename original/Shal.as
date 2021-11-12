class Shal extends Stick
{
   function Shal(_a, _b)
   {
      super();
      this.a = _a;
      this.b = _b;
      this.getRestLength();
   }
   function satisfyDistance()
   {
      var _loc3_ = this.a.x - this.b.x;
      var _loc2_ = this.a.y - this.b.y;
      var _loc5_ = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
      var _loc4_ = (_loc5_ - this.restLength) / _loc5_;
      var _loc7_ = _loc3_ * _loc4_;
      var _loc6_ = _loc2_ * _loc4_;
      this.b.x += _loc7_;
      this.b.y += _loc6_;
   }
}
