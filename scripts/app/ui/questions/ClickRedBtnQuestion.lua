local BaseQuestion = import('.BaseQuestion')

local ClickRedBtnQuestion = class('ClickRedBtnQuestion', function()
    return BaseQuestion.new()
end)

function ClickRedBtnQuestion:ctor()
    self.btnGreen = display.newSprite('#btn_continue.png')
    self.btnGreen:setVisible(false)
    self.btnGreen:setTouchEnabled(true)
    self.btnGreen:addTouchEventListener(function()
        self:alertError()
        jumpAnimate(self.btnGreen)
    end)
    self:addChild(self.btnGreen)

    self.btnRed = display.newSprite('#btn_stop.png')
    self.btnRed:setVisible(false)
    self.btnRed:setTouchEnabled(true)
    self.btnRed:addTouchEventListener(function()
        ez:playEffect('sound/click.mp3')
        jumpAnimate(self.btnRed, function()
            self:gotoNextQuestion()
        end)
    end)
    self:addChild(self.btnRed)
end

function ClickRedBtnQuestion:onEnterTransitionFinish()
    self:setTip("请点击红色的按钮。")
    self:showTip(true)

    local height = self:getAvailableHeight()
    self.btnGreen:setPosition(ccp(display.cx, height * 2 / 3))
    self.btnGreen:setScale(0.1)
    self.btnGreen:setVisible(true)
    transition.execute(self.btnGreen, CCScaleTo:create(0.3, 1), {
        easing = "backOut",
        delay = 0.3
    })

    self.btnRed:setPosition(ccp(display.cx, height / 3))
    self.btnRed:setScale(0.1)
    self.btnRed:setVisible(true)
    transition.execute(self.btnRed, CCScaleTo:create(0.3, 1), {
        easing = "backOut",
        delay = 0.5
    })
end

return ClickRedBtnQuestion