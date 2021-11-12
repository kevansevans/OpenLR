class BreakableStick extends Stick
{
	var endurance;
   function BreakableStick(_a, _b, _endurance)
   {
      super();
      this.a = _a;
      this.b = _b;
      this.getRestLength();
      this.endurance = _endurance * this.restLength;
   }
   function satisfyDistance()
   {
      var _loc3_ = this.a.x - this.b.x;
      var _loc2_ = this.a.y - this.b.y;
      var _loc7_ = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
      var _loc4_ = (_loc7_ - this.restLength) / _loc7_ * 0.5;
      if(_loc4_ > this.endurance * 0.5)
      {
         false;
         return true;
      }
      var _loc6_ = _loc3_ * _loc4_;
      var _loc5_ = _loc2_ * _loc4_;
      this.a.x -= _loc6_;
      this.a.y -= _loc5_;
      this.b.x += _loc6_;
      this.b.y += _loc5_;
      return false;
   }
}
