local SplashScene = class('SplashScene', function()
    return display.newScene('SplashScene')
end)

function SplashScene:ctor()
    local layer = CCLayerColor:create(ccc4(0, 136, 203, 255))
    self:addChild(layer)

    self.logo = display.newSprite("#logoMobile.png", display.cx, display.height * 0.6)
    self.logo:setScale(0.2)
    self:addChild(self.logo)

    self.motto = display.newSprite('#motto.png', display.cx, display.height * - 0.1)
    self:addChild(self.motto)
end

function SplashScene:onEnter()
    transition.execute(self.logo, CCScaleTo:create(0.5, 1), {
        easing = "bounceOut"
    })
    transition.execute(self.motto, CCMoveTo:create(0.5, ccp(display.cx, display.height * 0.1)), {
        delay = 0.5,
        easing = "bounceOut"
    })
    scheduler.performWithDelayGlobal(function()
        app:enterMenuScene()
    end, 1.5)
end

return SplashScene