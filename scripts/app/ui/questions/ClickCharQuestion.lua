local BaseQuestion = import('.BaseQuestion')
local CrystalButton = import('app.ui.CrystalButton')

local ClickCharQuestion = class('ClickCharQuestion', function()
    return BaseQuestion.new()
end)

function ClickCharQuestion:ctor()
    self:setTip("点击红色\"5\"两次。")

    local height = self:getAvailableHeight()

    display.addSpriteFramesWithFile("image/crystal_btns.plist", "image/crystal_btns.png")
    local positions = {
        { x = 391, y = 429 },
        { x = 235, y = 190 },
        { x = 144, y = 590 },
        { x = 467, y = 673 },
        { x = 486, y = 192 },
        { x = 115, y = 334 }
    }
    local colors = {'blue', 'green', 'purple', 'red', 'white', 'yellow' }
    local titleColors = {
        display.COLOR_WHITE,
        display.COLOR_BLACK,
        display.COLOR_WHITE,
        display.COLOR_WHITE,
        ccc3(255, 0, 0),
        display.COLOR_BLACK,
    }
    local scales = ez:randomNumber(10, 6, 4)

    local currentIndex = 1

    for i = 1, 6 do
        local position = positions[i]
--        local item = display.newSprite(
--            '#star_' ..(i - 1) .. '.png',
--            position['x'],
--            height * position['y'] / 800
--        )
--        item:setTouchEnabled(true)
--        item:addTouchEventListener(function()
--            transition.execute(item, CCScaleTo:create(0.3, 0.1), {
--                easing = "backIn",
--                onComplete = function()
--                    if i ~= currentIndex then
--                        self:alertError()
--                    else
--                        item:removeFromParent()
--                        currentIndex = currentIndex + 1
--                        if currentIndex == 7 then
--                            self:gotoNextQuestion()
--                        end
--                    end
--                end
--            })
--        end)
        local item = CrystalButton.new({
            color = colors[i],
            title = '' .. i,
            titleColor = titleColors[i],
            scale = scales[i] / 10.0,
            x = position.x,
            y = position.y
        })
        self:addChild(item)
    end
end

function ClickCharQuestion:onExit()
    display.removeSpriteFramesWithFile("image/crystal_btns.plist")
end

return ClickCharQuestion