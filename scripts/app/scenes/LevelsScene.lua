local LevelsScene = class('LevelsScene', function()
    return WoodScene.new()
end)

function LevelsScene:ctor()
    
end

function LevelsScene:onEnter()

end

function LevelsScene:onEnterTransitionFinish()
    local backMenu, backBtn = self:newBackMenu(function()
        app:enterMenuScene()
    end)
    self:addChild(backMenu)
    self:showBackButton(backMenu, backBtn, true)
end

return LevelsScene