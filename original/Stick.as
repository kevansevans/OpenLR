class Stick
{
	var a;
	var b;
	var restLength;
   function Stick(_a, _b)
   {
      this.a = _a;
      this.b = _b;
      this.getRestLength();
   }
   function satisfyDistance()
   {
      var _loc3_ = this.a.x - this.b.x;
      var _loc2_ = this.a.y - this.b.y;
      var _loc7_ = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
      var _loc6_ = (_loc7_ - this.restLength) / _loc7_ * 0.5;
      var _loc5_ = _loc3_ * _loc6_;
      var _loc4_ = _loc2_ * _loc6_;
      this.a.x -= _loc5_;
      this.a.y -= _loc4_;
      this.b.x += _loc5_;
      this.b.y += _loc4_;
   }
   function getRestLength()
   {
      var _loc3_ = this.a.x - this.b.x;
      var _loc2_ = this.a.y - this.b.y;
      this.restLength = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
   }
   function render(target)
   {
      target.moveTo(this.a.x,this.a.y);
      target.lineTo(this.b.x,this.b.y);
   }
}
