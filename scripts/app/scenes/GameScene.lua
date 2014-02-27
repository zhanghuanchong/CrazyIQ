local GameScene = class('GameScene', function()
    return WoodScene.new()
end)

function GameScene:ctor()
    self.tipPaper = display.newSprite("#paper_" .. math.random(5) .. '.png')
    self.tipPaper:setAnchorPoint(ccp(0.5, 1))
    self:addChild(self.tipPaper)
    self.tipPaper:setPosition(ccp(display.cx, display.height - 80))

    local pauseButton = WoodSquare.new{
        image = 'image/pause.png',
        imageActive = 'image/pauseActive.png',
        x = 40,
        y = display.height - 40,
        listener = function()
            app:enterPauseScene()
        end
    }

    local buyButton = WoodSquare.new{
        image = 'image/buy.png',
        imageActive = 'image/buyActive.png',
        x = display.width - 40,
        y = display.height - 40,
        listener = function()
        end
    }

    local topMenu = ui.newMenu{pauseButton, buyButton}
    self:addChild(topMenu)
end

function GameScene:onEnterTransitionFinish()
    local count = 4
    for i = 1, count do
        local heart = display.newSprite('image/heart.png')
        heart:setPosition(ccp(display.cx - (count / 2.0 + 0.5 - i) * 70, display.height - 40))
        self:addChild(heart)
        heart:setScale(0.1)
        transition.execute(heart, CCScaleTo:create(0.3, 1), {
            easing = 'backOut',
            delay = 0.1 * (i - 1)
        })
    end
end

return GameScene