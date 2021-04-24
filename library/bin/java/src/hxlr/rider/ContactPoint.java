// Generated by Haxe 4.1.5
package hxlr.rider;

import haxe.root.*;

@SuppressWarnings(value={"rawtypes", "unchecked"})
public class ContactPoint extends haxe.lang.HxObject
{
	public ContactPoint(haxe.lang.EmptyObject empty)
	{
	}
	
	
	public ContactPoint(java.lang.Object _x, java.lang.Object _y, java.lang.Object _friction)
	{
		//line 20 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		hxlr.rider.ContactPoint.__hx_ctor_hxlr_rider_ContactPoint(this, _x, _y, _friction);
	}
	
	
	protected static void __hx_ctor_hxlr_rider_ContactPoint(hxlr.rider.ContactPoint __hx_this, java.lang.Object _x, java.lang.Object _y, java.lang.Object _friction)
	{
		//line 21 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		double _friction1 = ( (haxe.lang.Runtime.eq(_friction, null)) ? (0.0) : (((double) (haxe.lang.Runtime.toDouble(_friction)) )) );
		//line 21 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		double _y1 = ( (haxe.lang.Runtime.eq(_y, null)) ? (0.0) : (((double) (haxe.lang.Runtime.toDouble(_y)) )) );
		//line 21 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		double _x1 = ( (haxe.lang.Runtime.eq(_x, null)) ? (0.0) : (((double) (haxe.lang.Runtime.toDouble(_x)) )) );
		//line 22 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		__hx_this.pos = new hxlr.math.geom.Point(_x1, _y1);
		//line 23 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		__hx_this.dir = new hxlr.math.geom.Point(null, null);
		//line 24 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		__hx_this.vel = new hxlr.math.geom.Point(null, null);
		//line 26 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		__hx_this.friction = _friction1;
	}
	
	
	public hxlr.math.geom.Point pos;
	
	public hxlr.math.geom.Point vel;
	
	public hxlr.math.geom.Point dir;
	
	public hxlr.math.geom.Point gravity;
	
	public double friction;
	
	public void iterate(hxlr.math.geom.Point _gravity)
	{
		//line 31 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		hxlr.math.geom.Point g = ( (( _gravity == null )) ? (this.gravity) : (_gravity) );
		//line 33 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		this.dir.x = ( ( this.pos.x - this.vel.x ) + g.x );
		//line 34 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		this.dir.y = ( ( this.pos.y - this.vel.y ) + g.y );
		//line 36 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		this.vel = this.pos.clone();
		//line 38 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		this.pos = this.pos.add(this.dir);
	}
	
	
	public java.lang.Object serialize()
	{
		//line 44 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		java.lang.Object object = new haxe.lang.DynamicObject(new java.lang.String[]{"position", "velocity"}, new java.lang.Object[]{this.pos, this.vel}, new java.lang.String[]{"friction"}, new double[]{((double) (this.friction) )});
		//line 49 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		return object;
	}
	
	
	public void deserialize(java.lang.Object _object)
	{
		//line 53 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		this.pos = ((hxlr.math.geom.Point) (haxe.lang.Runtime.getField(_object, "position", true)) );
		//line 54 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		this.vel = ((hxlr.math.geom.Point) (haxe.lang.Runtime.getField(_object, "velocity", true)) );
		//line 55 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		this.friction = haxe.lang.Runtime.getField_f(_object, "friction", true);
	}
	
	
	@Override public double __hx_setField_f(java.lang.String field, double value, boolean handleProperties)
	{
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		{
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			boolean __temp_executeDef1 = true;
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (( field != null )) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				switch (field.hashCode())
				{
					case -1424718086:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("friction")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							this.friction = ((double) (value) );
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return value;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (__temp_executeDef1) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				return super.__hx_setField_f(field, value, handleProperties);
			}
			else
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public java.lang.Object __hx_setField(java.lang.String field, java.lang.Object value, boolean handleProperties)
	{
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		{
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			boolean __temp_executeDef1 = true;
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (( field != null )) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				switch (field.hashCode())
				{
					case -1424718086:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("friction")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							this.friction = ((double) (haxe.lang.Runtime.toDouble(value)) );
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return value;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 111188:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("pos")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							this.pos = ((hxlr.math.geom.Point) (value) );
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return value;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 280523342:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("gravity")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							this.gravity = ((hxlr.math.geom.Point) (value) );
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return value;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 116637:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("vel")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							this.vel = ((hxlr.math.geom.Point) (value) );
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return value;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 99469:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("dir")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							this.dir = ((hxlr.math.geom.Point) (value) );
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return value;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (__temp_executeDef1) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				return super.__hx_setField(field, value, handleProperties);
			}
			else
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public java.lang.Object __hx_getField(java.lang.String field, boolean throwErrors, boolean isCheck, boolean handleProperties)
	{
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		{
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			boolean __temp_executeDef1 = true;
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (( field != null )) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				switch (field.hashCode())
				{
					case 1746983807:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("deserialize")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return ((haxe.lang.Function) (new haxe.lang.Closure(this, "deserialize")) );
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 111188:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("pos")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return this.pos;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case -573479200:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("serialize")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return ((haxe.lang.Function) (new haxe.lang.Closure(this, "serialize")) );
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 116637:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("vel")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return this.vel;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 2116356218:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("iterate")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return ((haxe.lang.Function) (new haxe.lang.Closure(this, "iterate")) );
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 99469:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("dir")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return this.dir;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case -1424718086:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("friction")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return this.friction;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 280523342:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("gravity")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return this.gravity;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (__temp_executeDef1) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				return super.__hx_getField(field, throwErrors, isCheck, handleProperties);
			}
			else
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public double __hx_getField_f(java.lang.String field, boolean throwErrors, boolean handleProperties)
	{
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		{
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			boolean __temp_executeDef1 = true;
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (( field != null )) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				switch (field.hashCode())
				{
					case -1424718086:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("friction")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return this.friction;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (__temp_executeDef1) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				return super.__hx_getField_f(field, throwErrors, handleProperties);
			}
			else
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public java.lang.Object __hx_invokeField(java.lang.String field, java.lang.Object[] dynargs)
	{
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		{
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			boolean __temp_executeDef1 = true;
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (( field != null )) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				switch (field.hashCode())
				{
					case 1746983807:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("deserialize")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							this.deserialize(dynargs[0]);
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case 2116356218:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("iterate")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							this.iterate(((hxlr.math.geom.Point) (( (( dynargs.length > 0 )) ? (dynargs[0]) : (null) )) ));
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
					case -573479200:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						if (field.equals("serialize")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
							return this.serialize();
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
			if (__temp_executeDef1) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
				return super.__hx_invokeField(field, dynargs);
			}
			
		}
		
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		return null;
	}
	
	
	@Override public void __hx_getFields(haxe.root.Array<java.lang.String> baseArr)
	{
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		baseArr.push("friction");
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		baseArr.push("gravity");
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		baseArr.push("dir");
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		baseArr.push("vel");
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		baseArr.push("pos");
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\rider\\ContactPoint.hx"
		super.__hx_getFields(baseArr);
	}
	
	
}


