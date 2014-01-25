local LevelsList = import("..ui.levels.LevelsList")

local LevelsScene = class('LevelsScene', function()
    return WoodScene.new()
end)

function LevelsScene:ctor()
    local rect = CCRect(display.left, display.bottom + 80, display.width, display.height - 280)
    self.levelsList = LevelsList.new(rect)
    self:addChild(self.levelsList)
end

function LevelsScene:onEnter()
end

function LevelsScene:onEnterTransitionFinish()
    local backMenu, backBtn = self:newBackMenu(function()
        app:enterMenuScene()
    end)
    self:addChild(backMenu)
    self:showBackButton(backMenu, backBtn, true)

    self.levelsList:setTouchEnabled(true)
end

return LevelsScene