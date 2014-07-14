local GameOverScene = class('GameOverScene', function()
    return display.newScene('GameOverScene')
end)

function GameOverScene:ctor()
    local layer = CCLayerColor:create(ccc4(0, 136, 203, 255))
    self:addChild(layer)

    self.logo = display.newSprite("#face_2.png", display.cx, display.height * 0.6)
    self.logo:setScale(0.2)
    self:addChild(self.logo)
end

function GameOverScene:onEnter()
    transition.execute(self.logo, CCScaleTo:create(0.5, 1), {
        easing = "bounceOut"
    })
    transition.execute(self.motto, CCMoveTo:create(10, ccp(display.cx, display.height * 0.1)), {
        delay = 0.5,
        easing = "bounceOut"
    })
end

return GameOverScene