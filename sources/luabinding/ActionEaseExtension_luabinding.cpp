/*
** Lua binding: ActionEaseExtension_luabinding
** Generated automatically by tolua++-1.0.92 on 01/01/14 17:55:35.
*/

#ifndef __cplusplus
#include "stdlib.h"
#endif
#include "string.h"

#include "tolua++.h"

/* Exported function */
TOLUA_API int  tolua_ActionEaseExtension_luabinding_open (lua_State* tolua_S);

#include "../ext/CrazyIQ.h"
#include "../ext/ActionEaseExtension.h"
#include "tolua_fix.h"

/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 tolua_usertype(tolua_S,"CCEaseCubicIn"); toluafix_add_type_mapping(typeid(CCEaseCubicIn).hash_code(), "CCEaseCubicIn");
 tolua_usertype(tolua_S,"CCEaseCubicOut"); toluafix_add_type_mapping(typeid(CCEaseCubicOut).hash_code(), "CCEaseCubicOut");
 tolua_usertype(tolua_S,"CCZone"); toluafix_add_type_mapping(typeid(CCZone).hash_code(), "CCZone");
 tolua_usertype(tolua_S,"CCActionEase"); toluafix_add_type_mapping(typeid(CCActionEase).hash_code(), "CCActionEase");
 tolua_usertype(tolua_S,"CCObject"); toluafix_add_type_mapping(typeid(CCObject).hash_code(), "CCObject");
 tolua_usertype(tolua_S,"CCActionInterval"); toluafix_add_type_mapping(typeid(CCActionInterval).hash_code(), "CCActionInterval");
 tolua_usertype(tolua_S,"CCEaseCubicInOut"); toluafix_add_type_mapping(typeid(CCEaseCubicInOut).hash_code(), "CCEaseCubicInOut");
}

/* method: copyWithZone of class  CCEaseCubicIn */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_copyWithZone00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_copyWithZone00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCEaseCubicIn",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,2,"CCZone",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCEaseCubicIn* self = (CCEaseCubicIn*)  tolua_tousertype(tolua_S,1,0);
  CCZone* pZone = ((CCZone*)  tolua_tousertype(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'copyWithZone'", NULL);
#endif
  {
   CCObject* tolua_ret = (CCObject*)  self->copyWithZone(pZone);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCObject");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'copyWithZone'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: update of class  CCEaseCubicIn */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_update00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_update00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCEaseCubicIn",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCEaseCubicIn* self = (CCEaseCubicIn*)  tolua_tousertype(tolua_S,1,0);
  float time = ((float)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'update'", NULL);
#endif
  {
   self->update(time);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'update'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: reverse of class  CCEaseCubicIn */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_reverse00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_reverse00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCEaseCubicIn",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCEaseCubicIn* self = (CCEaseCubicIn*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'reverse'", NULL);
#endif
  {
   CCActionInterval* tolua_ret = (CCActionInterval*)  self->reverse();
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCActionInterval");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'reverse'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

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

/* method: copyWithZone of class  CCEaseCubicOut */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_copyWithZone00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_copyWithZone00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCEaseCubicOut",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,2,"CCZone",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCEaseCubicOut* self = (CCEaseCubicOut*)  tolua_tousertype(tolua_S,1,0);
  CCZone* pZone = ((CCZone*)  tolua_tousertype(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'copyWithZone'", NULL);
#endif
  {
   CCObject* tolua_ret = (CCObject*)  self->copyWithZone(pZone);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCObject");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'copyWithZone'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: update of class  CCEaseCubicOut */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_update00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_update00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCEaseCubicOut",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCEaseCubicOut* self = (CCEaseCubicOut*)  tolua_tousertype(tolua_S,1,0);
  float time = ((float)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'update'", NULL);
#endif
  {
   self->update(time);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'update'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: reverse of class  CCEaseCubicOut */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_reverse00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_reverse00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCEaseCubicOut",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCEaseCubicOut* self = (CCEaseCubicOut*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'reverse'", NULL);
#endif
  {
   CCActionInterval* tolua_ret = (CCActionInterval*)  self->reverse();
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCActionInterval");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'reverse'.",&tolua_err);
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

/* method: copyWithZone of class  CCEaseCubicInOut */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_copyWithZone00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_copyWithZone00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCEaseCubicInOut",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,2,"CCZone",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCEaseCubicInOut* self = (CCEaseCubicInOut*)  tolua_tousertype(tolua_S,1,0);
  CCZone* pZone = ((CCZone*)  tolua_tousertype(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'copyWithZone'", NULL);
#endif
  {
   CCObject* tolua_ret = (CCObject*)  self->copyWithZone(pZone);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCObject");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'copyWithZone'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: update of class  CCEaseCubicInOut */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_update00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_update00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCEaseCubicInOut",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCEaseCubicInOut* self = (CCEaseCubicInOut*)  tolua_tousertype(tolua_S,1,0);
  float time = ((float)  tolua_tonumber(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'update'", NULL);
#endif
  {
   self->update(time);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'update'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: reverse of class  CCEaseCubicInOut */
#ifndef TOLUA_DISABLE_tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_reverse00
static int tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_reverse00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"CCEaseCubicInOut",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,2,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCEaseCubicInOut* self = (CCEaseCubicInOut*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'reverse'", NULL);
#endif
  {
   CCActionInterval* tolua_ret = (CCActionInterval*)  self->reverse();
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCActionInterval");
  }
 }
 return 1;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'reverse'.",&tolua_err);
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
   tolua_function(tolua_S,"copyWithZone",tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_copyWithZone00);
   tolua_function(tolua_S,"update",tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_update00);
   tolua_function(tolua_S,"reverse",tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_reverse00);
   tolua_function(tolua_S,"create",tolua_ActionEaseExtension_luabinding_CCEaseCubicIn_create00);
  tolua_endmodule(tolua_S);
  tolua_cclass(tolua_S,"CCEaseCubicOut","CCEaseCubicOut","CCActionEase",NULL);
  tolua_beginmodule(tolua_S,"CCEaseCubicOut");
   tolua_function(tolua_S,"copyWithZone",tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_copyWithZone00);
   tolua_function(tolua_S,"update",tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_update00);
   tolua_function(tolua_S,"reverse",tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_reverse00);
   tolua_function(tolua_S,"create",tolua_ActionEaseExtension_luabinding_CCEaseCubicOut_create00);
  tolua_endmodule(tolua_S);
  tolua_cclass(tolua_S,"CCEaseCubicInOut","CCEaseCubicInOut","CCActionEase",NULL);
  tolua_beginmodule(tolua_S,"CCEaseCubicInOut");
   tolua_function(tolua_S,"copyWithZone",tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_copyWithZone00);
   tolua_function(tolua_S,"update",tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_update00);
   tolua_function(tolua_S,"reverse",tolua_ActionEaseExtension_luabinding_CCEaseCubicInOut_reverse00);
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

