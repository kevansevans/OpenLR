// Generated by Haxe 4.1.5

#pragma warning disable 109, 114, 219, 429, 168, 162
namespace hxlr.engine {
	public class Cell : global::haxe.lang.HxObject {
		
		static Cell() {
			unchecked{
				global::hxlr.engine.Cell.size = 14;
				global::hxlr.engine.Cell.cellList = new global::Array<object>();
			}
		}
		
		
		public Cell(global::haxe.lang.EmptyObject empty) {
		}
		
		
		public Cell(object _info) {
			global::hxlr.engine.Cell.__hx_ctor_hxlr_engine_Cell(this, _info);
		}
		
		
		protected static void __hx_ctor_hxlr_engine_Cell(global::hxlr.engine.Cell __hx_this, object _info) {
			__hx_this.info = _info;
			__hx_this.allLines = new global::Array<object>();
			__hx_this.collidable = new global::Array<object>();
			__hx_this.intangible = new global::Array<object>();
		}
		
		
		public static int size;
		
		public static global::Array<object> cellList;
		
		public static object getInfo(double _x, double _y) {
			unchecked {
				int info = ((int) (((double) (((int) (global::System.Math.Floor(((double) (( _x / 14 )) ))) )) )) );
				int info1 = ((int) (((double) (((int) (global::System.Math.Floor(((double) (( _y / 14 )) ))) )) )) );
				double info2 = ( _x - ( 14 * ((int) (global::System.Math.Floor(((double) (( _x / 14 )) ))) ) ) );
				object info3 = null;
				{
					double __temp_odecl1 = ( _y - ( 14 * ((int) (global::System.Math.Floor(((double) (( _y / 14 )) ))) ) ) );
					info3 = new global::haxe.lang.DynamicObject(new int[]{}, new object[]{}, new int[]{120, 121, 23089, 23090}, new double[]{((double) (info) ), ((double) (info1) ), info2, __temp_odecl1});
				}
				
				string __temp_expr2 = global::haxe.lang.Runtime.toString(global::haxe.lang.Runtime.setField(info3, "key", 5343647, global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat(global::haxe.lang.Runtime.concat("x", global::haxe.lang.Runtime.toString(((int) (global::haxe.lang.Runtime.getField_f(info3, "x", 120, true)) ))), "y"), global::haxe.lang.Runtime.toString(((int) (global::haxe.lang.Runtime.getField_f(info3, "y", 121, true)) )))));
				return info3;
			}
		}
		
		
		public object info;
		
		public global::Array<object> allLines;
		
		public global::Array<object> collidable;
		
		public global::Array<object> intangible;
		
		public virtual void addLine(global::hxlr.lines.LineBase _line) {
			if (this.allLines.contains(_line)) {
				return;
			}
			
			this.allLines.push(_line);
			if (_line.tangible) {
				this.collidable[(_line.id).@value] = _line;
			}
			else {
				this.intangible[(_line.id).@value] = _line;
			}
			
			if ( ! (global::hxlr.engine.Cell.cellList.contains(this)) ) {
				global::hxlr.engine.Cell.cellList.push(this);
			}
			
		}
		
		
		public virtual void removeLine(global::hxlr.lines.LineBase _line) {
			if ( ! (this.allLines.contains(_line)) ) {
				return;
			}
			
			this.allLines.@remove(_line);
			if (_line.tangible) {
				this.collidable.@remove(_line);
			}
			else {
				this.intangible.@remove(_line);
			}
			
			if (( this.allLines.length == 0 )) {
				global::hxlr.engine.Cell.cellList.@remove(this);
			}
			
		}
		
		
		public override double __hx_setField_f(string field, int hash, double @value, bool handleProperties) {
			unchecked {
				switch (hash) {
					case 1169897582:
					{
						this.info = ((object) (@value) );
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
					case 1040027997:
					{
						this.intangible = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (@value) ))) );
						return @value;
					}
					
					
					case 1338143777:
					{
						this.collidable = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (@value) ))) );
						return @value;
					}
					
					
					case 1843764510:
					{
						this.allLines = ((global::Array<object>) (global::Array<object>.__hx_cast<object>(((global::Array) (@value) ))) );
						return @value;
					}
					
					
					case 1169897582:
					{
						this.info = ((object) (@value) );
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
					case 1154634328:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "removeLine", 1154634328)) );
					}
					
					
					case 66083509:
					{
						return ((global::haxe.lang.Function) (new global::haxe.lang.Closure(this, "addLine", 66083509)) );
					}
					
					
					case 1040027997:
					{
						return this.intangible;
					}
					
					
					case 1338143777:
					{
						return this.collidable;
					}
					
					
					case 1843764510:
					{
						return this.allLines;
					}
					
					
					case 1169897582:
					{
						return this.info;
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
					case 1169897582:
					{
						return ((double) (global::haxe.lang.Runtime.toDouble(this.info)) );
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
					case 1154634328:
					{
						this.removeLine(((global::hxlr.lines.LineBase) (dynargs[0]) ));
						break;
					}
					
					
					case 66083509:
					{
						this.addLine(((global::hxlr.lines.LineBase) (dynargs[0]) ));
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
			baseArr.push("intangible");
			baseArr.push("collidable");
			baseArr.push("allLines");
			baseArr.push("info");
			base.__hx_getFields(baseArr);
		}
		
		
	}
}

