local BaseQuestion = import('.BaseQuestion')

local BallPrepareQuestion = class('BallPrepareQuestion', function()
    return BaseQuestion.new()
end)

function BallPrepareQuestion:ctor()
    self:setTip("注意！！！ 点击任意处继续。")

    self.basketball_field = display.newSprite('image/basketball_field.png', display.cx, self:cy())
    self:addChild(self.basketball_field)

    self.layer = self:newModalLayer{
        listener = function(scope)
            scope.layer:removeFromParent()
            scope:gotoNextQuestion()
        end,
        scope = self
    }
    self:addChild(self.layer)
end

return BallPrepareQuestion