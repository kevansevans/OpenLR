// Generated by Haxe 4.1.5
#include <hxcpp.h>

#ifndef INCLUDED_haxe_IMap
#include <haxe/IMap.h>
#endif
#ifndef INCLUDED_haxe_ds_StringMap
#include <haxe/ds/StringMap.h>
#endif
#ifndef INCLUDED_hxlr_engine_Cell
#include <hxlr/engine/Cell.h>
#endif
#ifndef INCLUDED_hxlr_engine_Grid
#include <hxlr/engine/Grid.h>
#endif
#ifndef INCLUDED_hxlr_lines_LineBase
#include <hxlr/lines/LineBase.h>
#endif
#ifndef INCLUDED_hxlr_math_geom_Point
#include <hxlr/math/geom/Point.h>
#endif
#ifndef INCLUDED_hxlr_rider_AirPoint
#include <hxlr/rider/AirPoint.h>
#endif
#ifndef INCLUDED_hxlr_rider_ContactPoint
#include <hxlr/rider/ContactPoint.h>
#endif
#ifndef INCLUDED_hxlr_rider_RiderBase
#include <hxlr/rider/RiderBase.h>
#endif
#ifndef INCLUDED_hxlr_rider_Stick
#include <hxlr/rider/Stick.h>
#endif

