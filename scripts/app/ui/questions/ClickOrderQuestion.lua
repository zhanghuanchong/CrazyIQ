local BaseQuestion = import('.BaseQuestion')

local ClickOrderQuestion = class('ClickOrderQuestion', function()
    return BaseQuestion.new()
end)

function ClickOrderQuestion:ctor()
    self:setTip("从大到小点击五角星。")

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
                jumpAnimate(item)
                self:alertError()
            else
                transition.execute(item, CCScaleTo:create(0.3, 0.1), {
                    easing = "backIn",
                    onComplete = function()
                        item:removeFromParent()
                        currentIndex = currentIndex + 1
                        if currentIndex == 7 then
                            self:gotoNextQuestion()
                        end
                    end
                })
            end
        end)
        self:addChild(item)
    end
end

function ClickOrderQuestion:onExit()
    display.removeSpriteFramesWithFile("image/stars.plist")
end

return ClickOrderQuestion