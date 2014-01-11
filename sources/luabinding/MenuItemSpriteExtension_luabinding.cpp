/*
** Lua binding: MenuItemSpriteExtension_luabinding
** Generated automatically by tolua++-1.0.92 on 01/11/14 17:22:32.
*/

#ifndef __cplusplus
#include "stdlib.h"
#endif
#include "string.h"

#include "tolua++.h"

/* Exported function */
TOLUA_API int  tolua_MenuItemSpriteExtension_luabinding_open (lua_State* tolua_S);

#include "../ext/CrazyIQ.h"
#include "../ext/MenuItemSpriteExtension.h"
#include "tolua_fix.h"

/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 
 tolua_usertype(tolua_S,"MenuItemSpriteExtension"); toluafix_add_type_mapping(typeid(MenuItemSpriteExtension).hash_code(), "MenuItemSpriteExtension");
 tolua_usertype(tolua_S,"CCNode"); toluafix_add_type_mapping(typeid(CCNode).hash_code(), "CCNode");
 tolua_usertype(tolua_S,"CCMenuItemSprite"); toluafix_add_type_mapping(typeid(CCMenuItemSprite).hash_code(), "CCMenuItemSprite");
}

/* method: create of class  MenuItemSpriteExtension */
#ifndef TOLUA_DISABLE_tolua_MenuItemSpriteExtension_luabinding_MenuItemSpriteExtension_create00
static int tolua_MenuItemSpriteExtension_luabinding_MenuItemSpriteExtension_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"MenuItemSpriteExtension",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,2,"CCNode",0,&tolua_err) ||
     !tolua_isusertype(tolua_S,3,"CCNode",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  CCNode* normalSprite = ((CCNode*)  tolua_tousertype(tolua_S,2,0));
  CCNode* selectedSprite = ((CCNode*)  tolua_tousertype(tolua_S,3,0));
  {
   MenuItemSpriteExtension* tolua_ret = (MenuItemSpriteExtension*)  MenuItemSpriteExtension::create(normalSprite,selectedSprite);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"MenuItemSpriteExtension");
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

/* method: setSelectedCallback of class  MenuItemSpriteExtension */
#ifndef TOLUA_DISABLE_tolua_MenuItemSpriteExtension_luabinding_MenuItemSpriteExtension_setSelectedCallback00
static int tolua_MenuItemSpriteExtension_luabinding_MenuItemSpriteExtension_setSelectedCallback00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"MenuItemSpriteExtension",0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,2,&tolua_err) || !toluafix_isfunction(tolua_S,2,"LUA_FUNCTION",0,&tolua_err)) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  MenuItemSpriteExtension* self = (MenuItemSpriteExtension*)  tolua_tousertype(tolua_S,1,0);
  LUA_FUNCTION callback = (  toluafix_ref_function(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'setSelectedCallback'", NULL);
#endif
  {
   self->setSelectedCallback(callback);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'setSelectedCallback'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* method: setUnselectedCallback of class  MenuItemSpriteExtension */
#ifndef TOLUA_DISABLE_tolua_MenuItemSpriteExtension_luabinding_MenuItemSpriteExtension_setUnselectedCallback00
static int tolua_MenuItemSpriteExtension_luabinding_MenuItemSpriteExtension_setUnselectedCallback00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertype(tolua_S,1,"MenuItemSpriteExtension",0,&tolua_err) ||
     (tolua_isvaluenil(tolua_S,2,&tolua_err) || !toluafix_isfunction(tolua_S,2,"LUA_FUNCTION",0,&tolua_err)) ||
     !tolua_isnoobj(tolua_S,3,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  MenuItemSpriteExtension* self = (MenuItemSpriteExtension*)  tolua_tousertype(tolua_S,1,0);
  LUA_FUNCTION callback = (  toluafix_ref_function(tolua_S,2,0));
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in function 'setUnselectedCallback'", NULL);
#endif
  {
   self->setUnselectedCallback(callback);
  }
 }
 return 0;
#ifndef TOLUA_RELEASE
 tolua_lerror:
 tolua_error(tolua_S,"#ferror in function 'setUnselectedCallback'.",&tolua_err);
 return 0;
#endif
}
#endif //#ifndef TOLUA_DISABLE

/* Open function */
TOLUA_API int tolua_MenuItemSpriteExtension_luabinding_open (lua_State* tolua_S)
{
 tolua_open(tolua_S);
 tolua_reg_types(tolua_S);
 tolua_module(tolua_S,NULL,0);
 tolua_beginmodule(tolua_S,NULL);
  tolua_cclass(tolua_S,"MenuItemSpriteExtension","MenuItemSpriteExtension","CCMenuItemSprite",NULL);
  tolua_beginmodule(tolua_S,"MenuItemSpriteExtension");
   tolua_function(tolua_S,"create",tolua_MenuItemSpriteExtension_luabinding_MenuItemSpriteExtension_create00);
   tolua_function(tolua_S,"setSelectedCallback",tolua_MenuItemSpriteExtension_luabinding_MenuItemSpriteExtension_setSelectedCallback00);
   tolua_function(tolua_S,"setUnselectedCallback",tolua_MenuItemSpriteExtension_luabinding_MenuItemSpriteExtension_setUnselectedCallback00);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_MenuItemSpriteExtension_luabinding (lua_State* tolua_S) {
 return tolua_MenuItemSpriteExtension_luabinding_open(tolua_S);
};
#endif