HX_DEFINE_STACK_FRAME(_hx_pos_b8521e82ba92d84e_17_new,"hxlr.rider.RiderBase","new",0x760c5e31,"hxlr.rider.RiderBase.new","hxlr/rider/RiderBase.hx",17,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_55_init,"hxlr.rider.RiderBase","init",0xd17ec41f,"hxlr.rider.RiderBase.init","hxlr/rider/RiderBase.hx",55,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_113_reset,"hxlr.rider.RiderBase","reset",0xa61cade0,"hxlr.rider.RiderBase.reset","hxlr/rider/RiderBase.hx",113,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_115_step,"hxlr.rider.RiderBase","step",0xd81f705b,"hxlr.rider.RiderBase.step","hxlr/rider/RiderBase.hx",115,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_117_iterate,"hxlr.rider.RiderBase","iterate",0x6b12c44b,"hxlr.rider.RiderBase.iterate","hxlr/rider/RiderBase.hx",117,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_119_checkLimits,"hxlr.rider.RiderBase","checkLimits",0xe9b04e91,"hxlr.rider.RiderBase.checkLimits","hxlr/rider/RiderBase.hx",119,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_121_constrain,"hxlr.rider.RiderBase","constrain",0x24c470c8,"hxlr.rider.RiderBase.constrain","hxlr/rider/RiderBase.hx",121,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_123_constrainScarf,"hxlr.rider.RiderBase","constrainScarf",0x1081fddd,"hxlr.rider.RiderBase.constrainScarf","hxlr/rider/RiderBase.hx",123,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_127_collide,"hxlr.rider.RiderBase","collide",0x75a5f9cf,"hxlr.rider.RiderBase.collide","hxlr/rider/RiderBase.hx",127,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_145_renderRider,"hxlr.rider.RiderBase","renderRider",0xd0b73615,"hxlr.rider.RiderBase.renderRider","hxlr/rider/RiderBase.hx",145,0x4471c421)
HX_LOCAL_STACK_FRAME(_hx_pos_b8521e82ba92d84e_148_set_crashed,"hxlr.rider.RiderBase","set_crashed",0x7bb8cdfa,"hxlr.rider.RiderBase.set_crashed","hxlr/rider/RiderBase.hx",148,0x4471c421)
namespace hxlr{
namespace rider{

void RiderBase_obj::__construct( ::Dynamic _struct, ::hxlr::math::geom::Point _start,::String _name){
            	HX_GC_STACKFRAME(&_hx_pos_b8521e82ba92d84e_17_new)
HXLINE(  38)		this->enabled = true;
HXLINE(  34)		this->invincible = false;
HXLINE(  33)		this->crashed = false;
HXLINE(  46)		this->_hx_struct = _struct;
HXLINE(  47)		this->startPos = _start;
HXLINE(  48)		this->startVel =  ::hxlr::math::geom::Point_obj::__alloc( HX_CTX ,this->_hx_struct->__Field(HX_("x_vel",d6,c3,3a,57),::hx::paccDynamic),this->_hx_struct->__Field(HX_("y_vel",57,58,a1,ea),::hx::paccDynamic));
HXLINE(  49)		this->gravity =  ::hxlr::math::geom::Point_obj::__alloc( HX_CTX ,this->_hx_struct->__Field(HX_("x_grav",47,38,50,f2),::hx::paccDynamic),this->_hx_struct->__Field(HX_("y_grav",a6,94,ab,58),::hx::paccDynamic));
HXLINE(  50)		this->name = _name;
HXLINE(  52)		this->init();
            	}

Dynamic RiderBase_obj::__CreateEmpty() { return new RiderBase_obj; }

void *RiderBase_obj::_hx_vtable = 0;

Dynamic RiderBase_obj::__Create(::hx::DynamicArray inArgs)
{
	::hx::ObjectPtr< RiderBase_obj > _hx_result = new RiderBase_obj();
	_hx_result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return _hx_result;
}

bool RiderBase_obj::_hx_isInstanceOf(int inClassId) {
	return inClassId==(int)0x00000001 || inClassId==(int)0x42765d27;
}

void RiderBase_obj::init(){
            	HX_GC_STACKFRAME(&_hx_pos_b8521e82ba92d84e_55_init)
HXLINE(  57)		this->contactPoints = ::Array_obj< ::Dynamic>::__new();
HXLINE(  58)		{
HXLINE(  58)			int _g = 0;
HXDLIN(  58)			::Array< ::Dynamic> _g1 = ( (::Array< ::Dynamic>)(this->_hx_struct->__Field(HX_("contactPoints",e3,b8,38,0c),::hx::paccDynamic)) );
HXDLIN(  58)			while((_g < _g1->length)){
HXLINE(  58)				 ::Dynamic dot = _g1->__get(_g);
HXDLIN(  58)				_g = (_g + 1);
HXLINE(  59)				::Array< ::Dynamic> _hx_tmp = this->contactPoints;
HXDLIN(  59)				_hx_tmp->push( ::hxlr::rider::ContactPoint_obj::__alloc( HX_CTX ,dot->__Field(HX_("x",78,00,00,00),::hx::paccDynamic),dot->__Field(HX_("y",79,00,00,00),::hx::paccDynamic),dot->__Field(HX_("fr",4c,59,00,00),::hx::paccDynamic)));
            			}
            		}
HXLINE(  62)		this->airPoints = ::Array_obj< ::Dynamic>::__new();
HXLINE(  63)		{
HXLINE(  63)			int _g2 = 0;
HXDLIN(  63)			::Array< ::Dynamic> _g3 = ( (::Array< ::Dynamic>)(this->_hx_struct->__Field(HX_("scarfPoints",c8,fb,f5,63),::hx::paccDynamic)) );
HXDLIN(  63)			while((_g2 < _g3->length)){
HXLINE(  63)				 ::Dynamic dot = _g3->__get(_g2);
HXDLIN(  63)				_g2 = (_g2 + 1);
HXLINE(  64)				::Array< ::Dynamic> _hx_tmp = this->airPoints;
HXDLIN(  64)				_hx_tmp->push( ::hxlr::rider::AirPoint_obj::__alloc( HX_CTX ,( (Float)(dot->__Field(HX_("x",78,00,00,00),::hx::paccDynamic)) ),( (Float)(dot->__Field(HX_("y",79,00,00,00),::hx::paccDynamic)) ),( (Float)(dot->__Field(HX_("fr",4c,59,00,00),::hx::paccDynamic)) )));
            			}
            		}
HXLINE(  67)		{
HXLINE(  67)			int _g4 = 0;
HXDLIN(  67)			::Array< ::Dynamic> _g5 = this->contactPoints;
HXDLIN(  67)			while((_g4 < _g5->length)){
HXLINE(  67)				 ::hxlr::rider::ContactPoint point = _g5->__get(_g4).StaticCast<  ::hxlr::rider::ContactPoint >();
HXDLIN(  67)				_g4 = (_g4 + 1);
HXLINE(  69)				 ::hxlr::math::geom::Point point1 = point->pos;
HXDLIN(  69)				point1->x = (point1->x * ( (Float)(this->_hx_struct->__Field(HX_("scale",8a,ce,ce,78),::hx::paccDynamic)) ));
HXLINE(  70)				 ::hxlr::math::geom::Point point2 = point->pos;
HXDLIN(  70)				point2->y = (point2->y * ( (Float)(this->_hx_struct->__Field(HX_("scale",8a,ce,ce,78),::hx::paccDynamic)) ));
HXLINE(  72)				 ::hxlr::math::geom::Point point3 = point->pos;
HXDLIN(  72)				point3->x = (point3->x + this->startPos->x);
HXLINE(  73)				 ::hxlr::math::geom::Point point4 = point->pos;
HXDLIN(  73)				point4->y = (point4->y + this->startPos->y);
HXLINE(  75)				point->vel->x = (point->pos->x - this->startVel->x);
HXLINE(  76)				point->vel->y = point->pos->y;
            			}
            		}
HXLINE(  80)		{
HXLINE(  80)			int _g6 = 0;
HXDLIN(  80)			::Array< ::Dynamic> _g7 = this->airPoints;
HXDLIN(  80)			while((_g6 < _g7->length)){
HXLINE(  80)				 ::hxlr::rider::AirPoint point = _g7->__get(_g6).StaticCast<  ::hxlr::rider::AirPoint >();
HXDLIN(  80)				_g6 = (_g6 + 1);
HXLINE(  82)				 ::hxlr::math::geom::Point point1 = point->pos;
HXDLIN(  82)				point1->x = (point1->x * ( (Float)(this->_hx_struct->__Field(HX_("scale",8a,ce,ce,78),::hx::paccDynamic)) ));
HXLINE(  83)				 ::hxlr::math::geom::Point point2 = point->pos;
HXDLIN(  83)				point2->y = (point2->y * ( (Float)(this->_hx_struct->__Field(HX_("scale",8a,ce,ce,78),::hx::paccDynamic)) ));
HXLINE(  85)				 ::hxlr::math::geom::Point point3 = point->pos;
HXDLIN(  85)				point3->x = (point3->x + this->startPos->x);
HXLINE(  86)				 ::hxlr::math::geom::Point point4 = point->pos;
HXDLIN(  86)				point4->y = (point4->y + this->startPos->y);
HXLINE(  88)				point->vel->x = (point->pos->x - this->startVel->x);
HXLINE(  89)				point->vel->y = point->pos->y;
            			}
            		}
HXLINE(  93)		this->constraints = ::Array_obj< ::Dynamic>::__new();
HXLINE(  94)		{
HXLINE(  94)			int _g8 = 0;
HXDLIN(  94)			::Array< ::Dynamic> _g9 = ( (::Array< ::Dynamic>)(this->_hx_struct->__Field(HX_("bones",af,58,f7,b6),::hx::paccDynamic)) );
HXDLIN(  94)			while((_g8 < _g9->length)){
HXLINE(  94)				 ::Dynamic edge = _g9->__get(_g8);
HXDLIN(  94)				_g8 = (_g8 + 1);
HXLINE(  95)				 ::hxlr::rider::Stick stick =  ::hxlr::rider::Stick_obj::__alloc( HX_CTX ,this->contactPoints->__get(( (int)(edge->__Field(HX_("a",61,00,00,00),::hx::paccDynamic)) )).StaticCast<  ::hxlr::rider::ContactPoint >(),this->contactPoints->__get(( (int)(edge->__Field(HX_("b",62,00,00,00),::hx::paccDynamic)) )).StaticCast<  ::hxlr::rider::ContactPoint >(),( (::String)(edge->__Field(HX_("type",ba,f2,08,4d),::hx::paccDynamic)) ),::hx::ObjectPtr<OBJ_>(this));
HXLINE(  96)				stick->crashable = ( (bool)(edge->__Field(HX_("crashable",01,ad,93,ea),::hx::paccDynamic)) );
HXLINE(  97)				this->constraints->push(stick);
            			}
            		}
HXLINE( 100)		this->scarves = ::Array_obj< ::Dynamic>::__new();
HXLINE( 101)		{
HXLINE( 101)			int _g10 = 0;
HXDLIN( 101)			int _g11 = this->airPoints->length;
HXDLIN( 101)			while((_g10 < _g11)){
HXLINE( 101)				_g10 = (_g10 + 1);
HXDLIN( 101)				int point = (_g10 - 1);
HXLINE( 102)				if (::hx::IsNull( this->airPoints->__get((point + 1)).StaticCast<  ::hxlr::rider::AirPoint >() )) {
HXLINE( 102)					goto _hx_goto_6;
            				}
HXLINE( 103)				::Array< ::Dynamic> _hx_tmp = this->scarves;
HXDLIN( 103)				_hx_tmp->push( ::hxlr::rider::Stick_obj::__alloc( HX_CTX ,this->airPoints->__get(point).StaticCast<  ::hxlr::rider::AirPoint >(),this->airPoints->__get((point + 1)).StaticCast<  ::hxlr::rider::AirPoint >(),HX_("SCARF",a5,0b,bd,f6),::hx::ObjectPtr<OBJ_>(this)));
            			}
            			_hx_goto_6:;
            		}
HXLINE( 105)		::Array< ::Dynamic> _hx_tmp = this->scarves;
HXDLIN( 105)		_hx_tmp->unshift( ::hxlr::rider::Stick_obj::__alloc( HX_CTX ,this->contactPoints->__get(( (int)(this->_hx_struct->__Field(HX_("scarfAnchor",1a,24,39,cd),::hx::paccDynamic)) )).StaticCast<  ::hxlr::rider::ContactPoint >(),this->airPoints->__get(0).StaticCast<  ::hxlr::rider::AirPoint >(),HX_("SCARF",a5,0b,bd,f6),::hx::ObjectPtr<OBJ_>(this)));
HXLINE( 107)		this->limits = ( (::Array< ::Dynamic>)(this->_hx_struct->__Field(HX_("limits",d8,34,fa,eb),::hx::paccDynamic)) );
HXLINE( 109)		this->focusPoint = this->contactPoints->__get(( (int)(this->_hx_struct->__Field(HX_("camera",a5,46,8c,b7),::hx::paccDynamic)) )).StaticCast<  ::hxlr::rider::ContactPoint >();
HXLINE( 111)		this->set_crashed(false);
            	}


HX_DEFINE_DYNAMIC_FUNC0(RiderBase_obj,init,(void))

void RiderBase_obj::reset(){
            	HX_STACKFRAME(&_hx_pos_b8521e82ba92d84e_113_reset)
            	}


HX_DEFINE_DYNAMIC_FUNC0(RiderBase_obj,reset,(void))

void RiderBase_obj::step(){
            	HX_STACKFRAME(&_hx_pos_b8521e82ba92d84e_115_step)
            	}


HX_DEFINE_DYNAMIC_FUNC0(RiderBase_obj,step,(void))

void RiderBase_obj::iterate(){
            	HX_STACKFRAME(&_hx_pos_b8521e82ba92d84e_117_iterate)
            	}


HX_DEFINE_DYNAMIC_FUNC0(RiderBase_obj,iterate,(void))

void RiderBase_obj::checkLimits(){
            	HX_STACKFRAME(&_hx_pos_b8521e82ba92d84e_119_checkLimits)
            	}


HX_DEFINE_DYNAMIC_FUNC0(RiderBase_obj,checkLimits,(void))

void RiderBase_obj::constrain(){
            	HX_STACKFRAME(&_hx_pos_b8521e82ba92d84e_121_constrain)
            	}


HX_DEFINE_DYNAMIC_FUNC0(RiderBase_obj,constrain,(void))

void RiderBase_obj::constrainScarf(){
            	HX_STACKFRAME(&_hx_pos_b8521e82ba92d84e_123_constrainScarf)
            	}


HX_DEFINE_DYNAMIC_FUNC0(RiderBase_obj,constrainScarf,(void))

void RiderBase_obj::collide(){
            	HX_STACKFRAME(&_hx_pos_b8521e82ba92d84e_127_collide)
HXDLIN( 127)		int _g = 0;
HXDLIN( 127)		::Array< ::Dynamic> _g1 = this->contactPoints;
HXDLIN( 127)		while((_g < _g1->length)){
HXDLIN( 127)			 ::hxlr::rider::ContactPoint point = _g1->__get(_g).StaticCast<  ::hxlr::rider::ContactPoint >();
HXDLIN( 127)			_g = (_g + 1);
HXLINE( 128)			 ::Dynamic gridPos = ::hxlr::engine::Cell_obj::getInfo(point->pos->x,point->pos->y);
HXLINE( 129)			{
HXLINE( 129)				int _g2 = -1;
HXDLIN( 129)				while((_g2 < 2)){
HXLINE( 129)					_g2 = (_g2 + 1);
HXDLIN( 129)					int _x = (_g2 - 1);
HXDLIN( 129)					{
HXLINE( 129)						int _g = -1;
HXDLIN( 129)						while((_g < 2)){
HXLINE( 129)							_g = (_g + 1);
HXDLIN( 129)							int _y = (_g - 1);
HXLINE( 130)							::String key = ( (::String)((((HX_("x",78,00,00,00) + (gridPos->__Field(HX_("x",78,00,00,00),::hx::paccDynamic) + _x)) + HX_("y",79,00,00,00)) + (gridPos->__Field(HX_("y",79,00,00,00),::hx::paccDynamic) + _y))) );
HXLINE( 131)							if (::hx::IsNull( ::hxlr::engine::Grid_obj::registry->get(key) )) {
HXLINE( 131)								continue;
            							}
            							else {
HXLINE( 133)								 ::hxlr::engine::Cell _hx_register = ( ( ::hxlr::engine::Cell)(::hxlr::engine::Grid_obj::registry->get(key)) );
HXLINE( 134)								{
HXLINE( 134)									int _g = 0;
HXDLIN( 134)									::Array< ::Dynamic> _g1 = _hx_register->collidable;
HXDLIN( 134)									while((_g < _g1->length)){
HXLINE( 134)										 ::hxlr::lines::LineBase line = _g1->__get(_g).StaticCast<  ::hxlr::lines::LineBase >();
HXDLIN( 134)										_g = (_g + 1);
HXLINE( 136)										if (::hx::IsNull( line )) {
HXLINE( 136)											continue;
            										}
HXLINE( 138)										line->collide(point);
            									}
            								}
            							}
            						}
            					}
            				}
            			}
            		}
            	}


HX_DEFINE_DYNAMIC_FUNC0(RiderBase_obj,collide,(void))

void RiderBase_obj::renderRider(){
            	HX_STACKFRAME(&_hx_pos_b8521e82ba92d84e_145_renderRider)
            	}


HX_DEFINE_DYNAMIC_FUNC0(RiderBase_obj,renderRider,(void))

bool RiderBase_obj::set_crashed(bool _value){
            	HX_STACKFRAME(&_hx_pos_b8521e82ba92d84e_148_set_crashed)
HXLINE( 149)		if (this->invincible) {
HXLINE( 149)			return ( (bool)((this->crashed = null())) );
            		}
HXLINE( 150)		return ( (bool)((this->crashed = _value)) );
            	}


HX_DEFINE_DYNAMIC_FUNC1(RiderBase_obj,set_crashed,return )


::hx::ObjectPtr< RiderBase_obj > RiderBase_obj::__new( ::Dynamic _struct, ::hxlr::math::geom::Point _start,::String _name) {
	::hx::ObjectPtr< RiderBase_obj > __this = new RiderBase_obj();
	__this->__construct(_struct,_start,_name);
	return __this;
}

::hx::ObjectPtr< RiderBase_obj > RiderBase_obj::__alloc(::hx::Ctx *_hx_ctx, ::Dynamic _struct, ::hxlr::math::geom::Point _start,::String _name) {
	RiderBase_obj *__this = (RiderBase_obj*)(::hx::Ctx::alloc(_hx_ctx, sizeof(RiderBase_obj), true, "hxlr.rider.RiderBase"));
	*(void **)__this = RiderBase_obj::_hx_vtable;
	__this->__construct(_struct,_start,_name);
	return __this;
}

RiderBase_obj::RiderBase_obj()
{
}

void RiderBase_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(RiderBase);
	HX_MARK_MEMBER_NAME(_hx_struct,"struct");
	HX_MARK_MEMBER_NAME(startPos,"startPos");
	HX_MARK_MEMBER_NAME(startVel,"startVel");
	HX_MARK_MEMBER_NAME(gravity,"gravity");
	HX_MARK_MEMBER_NAME(contactPoints,"contactPoints");
	HX_MARK_MEMBER_NAME(airPoints,"airPoints");
	HX_MARK_MEMBER_NAME(constraints,"constraints");
	HX_MARK_MEMBER_NAME(scarves,"scarves");
	HX_MARK_MEMBER_NAME(limits,"limits");
	HX_MARK_MEMBER_NAME(crashed,"crashed");
	HX_MARK_MEMBER_NAME(invincible,"invincible");
	HX_MARK_MEMBER_NAME(enabledFrame,"enabledFrame");
	HX_MARK_MEMBER_NAME(disableFrame,"disableFrame");
	HX_MARK_MEMBER_NAME(enabled,"enabled");
	HX_MARK_MEMBER_NAME(focusPoint,"focusPoint");
	HX_MARK_MEMBER_NAME(name,"name");
	HX_MARK_END_CLASS();
}

void RiderBase_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_hx_struct,"struct");
	HX_VISIT_MEMBER_NAME(startPos,"startPos");
	HX_VISIT_MEMBER_NAME(startVel,"startVel");
	HX_VISIT_MEMBER_NAME(gravity,"gravity");
	HX_VISIT_MEMBER_NAME(contactPoints,"contactPoints");
	HX_VISIT_MEMBER_NAME(airPoints,"airPoints");
	HX_VISIT_MEMBER_NAME(constraints,"constraints");
	HX_VISIT_MEMBER_NAME(scarves,"scarves");
	HX_VISIT_MEMBER_NAME(limits,"limits");
	HX_VISIT_MEMBER_NAME(crashed,"crashed");
	HX_VISIT_MEMBER_NAME(invincible,"invincible");
	HX_VISIT_MEMBER_NAME(enabledFrame,"enabledFrame");
	HX_VISIT_MEMBER_NAME(disableFrame,"disableFrame");
	HX_VISIT_MEMBER_NAME(enabled,"enabled");
	HX_VISIT_MEMBER_NAME(focusPoint,"focusPoint");
	HX_VISIT_MEMBER_NAME(name,"name");
}

