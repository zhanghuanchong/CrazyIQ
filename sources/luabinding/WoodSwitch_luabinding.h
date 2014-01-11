
#ifndef __WOODSWITCH_LUABINDING_H_
#define __WOODSWITCH_LUABINDING_H_

extern "C" {
#include "lua.h"
#include "tolua++.h"
#include "tolua_fix.h"
}

TOLUA_API int luaopen_WoodSwitch_luabinding(lua_State* tolua_S);

#endif // __WOODSWITCH_LUABINDING_H_
