@echo off
set DIR=%~dp0
set OUTPUT_DIR=%DIR%
set MAKE_LUABINDING="%QUICK_COCOS2DX_ROOT%\bin\compile_luabinding.bat"
pushd
cd /d "%DIR%"
call %MAKE_LUABINDING% -E CCOBJECTS=CCEaseCubicIn,CCEaseCubicOut,CCEaseCubicInOut -d %OUTPUT_DIR% ActionEaseExtension_luabinding.tolua
call %MAKE_LUABINDING% -E CCOBJECTS=CCTransitionMoveInBackR,CCTransitionMoveOutBackR -d %OUTPUT_DIR% TransitionExtension_luabinding.tolua
call %MAKE_LUABINDING% -E CCOBJECTS=MenuItemSpriteExtension -d %OUTPUT_DIR% MenuItemSpriteExtension_luabinding.tolua
