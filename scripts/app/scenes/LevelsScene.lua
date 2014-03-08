local LevelsList = import("..ui.levels.LevelsList")

local LevelsScene = class('LevelsScene', function()
    return WoodScene.new()
end)

function LevelsScene:ctor()
    display.addSpriteFramesWithFile("image/levels.plist", "image/levels.png")
    display.addSpriteFramesWithFile("image/levels_locked.plist", "image/levels_locked.png")

    local rect = CCRect(display.left, display.bottom + 80, display.width, display.height - 280)
    self.levelsList = LevelsList.new(rect)
    self:addChild(self.levelsList)
end

function LevelsScene:onEnterTransitionFinish()
    local backMenu, backBtn = self:newBackMenu(function()
        app:enterMenuScene()
    end)
    self:addChild(backMenu)
    self:showBackButton(backMenu, backBtn, true)

    self.levelsList:setTouchEnabled(true)
end

function LevelsScene:onExit()
    display.removeSpriteFramesWithFile("image/levels.plist", "image/levels.png")
    display.removeSpriteFramesWithFile("image/levels_locked.plist", "image/levels_locked.png")
end

return LevelsScene