// Generated by Haxe 4.1.5
package hxlr.math.geom;

import haxe.root.*;

@SuppressWarnings(value={"rawtypes", "unchecked"})
public class Line extends haxe.lang.HxObject
{
	public Line(haxe.lang.EmptyObject empty)
	{
	}
	
	
	public Line(hxlr.math.geom.Point _start, hxlr.math.geom.Point _end)
	{
		//line 12 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
		hxlr.math.geom.Line.__hx_ctor_hxlr_math_geom_Line(this, _start, _end);
	}
	
	
	protected static void __hx_ctor_hxlr_math_geom_Line(hxlr.math.geom.Line __hx_this, hxlr.math.geom.Point _start, hxlr.math.geom.Point _end)
	{
	}
	
	
	public hxlr.math.geom.Point start;
	
	@Override public java.lang.Object __hx_setField(java.lang.String field, java.lang.Object value, boolean handleProperties)
	{
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
		{
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
			boolean __temp_executeDef1 = true;
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
			if (( field != null )) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
				switch (field.hashCode())
				{
					case 109757538:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
						if (field.equals("start")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
							this.start = ((hxlr.math.geom.Point) (value) );
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
							return value;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
			if (__temp_executeDef1) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
				return super.__hx_setField(field, value, handleProperties);
			}
			else
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public java.lang.Object __hx_getField(java.lang.String field, boolean throwErrors, boolean isCheck, boolean handleProperties)
	{
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
		{
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
			boolean __temp_executeDef1 = true;
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
			if (( field != null )) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
				switch (field.hashCode())
				{
					case 109757538:
					{
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
						if (field.equals("start")) 
						{
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
							__temp_executeDef1 = false;
							//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
							return this.start;
						}
						
						//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
						break;
					}
					
					
				}
				
			}
			
			//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
			if (__temp_executeDef1) 
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
				return super.__hx_getField(field, throwErrors, isCheck, handleProperties);
			}
			else
			{
				//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
				throw null;
			}
			
		}
		
	}
	
	
	@Override public void __hx_getFields(haxe.root.Array<java.lang.String> baseArr)
	{
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
		baseArr.push("start");
		//line 9 "F:\\OpenLR\\library\\src\\hxlr\\math\\geom\\Line.hx"
		super.__hx_getFields(baseArr);
	}
	
	
}

