local BaseQuestion = import('.BaseQuestion')

local ClickRedBtnQuestion = class('ClickRedBtnQuestion', function()
    return BaseQuestion.new()
end)

function ClickRedBtnQuestion:ctor()
    self:setTip("请点击红色的按钮。")

    local height = self:getAvailableHeight()

    display.addSpriteFramesWithFile("image/buttons.plist", "image/buttons.png")

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
        jumpAnimate(self.btnRed, function()
            self:gotoNextQuestion()
        end)
    end)
    self:addChild(self.btnRed)
end

function ClickRedBtnQuestion:onExit()
    display.removeSpriteFramesWithFile("image/buttons.plist")
end

return ClickRedBtnQuestion