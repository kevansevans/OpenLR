// Generated by Haxe 4.1.5

#pragma warning disable 109, 114, 219, 429, 168, 162
namespace hxlr.rider {
	public class ContactPoint : global::haxe.lang.HxObject {
		
		public ContactPoint(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public ContactPoint(global::haxe.lang.Null<double> _x, global::haxe.lang.Null<double> _y, global::haxe.lang.Null<double> _friction) {
			global::hxlr.rider.ContactPoint.__hx_ctor_hxlr_rider_ContactPoint(this, _x, _y, _friction);
		}
		
		
		protected static void __hx_ctor_hxlr_rider_ContactPoint(global::hxlr.rider.ContactPoint __hx_this, global::haxe.lang.Null<double> _x, global::haxe.lang.Null<double> _y, global::haxe.lang.Null<double> _friction) {
			double _friction1 = ( ( ! (_friction.hasValue) ) ? (0.0) : ((_friction).@value) );
			double _y1 = ( ( ! (_y.hasValue) ) ? (0.0) : ((_y).@value) );
			double _x1 = ( ( ! (_x.hasValue) ) ? (0.0) : ((_x).@value) );
			__hx_this.pos = new global::hxlr.math.geom.Point(new global::haxe.lang.Null<double>(_x1, true), new global::haxe.lang.Null<double>(_y1, true));
			__hx_this.dir = new global::hxlr.math.geom.Point(default(global::haxe.lang.Null<double>), default(global::haxe.lang.Null<double>));
			__hx_this.vel = new global::hxlr.math.geom.Point(default(global::haxe.lang.Null<double>), default(global::haxe.lang.Null<double>));
			__hx_this.friction = _friction1;
		}
		
		
		public global::hxlr.math.geom.Point pos;
		
		public global::hxlr.math.geom.Point vel;
		
		public global::hxlr.math.geom.Point dir;
		
		public global::hxlr.math.geom.Point gravity;
		
		public double friction;
		
		public virtual void iterate(global::hxlr.math.geom.Point _gravity) {
			global::hxlr.math.geom.Point g = ( (( _gravity == null )) ? (this.gravity) : (_gravity) );
			this.dir.x = ( ( this.pos.x - this.vel.x ) + g.x );
			this.dir.y = ( ( this.pos.y - this.vel.y ) + g.y );
			this.vel = this.pos.clone();
			this.pos = this.pos.@add(this.dir);
		}
		
		
		public virtual object serialize() {
			object @object = new global::haxe.lang.DynamicObject(new int[]{519963165, 1257939113}, new object[]{this.vel, this.pos}, new int[]{399079674}, new double[]{this.friction});
			return @object;
		}
		
		
		public virtual void deserialize(object _object) {
			this.pos = ((global::hxlr.math.geom.Point) (global::haxe.lang.Runtime.getField(_object, "position", 1257939113, true)) );
			this.vel = ((global::hxlr.math.geom.Point) (global::haxe.lang.Runtime.getField(_object, "velocity", 519963165, true)) );
			this.friction = global::haxe.lang.Runtime.getField_f(_object, "friction", 399079674, true);
		}
		
		
		public override double __hx_setField_f(string field, int hash, double @value, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 399079674:
					{
						this.friction = ((double) (@value) );
						return @value;
					}
					
					
					default:
					{
						return base.__hx_setField_f(field, hash, @value, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override object __hx_setField(string field, int hash, object @value, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 399079674:
					{
						this.friction = ((double) (global::haxe.lang.Runtime.toDouble(@value)) );
						return @value;
					}
					
					
					case 2013228622:
					{
						this.gravity = ((global::hxlr.math.geom.Point) (@value) );
						return @value;
					}
					
					
					case 4996429:
					{
						this.dir = ((global::hxlr.math.geom.Point) (@value) );
						return @value;
					}
					
					
					case 5890653:
					{
						this.vel = ((global::hxlr.math.geom.Point) (@value) );
						return @value;
					}
					
					
					case 5594516:
					{
						this.pos = ((global::hxlr.math.geom.Point) (@value) );
						return @value;
					}
					
					
					default:
					{
						return base.__hx_setField(field, hash, @value, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override object __hx_getField(string field, int hash, bool throwErrors, bool isCheck, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 691375679:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "deserialize", 691375679)) );
					}
					
					
					case 1962040800:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "serialize", 1962040800)) );
					}
					
					
					case 1657829882:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "iterate", 1657829882)) );
					}
					
					
					case 399079674:
					{
						return this.friction;
					}
					
					
					case 2013228622:
					{
						return this.gravity;
					}
					
					
					case 4996429:
					{
						return this.dir;
					}
					
					
					case 5890653:
					{
						return this.vel;
					}
					
					
					case 5594516:
					{
						return this.pos;
					}
					
					
					default:
					{
						return base.__hx_getField(field, hash, throwErrors, isCheck, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override double __hx_getField_f(string field, int hash, bool throwErrors, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 399079674:
					{
						return this.friction;
					}
					
					
					default:
					{
						return base.__hx_getField_f(field, hash, throwErrors, handleProperties);
					}
					
				}
				
			}
		}
		
		
		public override object __hx_invokeField(string field, int hash, object[] dynargs) {
			unchecked {
				switch (hash) {
					case 691375679:
					{
						this.deserialize(dynargs[0]);
						break;
					}
					
					
					case 1962040800:
					{
						return this.serialize();
					}
					
					
					case 1657829882:
					{
						this.iterate(((global::hxlr.math.geom.Point) (( (( dynargs.Length > 0 )) ? (dynargs[0]) : (null) )) ));
						break;
					}
					
					
					default:
					{
						return base.__hx_invokeField(field, hash, dynargs);
					}
					
				}
				
				return null;
			}
		}
		
		
		public override void __hx_getFields(global::Array<string> baseArr) {
			baseArr.push("friction");
			baseArr.push("gravity");
			baseArr.push("dir");
			baseArr.push("vel");
			baseArr.push("pos");
			base.__hx_getFields(baseArr);
		}
		
		
	}
}

