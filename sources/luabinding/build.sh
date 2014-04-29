#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
OUTPUT_DIR="$DIR"
MAKE_LUABINDING="$QUICK_COCOS2DX_ROOT"/bin/compile_luabinding.sh
$MAKE_LUABINDING -E CCOBJECTS=CCEaseCubicIn,CCEaseCubicOut,CCEaseCubicInOut -d "$OUTPUT_DIR" ActionEaseExtension_luabinding.tolua
$MAKE_LUABINDING -E CCOBJECTS=CCTransitionMoveInBackR,CCTransitionMoveOutBackR -d "$OUTPUT_DIR" TransitionExtension_luabinding.tolua
$MAKE_LUABINDING -E CCOBJECTS=MenuItemSpriteExtension -d "$OUTPUT_DIR" MenuItemSpriteExtension_luabinding.tolua
