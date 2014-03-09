local BaseQuestion = import('.BaseQuestion')

local BallQuestion = class('BallQuestion', function()
    return BaseQuestion.new()
end)

function BallQuestion:ctor()
    self:setTip("请选择正确的球。")

    local height = self:getAvailableHeight()

    display.addSpriteFramesWithFile("image/balls.plist", "image/balls.png")
    local items = {'football', 'baseball', 'basketball', 'rugby', 'tennis', 'volleyball' }

    for i = 1, #items do
        local item = display.newSprite("#"..items[i]..'.png',
            display.width * (math.floor((i - 1) / 3) * 2 + 1) / 4,
            height * (math.abs(3 - i) % 3 + 1) / 4
        )
        item.name = items[i]
        item:setTouchEnabled(true)
        item:addTouchEventListener(function()
            jumpAnimate(item, function()
                if item.name == 'basketball' then
                    self:gotoNextQuestion()
                else
                    self:alertError()
                end
            end)
        end)
        self:addChild(item)
    end
end

function BallQuestion:onExit()
    display.removeSpriteFramesWithFile("image/balls.plist")
end

return BallQuestion