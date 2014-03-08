local BaseQuestion = import('.BaseQuestion')

local BallQuestion = class('BallQuestion', function()
    return BaseQuestion.new()
end)

function BallQuestion:ctor()
    self:setTip("请选择正确的球。")

    display.addSpriteFramesWithFile("image/balls.plist", "image/balls.png")
    local balls = {'football', 'baseball', 'basketball', 'rugby', 'tennis', 'volleyball' }
    for i = 1, #balls do
        local ball = display.newSprite("#"..balls[i]..'.png',
            display.width * (math.floor((i - 1) / 3) * 2 + 1) / 4,
            self:getAvailableHeight() * (math.abs(3 - i) % 3 + 1) / 4
        )
        ball.name = balls[i]
        ball:setTouchEnabled(true)
        ball:addTouchEventListener(function()
            jumpAnimate(ball, function()
                if ball.name == 'basketball' then
                    self:gotoNextQuestion()
                else
                    self:alertError()
                end
            end)
        end)
        self:addChild(ball)
    end
end

return BallQuestion