::hx::Val RiderBase_obj::__Field(const ::String &inName,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { return ::hx::Val( name ); }
		if (HX_FIELD_EQ(inName,"init") ) { return ::hx::Val( init_dyn() ); }
		if (HX_FIELD_EQ(inName,"step") ) { return ::hx::Val( step_dyn() ); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"reset") ) { return ::hx::Val( reset_dyn() ); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"struct") ) { return ::hx::Val( _hx_struct ); }
		if (HX_FIELD_EQ(inName,"limits") ) { return ::hx::Val( limits ); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"gravity") ) { return ::hx::Val( gravity ); }
		if (HX_FIELD_EQ(inName,"scarves") ) { return ::hx::Val( scarves ); }
		if (HX_FIELD_EQ(inName,"crashed") ) { return ::hx::Val( crashed ); }
		if (HX_FIELD_EQ(inName,"enabled") ) { return ::hx::Val( enabled ); }
		if (HX_FIELD_EQ(inName,"iterate") ) { return ::hx::Val( iterate_dyn() ); }
		if (HX_FIELD_EQ(inName,"collide") ) { return ::hx::Val( collide_dyn() ); }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"startPos") ) { return ::hx::Val( startPos ); }
		if (HX_FIELD_EQ(inName,"startVel") ) { return ::hx::Val( startVel ); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"airPoints") ) { return ::hx::Val( airPoints ); }
		if (HX_FIELD_EQ(inName,"constrain") ) { return ::hx::Val( constrain_dyn() ); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"invincible") ) { return ::hx::Val( invincible ); }
		if (HX_FIELD_EQ(inName,"focusPoint") ) { return ::hx::Val( focusPoint ); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"constraints") ) { return ::hx::Val( constraints ); }
		if (HX_FIELD_EQ(inName,"checkLimits") ) { return ::hx::Val( checkLimits_dyn() ); }
		if (HX_FIELD_EQ(inName,"renderRider") ) { return ::hx::Val( renderRider_dyn() ); }
		if (HX_FIELD_EQ(inName,"set_crashed") ) { return ::hx::Val( set_crashed_dyn() ); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"enabledFrame") ) { return ::hx::Val( enabledFrame ); }
		if (HX_FIELD_EQ(inName,"disableFrame") ) { return ::hx::Val( disableFrame ); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"contactPoints") ) { return ::hx::Val( contactPoints ); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"constrainScarf") ) { return ::hx::Val( constrainScarf_dyn() ); }
	}
	return super::__Field(inName,inCallProp);
}

