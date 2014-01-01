local LogoLayer = require('app.ui.LogoLayer');

local MenuScene = class("MenuScene", function()
    return WoodScene.new()
end)

function MenuScene:ctor()
--    local layer = display.newLayer()
    local logoLayer = LogoLayer.new()
    self:addChild(logoLayer)
    logoLayer:setPosition(ccp(display.cx, display.height * 0.8))
    self.logoLayer = logoLayer
end

function MenuScene:onEnterTransitionFinish()
    self.logoLayer:onEnterTransitionFinish()
end

function MenuScene:onExit()
end

return MenuScene
