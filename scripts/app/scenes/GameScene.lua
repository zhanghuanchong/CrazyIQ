local BaseQuestion = import("app.ui.questions.BaseQuestion")
local ClickRedBtnQuestion = import("app.ui.questions.ClickRedBtnQuestion")

local GameScene = class('GameScene', function()
    return WoodScene.new()
end)

function GameScene:ctor()
    self.top = display.newLayer()

    local topBg = display.newSprite('image/bgWoodTop.png', display.cx, display.height - 45)
    self.top:addChild(topBg)

    local pauseButton = WoodSquare.new{
        image = 'image/back.png',
        imageActive = 'image/backActive.png',
        x = 45,
        y = display.height - 45,
        listener = function()
--            app:enterPauseScene()
            app:enterLevelsScene()
        end
    }

    local buyButton = WoodSquare.new{
        image = 'image/buy.png',
        imageActive = 'image/buyActive.png',
        x = display.width - 45,
        y = display.height - 45,
        listener = function()
        end
    }

    local topMenu = ui.newMenu{pauseButton, buyButton}
    self.top:addChild(topMenu)

    self.top:setPosition(ccp(0, 0))
    self:addChild(self.top, 10)

    local bqLayer = ClickRedBtnQuestion.new()
    self:addChild(bqLayer)
end

function GameScene:onEnterTransitionFinish()
    local count = 4
    for i = 1, count do
        local heart = display.newSprite('image/heart.png')
        heart:setPosition(ccp(display.cx - (count / 2.0 + 0.5 - i) * 70, display.height - 45))
        self.top:addChild(heart)
        heart:setScale(0.1)
        transition.execute(heart, CCScaleTo:create(0.3, 1), {
            easing = 'backOut',
            delay = 0.1 * (i - 1)
        })
    end
end

return GameScene