::hx::Val RiderBase_obj::__SetField(const ::String &inName,const ::hx::Val &inValue,::hx::PropertyAccess inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { name=inValue.Cast< ::String >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"struct") ) { _hx_struct=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"limits") ) { limits=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"gravity") ) { gravity=inValue.Cast<  ::hxlr::math::geom::Point >(); return inValue; }
		if (HX_FIELD_EQ(inName,"scarves") ) { scarves=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
		if (HX_FIELD_EQ(inName,"crashed") ) { if (inCallProp == ::hx::paccAlways) return ::hx::Val( set_crashed(inValue.Cast<  ::Dynamic >()) );crashed=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"enabled") ) { enabled=inValue.Cast< bool >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"startPos") ) { startPos=inValue.Cast<  ::hxlr::math::geom::Point >(); return inValue; }
		if (HX_FIELD_EQ(inName,"startVel") ) { startVel=inValue.Cast<  ::hxlr::math::geom::Point >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"airPoints") ) { airPoints=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"invincible") ) { invincible=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"focusPoint") ) { focusPoint=inValue.Cast<  ::hxlr::rider::ContactPoint >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"constraints") ) { constraints=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"enabledFrame") ) { enabledFrame=inValue.Cast<  ::Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"disableFrame") ) { disableFrame=inValue.Cast<  ::Dynamic >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"contactPoints") ) { contactPoints=inValue.Cast< ::Array< ::Dynamic> >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void RiderBase_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_("struct",55,3a,39,11));
	outFields->push(HX_("startPos",52,0a,99,42));
	outFields->push(HX_("startVel",1b,8f,9d,42));
	outFields->push(HX_("gravity",4e,6e,ff,77));
	outFields->push(HX_("contactPoints",e3,b8,38,0c));
	outFields->push(HX_("airPoints",4d,00,7b,13));
	outFields->push(HX_("constraints",76,51,b4,17));
	outFields->push(HX_("scarves",83,8b,0b,69));
	outFields->push(HX_("limits",d8,34,fa,eb));
	outFields->push(HX_("crashed",06,20,ad,cf));
	outFields->push(HX_("invincible",9f,d9,73,2f));
	outFields->push(HX_("enabledFrame",ec,ef,5a,0b));
	outFields->push(HX_("disableFrame",25,95,07,45));
	outFields->push(HX_("enabled",81,04,31,7e));
	outFields->push(HX_("focusPoint",58,55,f1,88));
	outFields->push(HX_("name",4b,72,ff,48));
	super::__GetFields(outFields);
};

