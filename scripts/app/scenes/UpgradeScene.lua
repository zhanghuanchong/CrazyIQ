local UpgradeScene = class('UpgradeScene', function()
    return WoodScene.new()
end)

function UpgradeScene:ctor()
    self.logo = display.newSprite("#face_1.png", display.cx, display.height * 0.8)
    self.logo:setScale(0.1)
    self.logo:setVisible(false)
    self:addChild(self.logo, 2)

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
    score:setScale(0.1)
    score:setVisible(false)
    self.resultLayer:addChild(score)
    self.scoreLabel = score
    local lines = display.newSprite("#score_lines.png", 80, -70)
    self.resultLayer:addChild(lines)
    self:addChild(self.resultLayer, 2)
    self.resultLayer:setPosition(ccp(display.width * 1.5, display.height * 0.57))

    local tip = ez.gameScene.currentLevel.upgradeTip
    local clear = false
    if type(tip) == 'table' then
        clear = tip.clear
        tip = tip.text
    end
    self.tipLabel = ez:newLabel({
        text = tip or "恭喜晋级！"
    }, clear)
    self.tipLabel:setPosition(ccp(display.cx, display.height * .4))
    self.tipLabel:setScale(0.1)
    self.tipLabel:setVisible(false)
    self:addChild(self.tipLabel, 2)

    local btnRestartGame = WoodButton.new{
        title = "下一关",
        listener = function()
            app:enterGameScene()
        end
    }
    if ez.gameScene:hasMoreLevel() == false then
        btnRestartGame:setVisible(false)
    end
    --[[local btnShare = WoodButton.new{
        title = "分享成绩",
        listener = function()
            print("Share")
        end
    }]]
    local mainMenu = ui.newMenu{btnRestartGame--[[, btnShare]]}
    self:addChild(mainMenu, 2)
    mainMenu:setPosition(ccp(display.width * 1.5, display.height * 0.2))
    mainMenu:alignItemsVerticallyWithPadding(display.height * 0.04)
    self.mainMenu = mainMenu

    self.star =  CCParticleFireworks:create()
    self.star.texture = CCTextureCache:sharedTextureCache():addImage('image/particle.png')
    self.star.shapeType = CCParticleFireworks.STAR_SHAPE;
    self.star:setPosition(ccp(display.cx, display.height * .3))
end

function UpgradeScene:easeIn(node, delay)
    node:setPositionX(display.width * 1.5);
    transition.execute(node, CCMoveBy:create(0.6, ccp(-display.width, 0)), {
        delay = delay,
        easing = 'exponentialOut'
    })
end

function UpgradeScene:onEnterTransitionFinish()
    self.logo:setVisible(true)
    transition.execute(self.logo, CCScaleTo:create(0.5, 1), {
        easing = "bounceOut"
    })
    audio.stopBackgroundMusic()
    ez:playEffect("sound/upgrade.mp3")
    for i,v in ipairs{
        self.resultLayer,
        self.mainMenu
    } do
        self:easeIn(v, i * 0.1)
    end
    scheduler.performWithDelayGlobal(function()
        self.scoreLabel:setVisible(true)
    end, 0.6)
    transition.execute(self.scoreLabel, CCScaleTo:create(0.3, 1), {
        easing = "bounceOut",
        delay = 0.6
    })
    scheduler.performWithDelayGlobal(function()
        self.tipLabel:setVisible(true)
        self:addChild(self.star, 1)
        local backMenu, backBtn = self:newBackMenu(function()
            app:enterLevelsScene()
        end)
        self:addChild(backMenu)
        self:showBackButton(backMenu, backBtn, true)
    end, 0.8)
    transition.execute(self.tipLabel, CCScaleTo:create(0.3, 1), {
        easing = "bounceOut",
        delay = 0.8
    })
end

return UpgradeScene