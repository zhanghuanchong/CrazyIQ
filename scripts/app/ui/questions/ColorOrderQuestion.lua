local BaseQuestion = import('.BaseQuestion')

local ColorOrderQuestion = class('ColorOrderQuestion', function()
    return BaseQuestion.new()
end)

function ColorOrderQuestion:ctor()
    self:setTip("依次点击红色、绿色、蓝色按钮。")

    local height = self:getAvailableHeight()

    display.addSpriteFramesWithFile("image/rect_btn.plist", "image/rect_btn.png")

end

function ColorOrderQuestion:onExit()
   display.removeSpriteFramesWithFile("image/rect_btn.plist")
end

return ColorOrderQuestion