#ifdef HXCPP_SCRIPTABLE
static ::hx::StorageInfo RiderBase_obj_sMemberStorageInfo[] = {
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(RiderBase_obj,_hx_struct),HX_("struct",55,3a,39,11)},
	{::hx::fsObject /*  ::hxlr::math::geom::Point */ ,(int)offsetof(RiderBase_obj,startPos),HX_("startPos",52,0a,99,42)},
	{::hx::fsObject /*  ::hxlr::math::geom::Point */ ,(int)offsetof(RiderBase_obj,startVel),HX_("startVel",1b,8f,9d,42)},
	{::hx::fsObject /*  ::hxlr::math::geom::Point */ ,(int)offsetof(RiderBase_obj,gravity),HX_("gravity",4e,6e,ff,77)},
	{::hx::fsObject /* ::Array< ::Dynamic> */ ,(int)offsetof(RiderBase_obj,contactPoints),HX_("contactPoints",e3,b8,38,0c)},
	{::hx::fsObject /* ::Array< ::Dynamic> */ ,(int)offsetof(RiderBase_obj,airPoints),HX_("airPoints",4d,00,7b,13)},
	{::hx::fsObject /* ::Array< ::Dynamic> */ ,(int)offsetof(RiderBase_obj,constraints),HX_("constraints",76,51,b4,17)},
	{::hx::fsObject /* ::Array< ::Dynamic> */ ,(int)offsetof(RiderBase_obj,scarves),HX_("scarves",83,8b,0b,69)},
	{::hx::fsObject /* ::Array< ::Dynamic> */ ,(int)offsetof(RiderBase_obj,limits),HX_("limits",d8,34,fa,eb)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(RiderBase_obj,crashed),HX_("crashed",06,20,ad,cf)},
	{::hx::fsBool,(int)offsetof(RiderBase_obj,invincible),HX_("invincible",9f,d9,73,2f)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(RiderBase_obj,enabledFrame),HX_("enabledFrame",ec,ef,5a,0b)},
	{::hx::fsObject /*  ::Dynamic */ ,(int)offsetof(RiderBase_obj,disableFrame),HX_("disableFrame",25,95,07,45)},
	{::hx::fsBool,(int)offsetof(RiderBase_obj,enabled),HX_("enabled",81,04,31,7e)},
	{::hx::fsObject /*  ::hxlr::rider::ContactPoint */ ,(int)offsetof(RiderBase_obj,focusPoint),HX_("focusPoint",58,55,f1,88)},
	{::hx::fsString,(int)offsetof(RiderBase_obj,name),HX_("name",4b,72,ff,48)},
	{ ::hx::fsUnknown, 0, null()}
};
static ::hx::StaticInfo *RiderBase_obj_sStaticStorageInfo = 0;
#endif

