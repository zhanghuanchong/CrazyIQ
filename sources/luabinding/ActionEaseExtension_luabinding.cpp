/*
** Lua binding: ActionEaseExtension_luabinding
** Generated automatically by tolua++-1.0.92 on Wed Apr  2 07:57:48 2014.
*/

#include "ActionEaseExtension_luabinding.h"
#include "CCLuaEngine.h"

using namespace cocos2d;




#include "../ext/CrazyIQ.h"
#include "../ext/ActionEaseExtension.h"
#include "tolua_fix.h"

/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 tolua_usertype(tolua_S,"CCEaseCubicIn");
 tolua_usertype(tolua_S,"CCEaseCubicOut");
 tolua_usertype(tolua_S,"CCActionInterval");
 tolua_usertype(tolua_S,"CCActionEase");
 tolua_usertype(tolua_S,"CCEaseCubicInOut");
}

/* method: create of class  CCEaseCubicIn */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_create00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"CCEaseCubicIn",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,2,"CCActionInterval",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCActionInterval* pAction = ((CCActionInterval*)  tolua_tousertype(tolua_S,2,0));
  {
   CCEaseCubicIn* tolua_ret = (CCEaseCubicIn*)  CCEaseCubicIn::create(pAction);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCEaseCubicIn");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'create'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: create of class  CCEaseCubicOut */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_create00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"CCEaseCubicOut",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,2,"CCActionInterval",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCActionInterval* pAction = ((CCActionInterval*)  tolua_tousertype(tolua_S,2,0));
  {
   CCEaseCubicOut* tolua_ret = (CCEaseCubicOut*)  CCEaseCubicOut::create(pAction);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCEaseCubicOut");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'create'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: create of class  CCEaseCubicInOut */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_create00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"CCEaseCubicInOut",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,2,"CCActionInterval",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCActionInterval* pAction = ((CCActionInterval*)  tolua_tousertype(tolua_S,2,0));
  {
   CCEaseCubicInOut* tolua_ret = (CCEaseCubicInOut*)  CCEaseCubicInOut::create(pAction);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCEaseCubicInOut");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'create'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* Open function */
TOLUA_API int tolua_ActionEaseExtension_luabinding_open (lua_State* tolua_S)
{
 tolua_open(tolua_S);
 tolua_reg_types(tolua_S);
 tolua_module(tolua_S,NULL,0);
 tolua_beginmodule(tolua_S,NULL);
  tolua_cclass(tolua_S,"CCEaseCubicIn","CCEaseCubicIn","CCActionEase",NULL);
  tolua_beginmodule(tolua_S,"CCEaseCubicIn");
   tolua_function(tolua_S,"create",tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_create00);
  tolua_endmodule(tolua_S);
  tolua_cclass(tolua_S,"CCEaseCubicOut","CCEaseCubicOut","CCActionEase",NULL);
  tolua_beginmodule(tolua_S,"CCEaseCubicOut");
   tolua_function(tolua_S,"create",tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_create00);
  tolua_endmodule(tolua_S);
  tolua_cclass(tolua_S,"CCEaseCubicInOut","CCEaseCubicInOut","CCActionEase",NULL);
  tolua_beginmodule(tolua_S,"CCEaseCubicInOut");
   tolua_function(tolua_S,"create",tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_create00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_ActionEaseExtension_luabinding (lua_State* tolua_S) {
 return tolua_ActionEaseExtension_luabinding_open(tolua_S);
};
#endif

