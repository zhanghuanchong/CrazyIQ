local BaseQuestion = class('BaseQuestion', function()
    return display.newLayer()
end)

function BaseQuestion:ctor()
    self:setNodeEventEnabled(true)

    self.tip = display.newSprite("#paper_" .. math.random(5) .. '.png')
    self.tip:setAnchorPoint(ccp(0.5, 1))
    self.tip:setPosition(ccp(display.cx, display.height - 95))
    self.tip:setVisible(false)
    self:addChild(self.tip)
end

function BaseQuestion:showTip(animation)
    if animation then
        self.tip:setPosition(ccp(display.cx, display.height + self.tip:getContentSize().height))
        self.tip:setVisible(true)
        transition.execute(self.tip, CCMoveTo:create(0.5, ccp(display.cx, display.height - 95)), {
            easing = 'backOut'
        })
    else
        self.tip:setVisible(true)
    end
end

function BaseQuestion:hideTip(animation)
    if animation then
        transition.execute(self.tip, CCMoveTo:create(0.5, ccp(display.cx, display.height + self.tip:getContentSize().height)), {
            easing = 'backIn'
        })
    else
        self.tip:setVisible(false)
    end
end

function BaseQuestion:onEnter()

end

function BaseQuestion:onEnterTransitionFinish()
    self:showTip(true)
    scheduler.performWithDelayGlobal(function()
         self:hideTip(true)
    end, 1)
end

return BaseQuestion