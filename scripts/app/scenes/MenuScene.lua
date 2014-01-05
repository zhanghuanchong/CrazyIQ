local LogoLayer = require('app.ui.LogoLayer');

local MenuScene = class("MenuScene", function()
    return WoodScene.new()
end)

function MenuScene:ctor()
    -- add the title
    local logoLayer = LogoLayer.new()
    self:addChild(logoLayer)
    logoLayer:setPosition(ccp(display.cx, display.height * 0.85))
    self.logoLayer = logoLayer

    local titleSprite = display.newSprite("image/title.png")
    self:addChild(titleSprite)
    titleSprite:setPosition(ccp(display.cx, display.height * 0.67))
    self.titleSprite = titleSprite

    -- add the main menu
    local btnStartGame = WoodButton.new{
        title = "开始游戏",
        listener = function()
            print("Start game")
        end
    }
    local btnInvite = WoodButton.new{
        title = "邀请好友",
        listener = function()
            print("Invite friends")
        end
    }
    local btnCoin = WoodButton.new{
        title = "免费金币",
        listener = function()
            print("Free coins")
        end
    }
    local mainMenu = ui.newMenu{btnStartGame, btnInvite, btnCoin}
    self:addChild(mainMenu)
    mainMenu:setPosition(ccp(display.cx, display.height * 0.4))
    mainMenu:alignItemsVerticallyWithPadding(display.height * 0.04)
    self.mainMenu = mainMenu

    -- add the bottom button
    local btnFavorite = WoodSquare.new{
        image = 'image/favorite.png',
        imageActive = 'image/favoriteActive.png',
        listener = function()
            print("Favorite")
        end
    }
    local btnSetting = WoodSquare.new{
        image = 'image/setting.png',
        imageActive = 'image/settingActive.png',
        listener = function()
            print("Setting")
        end
    }
    local settingMenu = ui.newMenu{btnFavorite, btnSetting}
    self:addChild(settingMenu)
    settingMenu:setPosition(ccp(display.cx, display.height * 0.1))
    settingMenu:alignItemsHorizontallyWithPadding(display.cx)
    self.settingMenu = settingMenu
end

function MenuScene:onEnterTransitionFinish()
end

function MenuScene:onExit()
end

return MenuScene
