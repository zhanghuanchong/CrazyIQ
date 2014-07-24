local GameOverScene = class('GameOverScene', function()
    return WoodScene.new()
end)

function GameOverScene:ctor()
    self.logo = display.newSprite("#face_2.png", display.cx, display.height * 0.75)
    self.logo:setScale(0.1)
    self.logo:setVisible(false)
    self:addChild(self.logo)

    self.resultLayer = display.newLayer()
    local label = ez:newLabel{
        text = '智商：',
        size = 64
    }
    local x = -100
    if ez.gameScene.levelScore >= 100 then
        x = -150
    end
    label:setPosition(ccp(x, 0))
    self.resultLayer:addChild(label)
    local score = ez:newLabel{
        text = ez.gameScene.levelScore,
        size = 150
    }
    score:setPosition(ccp(80, 20))
    self.resultLayer:addChild(score)
    local lines = display.newSprite("#score_lines.png", 80, -70)
    self.resultLayer:addChild(lines)
    self:addChild(self.resultLayer)
    self.resultLayer:setPosition(ccp(display.width * 1.5, display.height * 0.5))

    local btnRestartGame = WoodButton.new{
        title = "重新开始",
        listener = function()
            app:enterGameScene()
        end
    }
    local btnShare = WoodButton.new{
        title = "分享成绩",
        listener = function()
            print("Share")
        end
    }
    local mainMenu = ui.newMenu{btnRestartGame, btnShare}
    self:addChild(mainMenu)
    mainMenu:setPosition(ccp(display.width * 1.5, display.height * 0.25))
    mainMenu:alignItemsVerticallyWithPadding(display.height * 0.04)
    self.mainMenu = mainMenu
end

function GameOverScene:easeIn(node, delay)
    node:setPositionX(display.width * 1.5);
    transition.execute(node, CCMoveBy:create(0.6, ccp(-display.width, 0)), {
        delay = delay,
        easing = 'exponentialOut'
    })
end

function GameOverScene:onEnterTransitionFinish()
    self.logo:setVisible(true)
    transition.execute(self.logo, CCScaleTo:create(0.5, 1), {
        easing = "bounceOut"
    })
    ez:playBackgroundMusic("sound/bg.mp3", true)
    for i,v in ipairs{
        self.mainMenu,
        self.resultLayer
    } do
        self:easeIn(v, i * 0.1)
    end
end

return GameOverScene