
local ScrollViewCell = import(".ScrollViewCell")
local LevelsListCell = class("LevelsListCell", ScrollViewCell)

function LevelsListCell:ctor(size, levelIndex, title)
    self.levelIcon = display.newSprite("#level_" .. levelIndex .. ".png", display.cx, display.height * .6)
    self.levelIcon:setScale(2)
    self.levelIcon:setTouchEnabled(true)
    self.levelIcon:addTouchEventListener(function()
        local actions = CCArray:create()
        actions:addObject(CCEaseSineIn:create(CCScaleTo:create(.5, 2.5)))
        actions:addObject(CCEaseSineOut:create(CCScaleTo:create(.5, 2)))
        transition.execute(self.levelIcon, CCSequence:create(actions), {
            onComplete = function()
                print('level'..levelIndex)
            end
        })
    end)
    self:addChild(self.levelIcon)

    self.levelTitle = ez:newLabel{
        text = title,
        align = ui.TEXT_ALIGN_CENTER,
        x = display.cx,
        y = display.height * 0.4,
        size = 60
    }
    self:addChild(self.levelTitle)
end

return LevelsListCell