static ::String RiderBase_obj_sMemberFields[] = {
	HX_("struct",55,3a,39,11),
	HX_("startPos",52,0a,99,42),
	HX_("startVel",1b,8f,9d,42),
	HX_("gravity",4e,6e,ff,77),
	HX_("contactPoints",e3,b8,38,0c),
	HX_("airPoints",4d,00,7b,13),
	HX_("constraints",76,51,b4,17),
	HX_("scarves",83,8b,0b,69),
	HX_("limits",d8,34,fa,eb),
	HX_("crashed",06,20,ad,cf),
	HX_("invincible",9f,d9,73,2f),
	HX_("enabledFrame",ec,ef,5a,0b),
	HX_("disableFrame",25,95,07,45),
	HX_("enabled",81,04,31,7e),
	HX_("focusPoint",58,55,f1,88),
	HX_("name",4b,72,ff,48),
	HX_("init",10,3b,bb,45),
	HX_("reset",cf,49,c8,e6),
	HX_("step",4c,e7,5b,4c),
	HX_("iterate",fa,79,d0,e2),
	HX_("checkLimits",c0,07,0c,ce),
	HX_("constrain",37,30,9e,4f),
	HX_("constrainScarf",0e,ec,90,7e),
	HX_("collide",7e,af,63,ed),
	HX_("renderRider",44,ef,12,b5),
	HX_("set_crashed",29,87,14,60),
	::String(null()) };

