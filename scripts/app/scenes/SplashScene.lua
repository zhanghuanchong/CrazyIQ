--
-- Created by IntelliJ IDEA.
-- User: Huanchong
-- Date: 12/29/13
-- Time: 5:07 PM
-- To change this template use File | Settings | File Templates.
--

local SplashScene = class('SplashScene', function()
    return display.newScene('SplashScene')
end)

function SplashScene:ctor()
    local layer = CCLayerColor:create(ccc4(0, 136, 203, 255))
    self:addChild(layer)
end

function SplashScene:onEnter()

end

return SplashScene