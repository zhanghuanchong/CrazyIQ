local GameOverScene = class('GameOverScene', function()
    return WoodScene.new()
end)

function GameOverScene:ctor()
    self.logo = display.newSprite("#face_2.png", display.cx, display.height * 0.7)
    self.logo:setScale(0.1)
    self:addChild(self.logo)

    local btnRestartGame = WoodButton.new{
        title = "重新开始",
        listener = function()
            app:enterGameScene()
        end
    }
    local btnShare = WoodButton.new{
        title = "分享成果",
        listener = function()
            print("Share")
        end
    }
    local mainMenu = ui.newMenu{btnRestartGame, btnShare}
    self:addChild(mainMenu)
    mainMenu:setPosition(ccp(display.width * 1.5, display.height * 0.4))
    mainMenu:alignItemsVerticallyWithPadding(display.height * 0.04)
    self.mainMenu = mainMenu

    -- add the bottom button
    --[[local btnHome = WoodSquare.new{
        image = '#favorite.png',
        imageActive = '#favoriteActive.png',
        listener = function()
            print("Favorite")
        end
    }
    local btnSetting = WoodSquare.new{
        image = '#setting.png',
        imageActive = '#settingActive.png',
        listener = function()
            self:showSettingLayer()
        end
    }
    local settingMenu = ui.newMenu{btnFavorite, btnSetting}
    self:addChild(settingMenu)
    settingMenu:setPosition(ccp(display.width * 1.5, display.height * 0.1))
    settingMenu:alignItemsHorizontallyWithPadding(display.cx)
    self.settingMenu = settingMenu]]
end

function GameOverScene:easeIn(node, delay)
    node:setPositionX(display.width * 1.5);
    transition.execute(node, CCMoveBy:create(0.6, ccp(-display.width, 0)), {
        delay = delay,
        easing = 'exponentialOut'
    })
end

function GameOverScene:onEnterTransitionFinish()
    transition.execute(self.logo, CCScaleTo:create(0.5, 1), {
        easing = "bounceOut"
    })
    ez:playBackgroundMusic("sound/bg.mp3", true)
    for i,v in ipairs{
        self.mainMenu
    } do
        self:easeIn(v, i * 0.1)
    end
end

return GameOverScene