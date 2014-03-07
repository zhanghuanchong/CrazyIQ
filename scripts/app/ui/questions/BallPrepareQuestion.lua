local BaseQuestion = import('.BaseQuestion')

local BallPrepareQuestion = class('BallPrepareQuestion', function()
    return BaseQuestion.new()
end)

function BallPrepareQuestion:ctor()
    self.football_field = display.newSprite('image/football_field.png', display.cx, self:cy())
    self:addChild(self.football_field)

    self:addModalLayer{
        listener = function()
            self:gotoNextQuestion()
        end
    }
end

function BallPrepareQuestion:onEnterTransitionFinish()
    self:setTip("注意！！！ 点击任意处继续。")
    self:showTip(true)
end

return BallPrepareQuestion