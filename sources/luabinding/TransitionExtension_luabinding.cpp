/*
** Lua binding: TransitionExtension_luabinding
** Generated automatically by tolua++-1.0.92 on Wed Apr  2 07:57:48 2014.
*/

#include "TransitionExtension_luabinding.h"
#include "CCLuaEngine.h"

using namespace cocos2d;




#include "../ext/CrazyIQ.h"
#include "../ext/TransitionExtension.h"
#include "tolua_fix.h"

/* function to register type */
static void tolua_reg_types (lua_State* tolua_S)
{
 tolua_usertype(tolua_S,"CCTransitionScene");
 tolua_usertype(tolua_S,"CCTransitionEaseScene");
 tolua_usertype(tolua_S,"CCTransitionMoveOutBackR");
 tolua_usertype(tolua_S,"CCTransitionMoveInBackR");
 tolua_usertype(tolua_S,"CCScene");
 tolua_usertype(tolua_S,"CCTransitionMoveInR");
}

/* method: create of class  CCTransitionMoveInBackR */
#ifndef TOLUA_DISABLE_tolua_TransitionExtension_luabinding_CCTransitionMoveInBackR_create00
static int tolua_TransitionExtension_luabinding_CCTransitionMoveInBackR_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"CCTransitionMoveInBackR",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isusertype(tolua_S,3,"CCScene",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  float t = ((float)  tolua_tonumber(tolua_S,2,0));
  CCScene* scene = ((CCScene*)  tolua_tousertype(tolua_S,3,0));
  {
   CCTransitionMoveInBackR* tolua_ret = (CCTransitionMoveInBackR*)  CCTransitionMoveInBackR::create(t,scene);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCTransitionMoveInBackR");
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

/* method: create of class  CCTransitionMoveOutBackR */
#ifndef TOLUA_DISABLE_tolua_TransitionExtension_luabinding_CCTransitionMoveOutBackR_create00
static int tolua_TransitionExtension_luabinding_CCTransitionMoveOutBackR_create00(lua_State* tolua_S)
{
#ifndef TOLUA_RELEASE
 tolua_Error tolua_err;
 if (
     !tolua_isusertable(tolua_S,1,"CCTransitionMoveOutBackR",0,&tolua_err) ||
     !tolua_isnumber(tolua_S,2,0,&tolua_err) ||
     !tolua_isusertype(tolua_S,3,"CCScene",0,&tolua_err) ||
     !tolua_isnoobj(tolua_S,4,&tolua_err)
 )
  goto tolua_lerror;
 else
#endif
 {
  float t = ((float)  tolua_tonumber(tolua_S,2,0));
  CCScene* scene = ((CCScene*)  tolua_tousertype(tolua_S,3,0));
  {
   CCTransitionMoveOutBackR* tolua_ret = (CCTransitionMoveOutBackR*)  CCTransitionMoveOutBackR::create(t,scene);
    int nID = (tolua_ret) ? tolua_ret->m_uID : -1;
int* pLuaID = (tolua_ret) ? &tolua_ret->m_nLuaID : NULL;
toluafix_pushusertype_ccobject(tolua_S, nID, pLuaID, (void*)tolua_ret,"CCTransitionMoveOutBackR");
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

/* get function: __CCTransitionEaseScene__ of class  CCTransitionMoveOutBackR */
#ifndef TOLUA_DISABLE_tolua_get_CCTransitionMoveOutBackR___CCTransitionEaseScene__
static int tolua_get_CCTransitionMoveOutBackR___CCTransitionEaseScene__(lua_State* tolua_S)
{
  CCTransitionMoveOutBackR* self = (CCTransitionMoveOutBackR*)  tolua_tousertype(tolua_S,1,0);
#ifndef TOLUA_RELEASE
  if (!self) tolua_error(tolua_S,"invalid 'self' in accessing variable '__CCTransitionEaseScene__'",NULL);
#endif
#ifdef __cplusplus
   tolua_pushusertype(tolua_S,(void*)static_cast<CCTransitionEaseScene*>(self), "CCTransitionEaseScene");
#else
   tolua_pushusertype(tolua_S,(void*)((CCTransitionEaseScene*)self), "CCTransitionEaseScene");
#endif
 return 1;
}
#endif //#ifndef TOLUA_DISABLE

/* Open function */
TOLUA_API int tolua_TransitionExtension_luabinding_open (lua_State* tolua_S)
{
 tolua_open(tolua_S);
 tolua_reg_types(tolua_S);
 tolua_module(tolua_S,NULL,0);
 tolua_beginmodule(tolua_S,NULL);
  tolua_cclass(tolua_S,"CCTransitionMoveInBackR","CCTransitionMoveInBackR","CCTransitionMoveInR",NULL);
  tolua_beginmodule(tolua_S,"CCTransitionMoveInBackR");
   tolua_function(tolua_S,"create",tolua_TransitionExtension_luabinding_CCTransitionMoveInBackR_create00);
  tolua_endmodule(tolua_S);
  tolua_cclass(tolua_S,"CCTransitionMoveOutBackR","CCTransitionMoveOutBackR","CCTransitionScene",NULL);
  tolua_beginmodule(tolua_S,"CCTransitionMoveOutBackR");
   tolua_function(tolua_S,"create",tolua_TransitionExtension_luabinding_CCTransitionMoveOutBackR_create00);
   tolua_variable(tolua_S,"__CCTransitionEaseScene__",tolua_get_CCTransitionMoveOutBackR___CCTransitionEaseScene__,NULL);
  tolua_endmodule(tolua_S);
 tolua_endmodule(tolua_S);
 return 1;
}


#if defined(LUA_VERSION_NUM) && LUA_VERSION_NUM >= 501
 TOLUA_API int luaopen_TransitionExtension_luabinding (lua_State* tolua_S) {
 return tolua_TransitionExtension_luabinding_open(tolua_S);
};
#endif

