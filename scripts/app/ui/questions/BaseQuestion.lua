local BaseQuestion = class('BaseQuestion', function()
    return display.newLayer()
end)

function BaseQuestion:ctor()
    self:setNodeEventEnabled(true)

    self.tipBg = CCScale9Sprite:createWithSpriteFrameName("paper_" .. math.random(5) ..  ".png", CCRect(10, 10, 610, 90))
    local height = self.tipBg:getContentSize().height
    self.tipBg:setAnchorPoint(ccp(0.5 , 1))
    self.tipBg:setPosition(ccp(display.cx, height))
    self.tipText = ez:newLabel{
        text = "",
        align = ui.TEXT_ALIGN_CENTER,
        x = display.cx,
        y = height / 2 + 8,
        size = 40
    }
    self.tipText:setAnchorPoint(ccp(0.5, 0.5))

    self.tip = display.newNode()
    self.tip:addChild(self.tipBg, 0)
    self.tip:addChild(self.tipText, 1)

    self.tip:setContentSize(self.tipBg:getContentSize())
    self.tip:setAnchorPoint(ccp(0.5, 1))
    self.tip:setPosition(ccp(display.cx, display.height - 95))
    self.tip:setVisible(false)
    self:addChild(self.tip)
end

function BaseQuestion:setTip(text, fontSize, height)
    self.tipText:setString(text)
    if fontSize then
        self.tipText:setFontSize(fontSize)
    end
    local h = self.tipText:getContentSize().height + 45
    if height then
        h = height
    end
    self:setTipHeight(h)
end

function BaseQuestion:setTipHeight(height)
    local size = CCSize(self.tip:getContentSize().width, height)
    self.tip:setContentSize(size)
    self.tipBg:setContentSize(size)
    self.tipBg:setPositionY(height)
    self.tipText:setPositionY(height / 2 + 8)
end

function BaseQuestion:setTipHeightPercent(percent)
    local height = self.tip:getContentSize().height * percent
    self:setTipHeight(height)
end

function BaseQuestion:showTip(animation, onComplete)
    if animation then
        self.tip:setPosition(ccp(display.cx, display.height + self.tip:getContentSize().height))
        self.tip:setVisible(true)
        transition.execute(self.tip, CCMoveTo:create(0.5, ccp(display.cx, display.height - 95)), {
            easing = 'backOut',
            onComplete = function()
                if onComplete then
                    onComplete()
                end
            end
        })
    else
        self.tip:setVisible(true)
        if onComplete then
            onComplete()
        end
    end
end

function BaseQuestion:hideTip(animation, onComplete)
    if animation then
        transition.execute(self.tip, CCMoveTo:create(0.5, ccp(display.cx, display.height + self.tip:getContentSize().height)), {
            easing = 'backIn',
            onComplete = function()
                if onComplete then
                    onComplete()
                end
            end
        })
    else
        self.tip:setVisible(false)
        if onComplete then
            onComplete()
        end
    end
end

function BaseQuestion:setButtonEnabled(bEnabled, buttons)
    if buttons == nil then
        buttons = self.buttons
    end
    if buttons == nil then
        return
    end
    for i,btn in ipairs(buttons) do
        btn:setTouchEnabled(bEnabled)
    end
end

function BaseQuestion:getAvailableHeight()
    return display.height - 80 - self.tip:getContentSize().height
end

function BaseQuestion:cy()
    return self:getAvailableHeight() / 2
end

function BaseQuestion:alertError(completeListener)
    ez.gameScene:alertError(completeListener)
end

function BaseQuestion:gotoNextQuestion()
    ez.gameScene:gotoNextQuestion()
end

function BaseQuestion:newModalLayer(param)
    return ez.gameScene:newModalLayer(param)
end

function BaseQuestion:onEnter()
end

function BaseQuestion:onEnterTransitionFinish()
    self:showTip(true)
end

return BaseQuestion