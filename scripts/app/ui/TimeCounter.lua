local TimeCounter = class('TimeCounter', function()
    return display.newNode()
end)

function TimeCounter:ctor(param)
    self:setNodeEventEnabled(true)

    local bg = display.newSprite("image/loadingBg.png")
    self:addChild(bg)
    self.bgSize = bg:getContentSize()

    local cx = - self.bgSize.width / 2;

    local front = CCScale9Sprite:create("image/loadingFront.png")
    front:setCapInsets(CCRect(25, 5, 405, 40))
    front:setAnchorPoint(ccp(0, 0.5))
    front:setPosition(ccp(cx, 0))
    front:setContentSize(bg:getContentSize())
    self:addChild(front)
    self.front = front

    param = param or {}
    param.total = param.total or 60
    self.total = param.total
    self.current = self.total

    local title = ez:newLabel{
        text = ez:getFormattedTime(param.total),
        align = ui.TEXT_ALIGN_CENTER,
        size = 60,
        x = 0,
        y = 0
    }
    self:addChild(title)
    self.title = title

    if param.light then
        local clipper = CCClippingNode:create(front)
        clipper:setAlphaThreshold( 0.05);
        self:addChild(clipper)

        local light = display.newSprite("image/loadingLight.png")
        light:setAnchorPoint(ccp(0, 0.5))
        light:setPosition(ccp(cx, 0))
        clipper:addChild(light)

        local actions = CCArray:create()
        actions:addObject(CCMoveBy:create(0.5, ccp(-40, 0)))
        actions:addObject(CCPlace:create(ccp(cx, 0)))
        light:runAction(CCRepeatForever:create(
            CCSequence:create(actions)
        ))
    end

    self:start()
end

function TimeCounter:start()
    self.scheduler = scheduler.scheduleGlobal(handler(self, self.tick), 1)
end

function TimeCounter:stop()
    if self.scheduler then
        scheduler.unscheduleGlobal(self.scheduler)
    end
end

function TimeCounter:tick()
    self.current = self.current - 1
    self.title:setString(ez:getFormattedTime(self.current))
    self.front:setContentSize(CCSize(self.current / self.total * self.bgSize.width, self.bgSize.height))

    if self.current <= 0 then
        scheduler.unscheduleGlobal(self.scheduler)
        self.scheduler = nil
        return
    end
end

function TimeCounter:onExit()
    self:stop()
end

return TimeCounter