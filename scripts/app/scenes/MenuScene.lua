local LogoLayer = require('app.ui.LogoLayer');

local MenuScene = class("MenuScene", function()
    return WoodScene.new()
end)

function MenuScene:ctor()
    local logoLayer = LogoLayer.new()
    self:addChild(logoLayer)
    logoLayer:setPosition(ccp(display.cx, display.height * 0.85))
    self.logoLayer = logoLayer

    local titleSprite = display.newSprite("image/title.png")
    self:addChild(titleSprite)
    titleSprite:setPosition(ccp(display.cx, display.height * 0.67))
    self.titleSprite = titleSprite

    local btnStartGame = WoodButton.new{
        title = "开始游戏",
        listener = function()
            print("Start game")
        end
    }
    local mainMenu = ui.newMenu{btnStartGame }
    self:addChild(mainMenu)
    mainMenu:setPosition(ccp(display.cx, display.cy))
    mainMenu:alignItemsVerticallyWithPadding(10)
    self.mainMenu = mainMenu
end

function MenuScene:onEnterTransitionFinish()
end

function MenuScene:onExit()
end

return MenuScene
