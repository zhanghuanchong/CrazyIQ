local TimeCounter = import('app.ui.TimeCounter')
local BaseQuestion = import('.BaseQuestion')

local ColorTextQuestion = class('ColorTextQuestion', function()
    return BaseQuestion.new()
end)

function ColorTextQuestion:ctor()
    self:setTip("按照指示点击相应的按钮。")

    local height = self:getAvailableHeight()

    local timeCounter = TimeCounter.new{

    }
    timeCounter:setPosition(ccp(display.cx, 60))
    self:addChild(timeCounter)
    self.timeCounter = timeCounter

--    display.addSpriteFramesWithFile("image/stars.plist", "image/stars.png")

end

function ColorTextQuestion:onExit()
--    display.removeSpriteFramesWithFile("image/stars.plist")
end

return ColorTextQuestion