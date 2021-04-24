// Generated by Haxe 4.1.5

#pragma warning disable 109, 114, 219, 429, 168, 162
namespace hxlr.rider {
	public class RiderBase : global::haxe.lang.HxObject {
		
		public RiderBase(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public RiderBase(object _struct, global::hxlr.math.geom.Point _start, string _name) {
			global::hxlr.rider.RiderBase.__hx_ctor_hxlr_rider_RiderBase(this, _struct, _start, _name);
		}
		
		
		protected static void __hx_ctor_hxlr_rider_RiderBase(global::hxlr.rider.RiderBase __hx_this, object _struct, global::hxlr.math.geom.Point _start, string _name) {
			__hx_this.enabled = true;
			__hx_this.invincible = false;
			__hx_this.crashed = new global::haxe.lang.Null<bool>(false, true);
			{
				__hx_this.@struct = _struct;
				__hx_this.startPos = _start;
				__hx_this.startVel = new global::hxlr.math.geom.Point(new global::haxe.lang.Null<double>(global::haxe.lang.Runtime.getField_f(__hx_this.@struct, "x_vel", 1463469014, true), true), new global::haxe.lang.Null<double>(global::haxe.lang.Runtime.getField_f(__hx_this.@struct, "y_vel", 1788958807, true), true));
				__hx_this.gravity = new global::hxlr.math.geom.Point(new global::haxe.lang.Null<double>(global::haxe.lang.Runtime.getField_f(__hx_this.@struct, "x_grav", 1917859911, true), true), new global::haxe.lang.Null<double>(global::haxe.lang.Runtime.getField_f(__hx_this.@struct, "y_grav", 1487639718, true), true));
				__hx_this.name = _name;
				__hx_this.init();
			}
			
		}
		
		
		public object @struct;
		
		public global::hxlr.math.geom.Point startPos;
		
		public global::hxlr.math.geom.Point startVel;
		
		public global::hxlr.math.geom.Point gravity;
		
		public global::Array<object> contactPoints;
		
		public global::Array<object> airPoints;
		
		public global::Array<object> constraints;
		
		public global::Array<object> scarves;
		
		public global::Array<object> limits;
		
		public global::haxe.lang.Null<bool> crashed;
		
		public bool invincible;
		
		public global::haxe.lang.Null<int> enabledFrame;
		
		public global::haxe.lang.Null<int> disableFrame;
		
		public bool enabled;
		
		public global::hxlr.rider.ContactPoint focusPoint;
		
		public string name;
		
		public virtual void init() {
			unchecked {
				this.contactPoints = new global::Array<object>();
				{
					int _g = 0;
					global::Array<object> _g1 = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (global::haxe.lang.Runtime.getField(this.@struct, "contactPoints", 205043939, true)) ))) );
					while (( _g < _g1.length )) {
						object dot = _g1[_g];
						 ++ _g;
						this.contactPoints.push(new global::hxlr.rider.ContactPoint(new global::haxe.lang.Null<double>(global::haxe.lang.Runtime.getField_f(dot, "x", 120, true), true), new global::haxe.lang.Null<double>(global::haxe.lang.Runtime.getField_f(dot, "y", 121, true), true), new global::haxe.lang.Null<double>(global::haxe.lang.Runtime.getField_f(dot, "fr", 22860, true), true)));
					}
					
				}
				
