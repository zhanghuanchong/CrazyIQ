local BaseQuestion = import('.BaseQuestion')

local ClickRedBtnQuestion = class('ClickRedBtnQuestion', function()
    return BaseQuestion.new()
end)

function ClickRedBtnQuestion:ctor()
    self:setTip("请点击红色的按钮。")

    local height = self:getAvailableHeight()

    self.btnGreen = display.newSprite('#btn_continue.png')
    self.btnGreen:setTouchEnabled(true)
    self.btnGreen:setPosition(ccp(display.cx, height * 2 / 3))
    self.btnGreen:addTouchEventListener(function()
        self:alertError()
        jumpAnimate(self.btnGreen)
    end)
    self:addChild(self.btnGreen)

    self.btnRed = display.newSprite('#btn_stop.png')
    self.btnRed:setTouchEnabled(true)
    self.btnRed:setPosition(ccp(display.cx, height / 3))
    self.btnRed:addTouchEventListener(function()
        ez:playEffect('sound/click.mp3')
        jumpAnimate(self.btnRed, function()
            self:gotoNextQuestion()
        end)
    end)
    self:addChild(self.btnRed)
end

return ClickRedBtnQuestion