// Generated by Haxe 4.1.5
package hxlr.lines;

import haxe.root.*;

@SuppressWarnings(value={"rawtypes", "unchecked"})
public class Accel extends hxlr.lines.LineBase
{
	public Accel(haxe.lang.EmptyObject empty)
	{
		//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		super(haxe.lang.EmptyObject.EMPTY);
	}
	
	
	public Accel(hxlr.math.geom.Point _start, hxlr.math.geom.Point _end, boolean _shift)
	{
		//line 18 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		super(haxe.lang.EmptyObject.EMPTY);
		//line 18 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		hxlr.lines.Accel.__hx_ctor_hxlr_lines_Accel(this, _start, _end, _shift);
	}
	
	
	protected static void __hx_ctor_hxlr_lines_Accel(hxlr.lines.Accel __hx_this, hxlr.math.geom.Point _start, hxlr.math.geom.Point _end, boolean _shift)
	{
		//line 12 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		__hx_this.accConst = 0.1;
		//line 18 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		hxlr.lines.LineBase.__hx_ctor_hxlr_lines_LineBase(__hx_this, _start, _end, _shift, null);
		//line 17 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		{
			//line 20 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			__hx_this.type = 1;
			//line 22 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			__hx_this.tangible = true;
		}
		
	}
	
	
	public double accConst;
	
	public double accx;
	
	public double accy;
	
	@Override public void calculateConstants()
	{
		//line 27 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		super.calculateConstants();
		//line 29 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		this.accx = ( ( this.ny * this.accConst ) * (( (this.shifted) ? (1) : (-1) )) );
		//line 30 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		this.accy = ( ( this.nx * this.accConst ) * (( (this.shifted) ? (-1) : (1) )) );
	}
	
	
	@Override public void collide(hxlr.rider.ContactPoint _point)
	{
		//line 36 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		double _loc5 = ( _point.pos.x - this.start.x );
		//line 37 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		double _loc6 = ( _point.pos.y - this.start.y );
		//line 38 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		double _loc4 = ( ( this.nx * _loc5 ) + ( this.ny * _loc6 ) );
		//line 39 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		double _loc7 = ( (( ( _loc5 * this.dx ) + ( _loc6 * this.dy ) )) * this.invSqrDistance );
		//line 40 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		if (( ( ( _point.dir.x * this.nx ) + ( _point.dir.y * this.ny ) ) > 0 )) 
		{
			//line 42 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			if (( ( ( ( _loc4 > 0 ) && ( _loc4 < this.zone ) ) && ( _loc7 >= this.limStart ) ) && ( _loc7 <= this.limEnd ) )) 
			{
				//line 43 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				_point.pos.x -= ( _loc4 * this.nx );
				//line 44 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				_point.pos.y -= ( _loc4 * this.ny );
				//line 45 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				_point.vel.x = ( ( _point.vel.x + ( ( ( this.ny * _point.friction ) * _loc4 ) * (( (( _point.vel.x < _point.pos.x )) ? (1) : (-1) )) ) ) + this.accx );
				//line 46 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				_point.vel.y = ( ( _point.vel.y - ( ( ( this.nx * _point.friction ) * _loc4 ) * (( (( _point.vel.y < _point.pos.y )) ? (-1) : (1) )) ) ) + this.accy );
			}
			
		}
		
	}
	
	
	@Override public double __hx_setField_f(java.lang.String field, double value, boolean handleProperties)
	{
		//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		{
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			boolean __temp_executeDef1 = true;
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			if (( field != null )) 
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				switch (field.hashCode())
				{
					case 2988056:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accy")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							this.accy = ((double) (value) );
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return value;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2117007202:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accConst")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							this.accConst = ((double) (value) );
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return value;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2988055:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accx")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							this.accx = ((double) (value) );
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return value;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			if (__temp_executeDef1) 
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				return super.__hx_setField_f(field, value, handleProperties);
			}
			else
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public java.lang.Object __hx_setField(java.lang.String field, java.lang.Object value, boolean handleProperties)
	{
		//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		{
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			boolean __temp_executeDef1 = true;
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			if (( field != null )) 
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				switch (field.hashCode())
				{
					case 2988056:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accy")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							this.accy = ((double) (haxe.lang.Runtime.toDouble(value)) );
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return value;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2117007202:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accConst")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							this.accConst = ((double) (haxe.lang.Runtime.toDouble(value)) );
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return value;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2988055:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accx")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							this.accx = ((double) (haxe.lang.Runtime.toDouble(value)) );
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return value;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			if (__temp_executeDef1) 
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				return super.__hx_setField(field, value, handleProperties);
			}
			else
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public java.lang.Object __hx_getField(java.lang.String field, boolean throwErrors, boolean isCheck, boolean handleProperties)
	{
		//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		{
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			boolean __temp_executeDef1 = true;
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			if (( field != null )) 
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				switch (field.hashCode())
				{
					case 949448766:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("collide")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return ((haxe.lang.Function) (new haxe.lang.Closure(this, "collide")) );
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2117007202:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accConst")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return this.accConst;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2030051465:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("calculateConstants")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return ((haxe.lang.Function) (new haxe.lang.Closure(this, "calculateConstants")) );
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2988055:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accx")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return this.accx;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2988056:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accy")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return this.accy;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			if (__temp_executeDef1) 
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				return super.__hx_getField(field, throwErrors, isCheck, handleProperties);
			}
			else
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public double __hx_getField_f(java.lang.String field, boolean throwErrors, boolean handleProperties)
	{
		//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		{
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			boolean __temp_executeDef1 = true;
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			if (( field != null )) 
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				switch (field.hashCode())
				{
					case 2988056:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accy")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return this.accy;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2117007202:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accConst")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return this.accConst;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
					case 2988055:
					{
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						if (field.equals("accx")) 
						{
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							__temp_executeDef1 = false;
							//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
							return this.accx;
						}
						
						//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
			if (__temp_executeDef1) 
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				return super.__hx_getField_f(field, throwErrors, handleProperties);
			}
			else
			{
				//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public void __hx_getFields(haxe.root.Array<java.lang.String> baseArr)
	{
		//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		baseArr.push("accy");
		//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		baseArr.push("accx");
		//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		baseArr.push("accConst");
		//line 10 "F:\\OpenLR\\library\\src\\hxlr\\lines\\Accel.hx"
		super.__hx_getFields(baseArr);
	}
	
	
}


