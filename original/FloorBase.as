class FloorBase
{
   static var zone = 10;
   var x1, y1, x2, y2, _lim1, _lim2, grids, LIM, __lim;
   function FloorBase(_x1, _y1, _x2, _y2)
   {
      this.x1 = _x1;
      this.y1 = _y1;
      this.x2 = _x2;
      this.y2 = _y2;
      this.grids = [];
   }
   function __set__lim(input)
   {
      switch(input)
      {
         case 0:
            this._lim1 = 0;
            this._lim2 = 1;
            break;
         case 1:
            this._lim1 = - this.LIM;
            this._lim2 = 1;
            break;
         case 2:
            this._lim1 = 0;
            this._lim2 = 1 + this.LIM;
            break;
         case 3:
            this._lim1 = - this.LIM;
            this._lim2 = 1 + this.LIM;
      }
      this.__lim = input;
      return this.__get__lim();
   }
   function __get__lim()
   {
      return this.__lim;
   }
}
