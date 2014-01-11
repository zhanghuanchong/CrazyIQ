/*
** Lua binding: WoodSwitch_luabinding
** Generated automatically by tolua++-1.0.92 on 01/11/14 10:08:33.
*/

#ifndef __cplusplus
#include "stdlib.h"
#endif
#include "string.h"

#include "tolua++.h"

/* Exported function */
TOLUA_API int  tolua_WoodSwitch_luabinding_open (lua_State* tolua_S);

#include "../ext/Util.h"
#include "../ext/WoodSwitch.h"
#include "tolua_fix.h"

/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 tolua_usertype(tolua_S,"WoodSwitch"); toluafix_add_type_mapping(typeid(WoodSwitch).hash_code(), "WoodSwitch");
 
 tolua_usertype(tolua_S,"CCControlSwitch"); toluafix_add_type_mapping(typeid(CCControlSwitch).hash_code(), "CCControlSwitch");
}

/* method: create of class  WoodSwitch */
#ifndef TOLUA_DISABLE_tolua_WoodSwitch_luabinding_WoodSwitch_create00
static int tolua_WoodSwitch_luabinding_WoodSwitch_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"WoodSwitch",0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,2,&tolua_err) || !toluafix_isfunction(tolua_S,2,"LUA_FUNCTION",0,&tolua_err)) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  LUA_FUNCTION nFuncID = (  toluafix_ref_function(tolua_S,2,0));
  {
   WoodSwitch* tolua_ret = (WoodSwitch*)  WoodSwitch::create(nFuncID);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"WoodSwitch");
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
TOLUA_API int tolua_WoodSwitch_luabinding_open (lua_State* tolua_S)
{
 tolua_open(tolua_S);
 tolua_reg_types(tolua_S);
 tolua_module(tolua_S,NULL,0);
 tolua_beginmodule(tolua_S,NULL);
  tolua_cclass(tolua_S,"WoodSwitch","WoodSwitch","CCControlSwitch",NULL);
  tolua_beginmodule(tolua_S,"WoodSwitch");
   tolua_function(tolua_S,"create",tolua_WoodSwitch_luabinding_WoodSwitch_create00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_WoodSwitch_luabinding (lua_State* tolua_S) {
 return tolua_WoodSwitch_luabinding_open(tolua_S);
};
#endif