::hx::Class RiderBase_obj::__mClass;

void RiderBase_obj::__register()
{
	RiderBase_obj _hx_dummy;
	RiderBase_obj::_hx_vtable = *(void **)&_hx_dummy;
	::hx::Static(__mClass) = new ::hx::Class_obj();
	__mClass->mName = HX_("hxlr.rider.RiderBase",bf,71,bb,9c);
	__mClass->mSuper = &super::__SGetClass();
	__mClass->mConstructEmpty = &__CreateEmpty;
	__mClass->mConstructArgs = &__Create;
	__mClass->mGetStaticField = &::hx::Class_obj::GetNoStaticField;
	__mClass->mSetStaticField = &::hx::Class_obj::SetNoStaticField;
	__mClass->mStatics = ::hx::Class_obj::dupFunctions(0 /* sStaticFields */);
	__mClass->mMembers = ::hx::Class_obj::dupFunctions(RiderBase_obj_sMemberFields);
	__mClass->mCanCast = ::hx::TCanCast< RiderBase_obj >;
#ifdef HXCPP_SCRIPTABLE
	__mClass->mMemberStorageInfo = RiderBase_obj_sMemberStorageInfo;
#endif
#ifdef HXCPP_SCRIPTABLE
	__mClass->mStaticStorageInfo = RiderBase_obj_sStaticStorageInfo;
#endif
	::hx::_hx_RegisterClass(__mClass->mName, __mClass);
}

} // end namespace hxlr
} // end namespace rider