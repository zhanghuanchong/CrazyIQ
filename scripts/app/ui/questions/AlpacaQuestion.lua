local BaseQuestion = import('.BaseQuestion')

local AlpacaQuestion = class('AlpacaQuestion', function()
    return BaseQuestion.new()
end)

function AlpacaQuestion:ctor()
    self:setTip("等草泥马跑出后给它打针")
    self.tipHeight = self.tip:getContentSize().height

    display.addSpriteFramesWithFile("image/cnm.plist", "image/cnm.png")

    local sprite = display.newSprite('#cnm_front_0.png')
    sprite:setPosition(ccp(display.cx, display.height * 2 / 4))
    self:addChild(sprite)
    local frames = display.newFrames("cnm_front_%d.png", 0, 6)
    local animation = display.newAnimation(frames, 1.0 / 8)
    sprite:setScale(1.8)
    sprite:playAnimationForever(animation)

    local sprite = display.newSprite('#cnm_back_0.png')
    sprite:setPosition(ccp(display.cx, display.height * 1 / 4))
    self:addChild(sprite)
    local frames = display.newFrames("cnm_back_%d.png", 0, 6)
    local animation = display.newAnimation(frames, 1.0 / 8)
    sprite:setScale(1.8)
    sprite:playAnimationForever(animation)

    local sprite = display.newSprite('#cnm_left_0.png')
    sprite:setPosition(ccp(display.cx, display.height * 3 / 4))
    self:addChild(sprite)
    local frames = display.newFrames("cnm_left_%d.png", 0, 6)
    local animation = display.newAnimation(frames, 1.0 / 8)
    sprite:setScale(1.8)
    sprite:playAnimationForever(animation)
end

function AlpacaQuestion:onEnterTransitionFinish()
    self:showTip(true)
end

function AlpacaQuestion:onExit()
    display.removeSpriteFramesWithFile("image/cnm.plist")
end

return AlpacaQuestion