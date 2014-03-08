local BaseQuestion = import('.BaseQuestion')

local ColorOrderQuestion = class('ColorOrderQuestion', function()
    return BaseQuestion.new()
end)

function ColorOrderQuestion:ctor()
    self:setTip("依次点击红色、绿色、蓝色。")

    local height = self:getAvailableHeight()

    display.addSpriteFramesWithFile("image/stars.plist", "image/stars.png")
    local positions = {
        { x = 391, y = 429 },
        { x = 235, y = 190 },
        { x = 144, y = 590 },
        { x = 467, y = 673 },
        { x = 486, y = 192 },
        { x = 115, y = 334 }
    }

    local currentIndex = 1

    for i = 1, 6 do
        local position = positions[i]
        local item = display.newSprite(
            '#star_' ..(i - 1) .. '.png',
            position['x'],
            height * position['y'] / 800
        )
        item:setTouchEnabled(true)
        item:addTouchEventListener(function()
            if i ~= currentIndex then
                self:alertError()
            else
                item:removeFromParent()
                currentIndex = currentIndex + 1
                if currentIndex == 7 then
                    self:gotoNextQuestion()
                end
            end
        end)
        self:addChild(item)
    end
end

function ColorOrderQuestion:onExit()
    display.removeSpriteFramesWithFile("image/stars.plist", "image/stars.png")
end

return ColorOrderQuestion