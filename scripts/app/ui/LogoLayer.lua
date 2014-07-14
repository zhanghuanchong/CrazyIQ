local LogoLayer = class('LogoLayer', function()
    return display.newLayer()
end)

function LogoLayer:ctor()
    self:setNodeEventEnabled(true)

    local logo = display.newSprite("#logoHome.png")
    self:addChild(logo)

    local stencil = CCDrawNode:create()
    local radius = 75
    local white = ccc4f(1, 1, 1, 1)
    local points = CCPointArray:create(4)
    points:add(ccp(-radius, -radius))
    points:add(ccp(radius, -radius))
    points:add(ccp(radius, radius))
    points:add(ccp(-radius, radius))
    stencil:drawPolygon(points:fetchPoints(), 4, white, 0, white)

    local clipper = CCClippingNode:create(stencil)
    self:addChild(clipper)

    local electron = display.newSprite("#elec.png")
    clipper:addChild(electron)
    clipper:setPosition(ccp(0, 68))

    self._electron = electron;
end

function LogoLayer:onEnterTransitionFinish()
    local radius = 112.5
    local actions = CCArray:create()
    actions:addObject(CCEaseCubicIn:create(
        CCMoveBy:create(0.5, ccp(radius, 0))
    ))
    actions:addObject(CCPlace:create(ccp(-radius, 0)))
    actions:addObject(CCEaseCubicOut:create(
        CCMoveBy:create(0.5, ccp(radius, 0))
    ))
    actions:addObject(CCDelayTime:create(1))
    self._electron:runAction(CCRepeatForever:create(
        CCSequence:create(actions)
    ))
end

return LogoLayer