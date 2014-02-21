
local ScrollViewCell = import(".ScrollViewCell")
local LevelsListCell = class("LevelsListCell", ScrollViewCell)

function LevelsListCell:ctor(size, levelIndex, title)
    local function gotoLevel()
        jumpAnimate(self.levelIcon, function()
            print('level' .. levelIndex)
        end)
    end

    local imageSuffix = ''
    if ez:getCurrentLevel() < levelIndex then
       imageSuffix = '_locked'
    end

    self.levelIcon = display.newSprite("#level_" .. levelIndex .. imageSuffix .. ".png", display.cx, display.height * .65)
    self.levelIcon:setTouchEnabled(true)
    self.levelIcon:addTouchEventListener(gotoLevel)
    self:addChild(self.levelIcon)

    self.levelTitle = ez:newLabel{
        text = title,
        align = ui.TEXT_ALIGN_CENTER,
        x = display.cx,
        y = display.height * 0.45,
        size = 60
    }
    self.levelTitle:setTouchEnabled(true)
    self.levelTitle:addTouchEventListener(gotoLevel)
    self:addChild(self.levelTitle)
end

return LevelsListCell
