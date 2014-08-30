local BaseQuestion = import('.BaseQuestion')
local Checkbox = import('app.ui.Checkbox')

local AlpacaQuestion = class('AlpacaQuestion', function()
    return BaseQuestion.new()
end)

function AlpacaQuestion:ctor()
    self:setTip("等草泥马跑出后给它打针")
    self.tipHeight = self.tip:getContentSize().height

    display.addSpriteFramesWithFile("image/cnm.plist", "image/cnm.png")
    local baseHeight = 120
    local height = self:getAvailableHeight() - baseHeight

    self.checkboxes = {}
    for i = 1, 3 do
        local checkbox = Checkbox.new()
        checkbox:setPosition(ccp(display.cx - (3 / 2.0 + 0.5 - i) * 70, baseHeight + height - 50))
        self:addChild(checkbox)
        self.checkboxes[i] = checkbox
    end
    self.level = 1

    self.count = 8
    self.alpacas = {}
    height = height - 100

    local frames = display.newFrames('cnm_front_%d.png', 0, 6)
    local animation = display.newAnimation(frames, 1.0 / 8)
    self.animationFront = animation

    frames = display.newFrames('cnm_back_%d.png', 0, 6)
    animation = display.newAnimation(frames, 1.0 / 8)
    self.animationBack = animation

    for i = 1, self.count do
        local type = 'front'
        animation = self.animationFront
        if i % 2 == 0 then
            type = 'back'
            animation = self.animationBack
        end

        local sprite = display.newSprite('#cnm_' .. type .. '_0.png')
        sprite:setPosition(ccp(display.width - math.random(50, 80), 120 + height * i / (self.count + 1)))
        self:addChild(sprite)

        sprite:setScale(1.8)
        sprite.type = type
        sprite:playAnimationForever(animation)
        self.alpacas[i] = sprite
    end

    local injector = display.newSprite("#injector.png")
    injector:setPosition(ccp(display.cx, 60))
    self:addChild(injector)
    injector:setTouchEnabled(true)
    injector:addTouchEventListener(function()
        scheduler.unscheduleGlobal(self.scheduler_run)
        jumpAnimate(injector)
        if self.running then
            transition.stopTarget(self.spriteLeft)

            local checkbox = self.checkboxes[self.level]
            checkbox:setChecked(true)

            self.level = self.level + 1
            if self.level > #self.checkboxes then
                self:gotoNextQuestion()
            else
                self:scheduleRun()
            end
        else
            injector:setTouchEnabled(false)
            self:alertError(function()
                injector:setTouchEnabled(true)
                self:scheduleRun()
            end)
        end
    end)
    self.injector = injector

    self.running = false
end

function AlpacaQuestion:scheduleRun()
    local delay =  1 + (math.random() * 10) % 5
    self.scheduler_run = scheduler.performWithDelayGlobal(function()
        local sprite = display.newSprite('#cnm_left_0.png')
        local y = math.random(150, self:getAvailableHeight() - 130)
        sprite:setPosition(ccp(display.width - 50, y))
        self:addChild(sprite)
        local frames = display.newFrames("cnm_left_%d.png", 0, 6)
        local animation = display.newAnimation(frames, 1.0 / 40)
        sprite:setScale(1.8)
        sprite:playAnimationForever(animation)
        self.spriteLeft = sprite
        self.running = true
        transition.execute(sprite, CCMoveTo:create(ez.gameScene.currentQuestion.timeout, ccp(-40, y)), {
            onComplete = function()
                sprite:removeFromParent()
                self.running = false
                self:alertError(function()
                    self:scheduleRun()
                end)
            end
        })
    end, delay)
end

function AlpacaQuestion:onEnterTransitionFinish()
    self:showTip(true)

    local height = self:getAvailableHeight() - 100
    self.scheduler = scheduler.scheduleGlobal(function()
        for i = 1, self.count do
            local sprite = self.alpacas[i]
            local y = sprite:getPositionY()
            local step = math.random(1, 10)
            if sprite.type == 'front' then
                if y - step < 120 then
                    sprite.type = 'back'
                    transition.stopTarget(sprite)
                    sprite:playAnimationForever(self.animationBack)
                else
                    sprite:setPositionY(y - step)
                end
            else
                if y + step > height then
                    sprite.type = 'front'
                    transition.stopTarget(sprite)
                    sprite:playAnimationForever(self.animationFront)
                else
                    sprite:setPositionY(y + step)
                end
            end
        end
    end, 0.1)

    self:scheduleRun()
end

function AlpacaQuestion:onExit()
    scheduler.unscheduleGlobal(self.scheduler)
    display.removeSpriteFramesWithFile("image/cnm.plist")
end

return AlpacaQuestion