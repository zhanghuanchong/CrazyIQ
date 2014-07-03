local TimeCounter = class('TimeCounter', function()
    return display.newNode()
end)

function TimeCounter:ctor(param)
    self:setNodeEventEnabled(true)

    local bg = display.newSprite("image/loadingBg.png")
    self:addChild(bg)
    self.bgSize = bg:getContentSize()

    local stencil = display.newSprite('image/loadingStencil.png')
    stencil:setPosition(ccp(3, 0))

    local clipper = CCClippingNode:create(stencil)
    clipper:setAlphaThreshold(0.05);
    self:addChild(clipper)

    local cx = - self.bgSize.width / 2;

    local front = CCScale9Sprite:create("image/loadingFront.png")
    front:setCapInsets(CCRect(25, 5, 405, 40))
    front:setAnchorPoint(ccp(0, 0.5))
    front:setPosition(ccp(cx, 0))
    front:setContentSize(bg:getContentSize())
    self.front = front

    clipper:addChild(front)

    param = param or {}
    param.total = param.total or 10
    self.total = param.total
    self.listener = param.listener

    self.current = self.total

    local title = ez:newLabel{
        text = ez:getFormattedTime(param.total),
        align = ui.TEXT_ALIGN_CENTER,
        font = "Pixel LCD7",
        color = ccc3(0, 180, 0),
        size = 55
    }
    self:addChild(title)
    self.title = title
end

function TimeCounter:reset(total)
    self:stop()
    if total then
        self.total = total
    end
    self.current = self.total
    self:update(true)
end

function TimeCounter:start()
    if self.current ~= self.total then
        self:reset()
    end
    self.scheduler = scheduler.scheduleGlobal(handler(self, self.tick), 1)
end

function TimeCounter:stop()
    self.front:stopAllActions()
    self.title:stopAllActions()
    if self.scheduler then
        scheduler.unscheduleGlobal(self.scheduler)
        self.scheduler = nil
    end
end

function TimeCounter:tick()
    self.current = self.current - 1
    self:update()

    if self.current < 0 then
        self:stop()
        if self.listener then
            self.listener()
        end
        return
    end
end

function TimeCounter:update(immediate)
    local current = self.current
    if current < 0 then
        self.title:setString('00:00')
        return
    end
    local duration = 1
    if immediate then
        duration = 0
    end
    local str = ez:getFormattedTime(current)
    local newPos = ccp((self.current / self.total - 3 / 2) * self.bgSize.width, 0)
    transition.execute(self.front, CCMoveTo:create(duration, newPos), {
        onComplete = function()
            self.title:setString(str)
        end
    })
    local green = 180 * self.current / self.total
    local red = 255 * (1 - self.current / self.total)
    transition.execute(self.title, CCTintTo:create(duration, red, green, 0))
end

function TimeCounter:onExit()
    self:stop()
end

return TimeCounter