				this.airPoints = new global::Array<object>();
				{
					int _g2 = 0;
					global::Array<object> _g3 = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (global::haxe.lang.Runtime.getField(this.@struct, "scarfPoints", 1677065160, true)) ))) );
					while (( _g2 < _g3.length )) {
						object dot1 = _g3[_g2];
						 ++ _g2;
						this.airPoints.push(new global::hxlr.rider.AirPoint(global::haxe.lang.Runtime.getField_f(dot1, "x", 120, true), global::haxe.lang.Runtime.getField_f(dot1, "y", 121, true), global::haxe.lang.Runtime.getField_f(dot1, "fr", 22860, true)));
					}
					
				}
				
				{
					int _g4 = 0;
					global::Array<object> _g5 = this.contactPoints;
					while (( _g4 < _g5.length )) {
						global::hxlr.rider.ContactPoint point = ((global::hxlr.rider.ContactPoint) (_g5[_g4]) );
						 ++ _g4;
						{
							global::hxlr.math.geom.Point __temp_dynop1 = point.pos;
							__temp_dynop1.x = ( ((double) (__temp_dynop1.x) ) * ((double) (global::haxe.lang.Runtime.getField_f(this.@struct, "scale", 2026819210, true)) ) );
						}
						
						{
							global::hxlr.math.geom.Point __temp_dynop2 = point.pos;
							__temp_dynop2.y = ( ((double) (__temp_dynop2.y) ) * ((double) (global::haxe.lang.Runtime.getField_f(this.@struct, "scale", 2026819210, true)) ) );
						}
						
						point.pos.x += this.startPos.x;
						point.pos.y += this.startPos.y;
						point.vel.x = ( point.pos.x - this.startVel.x );
						point.vel.y = point.pos.y;
					}
					
				}
				
				{
					int _g6 = 0;
					global::Array<object> _g7 = this.airPoints;
					while (( _g6 < _g7.length )) {
						global::hxlr.rider.AirPoint point1 = ((global::hxlr.rider.AirPoint) (_g7[_g6]) );
						 ++ _g6;
						{
							global::hxlr.math.geom.Point __temp_dynop3 = point1.pos;
							__temp_dynop3.x = ( ((double) (__temp_dynop3.x) ) * ((double) (global::haxe.lang.Runtime.getField_f(this.@struct, "scale", 2026819210, true)) ) );
						}
						
						{
							global::hxlr.math.geom.Point __temp_dynop4 = point1.pos;
							__temp_dynop4.y = ( ((double) (__temp_dynop4.y) ) * ((double) (global::haxe.lang.Runtime.getField_f(this.@struct, "scale", 2026819210, true)) ) );
						}
						
						point1.pos.x += this.startPos.x;
						point1.pos.y += this.startPos.y;
						point1.vel.x = ( point1.pos.x - this.startVel.x );
						point1.vel.y = point1.pos.y;
					}
					
				}
				
				this.constraints = new global::Array<object>();
				{
					int _g8 = 0;
					global::Array<object> _g9 = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (global::haxe.lang.Runtime.getField(this.@struct, "bones", 922179759, true)) ))) );
					while (( _g8 < _g9.length )) {
						object edge = _g9[_g8];
						 ++ _g8;
						global::hxlr.rider.Stick stick = new global::hxlr.rider.Stick(((global::hxlr.rider.ContactPoint) (this.contactPoints[((int) (global::haxe.lang.Runtime.getField_f(edge, "a", 97, true)) )]) ), ((global::hxlr.rider.ContactPoint) (this.contactPoints[((int) (global::haxe.lang.Runtime.getField_f(edge, "b", 98, true)) )]) ), global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.getField(edge, "type", 1292432058, true)), this);
						stick.crashable = global::haxe.lang.Runtime.toBool(global::haxe.lang.Runtime.getField(edge, "crashable", 1788062977, true));
						this.constraints.push(stick);
					}
					
				}
				
				this.scarves = new global::Array<object>();
				{
					int _g10 = 0;
					int _g11 = this.airPoints.length;
					while (( _g10 < _g11 )) {
						int point2 = _g10++;
						if (( ((global::hxlr.rider.AirPoint) (this.airPoints[( point2 + 1 )]) ) == null )) {
							break;
						}
						
						this.scarves.push(new global::hxlr.rider.Stick(((global::hxlr.rider.AirPoint) (this.airPoints[point2]) ), ((global::hxlr.rider.AirPoint) (this.airPoints[( point2 + 1 )]) ), "SCARF", this));
					}
					
				}
				
				this.scarves.unshift(new global::hxlr.rider.Stick(((global::hxlr.rider.ContactPoint) (this.contactPoints[((int) (global::haxe.lang.Runtime.getField_f(this.@struct, "scarfAnchor", 1295590426, true)) )]) ), ((global::hxlr.rider.AirPoint) (this.airPoints[0]) ), "SCARF", this));
				this.limits = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (global::haxe.lang.Runtime.getField(this.@struct, "limits", 1811559640, true)) ))) );
				this.focusPoint = ((global::hxlr.rider.ContactPoint) (this.contactPoints[((int) (global::haxe.lang.Runtime.getField_f(this.@struct, "camera", 931940005, true)) )]) );
				global::haxe.lang.Null<bool> __temp_expr1 = new global::haxe.lang.Null<bool>(this.set_crashed(false), true);
			}
		}
		
		
		public virtual void reset() {
		}
		
		
		public virtual void step() {
		}
		
		
		public virtual void iterate() {
		}
		
		
		public virtual void checkLimits() {
		}
		
		
		public virtual void constrain() {
		}
		
		
		public virtual void constrainScarf() {
		}
		
		
		public virtual void collide() {
			unchecked {
				int _g = 0;
				global::Array<object> _g1 = this.contactPoints;
				while (( _g < _g1.length )) {
					global::hxlr.rider.ContactPoint point = ((global::hxlr.rider.ContactPoint) (_g1[_g]) );
					 ++ _g;
					object gridPos = global::hxlr.engine.Cell.getInfo(point.pos.x, point.pos.y);
					{
						int _g2 = -1;
						while (( _g2 < 2 )) {
							int _x = _g2++;
							{
								int _g3 = -1;
								while (( _g3 < 2 )) {
									int _y = _g3++;
									string key = global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("x", global::haxe.lang.Runtime.toString((( ((int) (global::haxe.lang.Runtime.getField_f(gridPos, "x", 120, true)) ) + _x )))), "y"), global::haxe.lang.Runtime.toString((( ((int) (global::haxe.lang.Runtime.getField_f(gridPos, "y", 121, true)) ) + _y ))));
									if (( ((global::hxlr.engine.Cell) ((((global::haxe.ds.StringMap<object>) (global::haxe.ds.StringMap<object>.__hx_cast<object>(((global::haxe.ds.StringMap) (((global::haxe.IMap<string, object>) (global::hxlr.engine.Grid.registry) )) ))) ).@get(key)).@value) ) == null )) {
										continue;
									}
									else {
										global::hxlr.engine.Cell register = ((global::hxlr.engine.Cell) ((((global::haxe.ds.StringMap<object>) (global::haxe.ds.StringMap<object>.__hx_cast<object>(((global::haxe.ds.StringMap) (((global::haxe.IMap<string, object>) (global::hxlr.engine.Grid.registry) )) ))) ).@get(key)).@value) );
										{
											int _g4 = 0;
											global::Array<object> _g5 = register.collidable;
											while (( _g4 < _g5.length )) {
												global::hxlr.lines.LineBase line = ((global::hxlr.lines.LineBase) (_g5[_g4]) );
												 ++ _g4;
												if (( line == null )) {
													continue;
												}
												
												line.collide(point);
											}
											
										}
										
									}
									
								}
								
							}
							
						}
						
					}
					
				}
				
			}
		}
		
		
		public virtual void renderRider() {
		}
		
		
		public virtual bool set_crashed(bool _value) {
			if (this.invincible) {
				return (this.crashed = default(global::haxe.lang.Null<bool>)).@value;
			}
			
			return (this.crashed = new global::haxe.lang.Null<bool>(_value, true)).@value;
		}
		
		
		public override double __hx_setField_f(string field, int hash, double @value, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 288963157:
					{
						this.@struct = ((object) (@value) );
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
					case 1224700491:
					{
						this.name = global::haxe.lang.Runtime.toString(@value);
						return @value;
					}
					
					
					case 150033752:
					{
						this.focusPoint = ((global::hxlr.rider.ContactPoint) (@value) );
						return @value;
					}
					
					
					case 2117141633:
					{
						this.enabled = global::haxe.lang.Runtime.toBool(@value);
						return @value;
					}
					
					
					case 1158124837:
					{
						this.disableFrame = global::haxe.lang.Null<object>.ofDynamic<int>(@value);
						return @value;
					}
					
					
					case 190509036:
					{
						this.enabledFrame = global::haxe.lang.Null<object>.ofDynamic<int>(@value);
						return @value;
					}
					
					
					case 796121503:
					{
						this.invincible = global::haxe.lang.Runtime.toBool(@value);
						return @value;
					}
					
					
					case 1336745990:
					{
						if (handleProperties) {
							global::haxe.lang.Null<bool> __temp_expr1 = new global::haxe.lang.Null<bool>(this.set_crashed(global::haxe.lang.Runtime.toBool(@value)), true);
							return @value;
						}
						else {
							this.crashed = global::haxe.lang.Null<object>.ofDynamic<bool>(@value);
							return @value;
						}
						
					}
					
					
					case 1811559640:
					{
						this.limits = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (@value) ))) );
						return @value;
					}
					
					
					case 1762364291:
					{
						this.scarves = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (@value) ))) );
						return @value;
					}
					
					
					case 397693302:
					{
						this.constraints = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (@value) ))) );
						return @value;
					}
					
					
					case 326828109:
					{
						this.airPoints = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (@value) ))) );
						return @value;
					}
					
					
					case 205043939:
					{
						this.contactPoints = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (@value) ))) );
						return @value;
					}
					
					
					case 2013228622:
					{
						this.gravity = ((global::hxlr.math.geom.Point) (@value) );
						return @value;
					}
					
					
					case 1117622043:
					{
						this.startVel = ((global::hxlr.math.geom.Point) (@value) );
						return @value;
					}
					
					
					case 1117325906:
					{
						this.startPos = ((global::hxlr.math.geom.Point) (@value) );
						return @value;
					}
					
					
					case 288963157:
					{
						this.@struct = ((object) (@value) );
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
					case 1611958057:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "set_crashed", 1611958057)) );
					}
					
					
					case 890433348:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "renderRider", 890433348)) );
					}
					
					
					case 1835249534:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "collide", 1835249534)) );
					}
					
					
					case 2123426830:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "constrainScarf", 2123426830)) );
					}
					
					
					case 1335767095:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "constrain", 1335767095)) );
					}
					
					
					case 1309411264:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "checkLimits", 1309411264)) );
					}
					
					
					case 1657829882:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "iterate", 1657829882)) );
					}
					
					
					case 1281091404:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "step", 1281091404)) );
					}
					
					
					case 1724402127:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "reset", 1724402127)) );
					}
					
					
					case 1169898256:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "init", 1169898256)) );
					}
					
					
					case 1224700491:
					{
						return this.name;
					}
					
					
					case 150033752:
					{
						return this.focusPoint;
					}
					
					
					case 2117141633:
					{
						return this.enabled;
					}
					
					
					case 1158124837:
					{
						return (this.disableFrame).toDynamic();
					}
					
					
					case 190509036:
					{
						return (this.enabledFrame).toDynamic();
					}
					
					
					case 796121503:
					{
						return this.invincible;
					}
					
					
					case 1336745990:
					{
						return (this.crashed).toDynamic();
					}
					
					
					case 1811559640:
					{
						return this.limits;
					}
					
					
					case 1762364291:
					{
						return this.scarves;
					}
					
					
					case 397693302:
					{
						return this.constraints;
					}
					
					
					case 326828109:
					{
						return this.airPoints;
					}
					
					
					case 205043939:
					{
						return this.contactPoints;
					}
					
					
					case 2013228622:
					{
						return this.gravity;
					}
					
					
					case 1117622043:
					{
						return this.startVel;
					}
					
					
					case 1117325906:
					{
						return this.startPos;
					}
					
					
					case 288963157:
					{
						return this.@struct;
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
					case 288963157:
					{
						return ((double) (global::haxe.lang.Runtime.toDouble(this.@struct)) );
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
					case 1611958057:
					{
						return this.set_crashed(global::haxe.lang.Runtime.toBool(dynargs[0]));
					}
					
					
					case 890433348:
					{
						this.renderRider();
						break;
					}
					
					
					case 1835249534:
					{
						this.collide();
						break;
					}
					
					
					case 2123426830:
					{
						this.constrainScarf();
						break;
					}
					
					
					case 1335767095:
					{
						this.constrain();
						break;
					}
					
					
					case 1309411264:
					{
						this.checkLimits();
						break;
					}
					
					
					case 1657829882:
					{
						this.iterate();
						break;
					}
					
					
					case 1281091404:
					{
						this.step();
						break;
					}
					
					
					case 1724402127:
					{
						this.reset();
						break;
					}
					
					
					case 1169898256:
					{
						this.init();
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
			baseArr.push("name");
			baseArr.push("focusPoint");
			baseArr.push("enabled");
			baseArr.push("disableFrame");
			baseArr.push("enabledFrame");
			baseArr.push("invincible");
			baseArr.push("crashed");
			baseArr.push("limits");
			baseArr.push("scarves");
			baseArr.push("constraints");
			baseArr.push("airPoints");
			baseArr.push("contactPoints");
			baseArr.push("gravity");
			baseArr.push("startVel");
			baseArr.push("startPos");
			baseArr.push("struct");
			base.__hx_getFields(baseArr);
		}
		
		
	}
}


