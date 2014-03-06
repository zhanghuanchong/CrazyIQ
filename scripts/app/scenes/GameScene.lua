local BaseQuestion = import("app.ui.questions.BaseQuestion")
local ClickRedBtnQuestion = import("app.ui.questions.ClickRedBtnQuestion")

local GameScene = class('GameScene', function()
    return WoodScene.new()
end)

function GameScene:ctor()
    self.top = display.newLayer()

    self.heartCount = 4

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
    local count = self.heartCount
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

function GameScene:addModalLayer()
    local layer = display.newSprite()
    layer:setCascadeBoundingBox(CCRect(0, 0, display.width, display.height))
    self:addChild(layer, 100)
    layer:setTouchEnabled(true)
    layer:addTouchEventListener(function()
        return true
    end, false, -128, true)

    return layer
end

function GameScene:dieHeart()

end

function GameScene:alertError()
    local warning = display.newSprite('image/warning.png')
    local width = warning:getContentSize().width
    warning:setPosition(ccp(-width, display.cy))
    self:addChild(warning, 101)

    local layer = self:addModalLayer()

    transition.execute(warning, CCMoveTo:create(0.3, ccp(display.cx, display.cy)), {
        easing = 'backOut',
        onComplete = function()
            ez:playEffect('sound/error.mp3')
            transition.execute(warning, CCMoveTo:create(0.5, ccp(display.width + width, display.cy)), {
                delay = 0.5,
                easing = 'backIn',
                onComplete = function()
                    warning:removeFromParent()
                    layer:removeFromParent()
                    self:dieHeart()
                end
            })
        end
    })
end

return GameScene