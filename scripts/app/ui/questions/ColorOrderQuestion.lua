local BaseQuestion = import('.BaseQuestion')

local ColorOrderQuestion = class('ColorOrderQuestion', function()
    return BaseQuestion.new()
end)

function ColorOrderQuestion:ctor()
    self:setTip("依次点击红色、绿色、蓝色按钮。")

    local height = self:getAvailableHeight()

--    display.addSpriteFramesWithFile("image/stars.plist", "image/stars.png")

end

function ColorOrderQuestion:onExit()
--    display.removeSpriteFramesWithFile("image/stars.plist")
end

return ColorOrderQuestion