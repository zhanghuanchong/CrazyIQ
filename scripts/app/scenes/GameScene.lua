local Levels = import("app.data.Levels")

local GameScene = class('GameScene', function()
    return WoodScene.new()
end)

function GameScene:ctor()
    ez.gameScene = self

    display.addSpriteFramesWithFile("image/game_scene.plist", "image/game_scene.png")

    self.top = display.newLayer()

    self.heartCount = ez:getHeartCount()

    local topBg = display.newSprite('#bgWoodTop.png', display.cx, display.height - 45)
    self.top:addChild(topBg)

    local pauseButton = WoodSquare.new{
        image = '#back.png',
        imageActive = '#backActive.png',
        x = 45,
        y = display.height - 45,
        listener = function()
--            app:enterPauseScene()
            app:enterLevelsScene()
        end
    }

    local buyButton = WoodSquare.new{
        image = '#buy.png',
        imageActive = '#buyActive.png',
        x = display.width - 45,
        y = display.height - 45,
        listener = function()
            print("Buy...")
        end
    }

    local topMenu = ui.newMenu{pauseButton, buyButton}
    self.top:addChild(topMenu)

    self.top:setPosition(ccp(0, 0))
    self:addChild(self.top, 10)

    self.currentLevel = Levels[ez.level]
    self.questions = self.currentLevel['questions']
--    dump(self.questions)
--    for test
    self.currentQuestionIndex = 4
    self.levelScore = Levels:baseScore(ez.level)
end

function GameScene:hasMoreLevel()
    return ez.level <= #Levels
end

function GameScene:gotoNextQuestion()
    if self.currentQuestionIndex > 0 and self.currentQuestionLayer then
        self.currentQuestionLayer:removeFromParent()
        self.levelScore = self.levelScore + self.currentQuestion.score
        ez:checkBestScore(self.levelScore)
    end
    print('************** best score: ' .. ez:getBestScore())
    self.currentQuestionIndex = self.currentQuestionIndex + 1
    if self.currentQuestionIndex > table.getn(self.questions) then
        ez:increaseLevel()
        app:enterUpgradeScene()
        return
    end
    ez:playEffect('sound/pass.mp3')
    self.currentQuestion = self.questions[self.currentQuestionIndex]
    self.currentQuestionLayer = self.currentQuestion.class.new()
    self:addChild(self.currentQuestionLayer)
end

function GameScene:onEnter()
    if self:hasMoreLevel() == false then
        app:enterLevelsScene()
    end
end

function GameScene:onEnterTransitionFinish()
    local count = self.heartCount
    self.hearts = {}
    for i = 1, count do
        local heart = display.newSprite('#heart.png')
        heart:setPosition(ccp(display.cx - (count / 2.0 + 0.5 - i) * 70, display.height - 45))
        self.top:addChild(heart)
        heart:setScale(0.1)
        transition.execute(heart, CCScaleTo:create(0.3, 1), {
            easing = 'backOut',
            delay = 0.1 * (i - 1)
        })
        table.insert(self.hearts, heart)
    end
    self:gotoNextQuestion()
--    self.levelScore = 8
--    app:enterGameOverScene()
--    app:enterUpgradeScene()
end

function GameScene:newModalLayer(param)
    param = param or {}
    local layer = display.newSprite()
    layer:setCascadeBoundingBox(CCRect(0, 0, display.width, display.height))
    layer:setTouchEnabled(true)
    layer:addTouchEventListener(function()
        if param.listener then
            param.listener(param.scope)
        end
        return true
    end, false, -128, true)

    return layer
end

function GameScene:addModalLayer(param)
    param = param or {}
    local layer = self:newModalLayer(param)
    self:addChild(layer, param.zOrder or 100)

    return layer
end

function GameScene:dieHeart()
    if table.getn(self.hearts) == 1 then
        app:enterGameOverScene()
        return false
    end
    local heart = table.remove(self.hearts)
    transition.execute(heart, CCScaleTo:create(0.2, 0.1), {
        easing = 'backIn',
        onComplete = function()
            heart:removeFromParent()
            for i = 1, table.getn(self.hearts) do
                local _heart = self.hearts[i]
                transition.execute(_heart, CCMoveBy:create(0.2, ccp(35, 0)))
            end
        end
    })
    return true
end

function GameScene:alertError(completeListener)
    local warning = display.newSprite('image/warning.png')
    local width = warning:getContentSize().width
    warning:setPosition(ccp(-width, display.cy))
    self:addChild(warning, 101)

    local layer = self:addModalLayer()

    transition.execute(warning, CCMoveTo:create(0.2, ccp(display.cx, display.cy)), {
        easing = 'backOut',
        onComplete = function()
            ez:playEffect('sound/error.mp3')
            transition.execute(warning, CCMoveTo:create(0.5, ccp(display.width + width, display.cy)), {
                delay = 0.5,
                easing = 'backIn',
                onComplete = function()
                    warning:removeFromParent()
                    layer:removeFromParent()
                    if self:dieHeart() then
                        if completeListener then
                            completeListener()
                        end
                    end
                end
            })
        end
    })
end

function GameScene:showCountDown(param)
    param = param or {}
    param.from = param.from or 3

    local function countDown(i)
        local text = string.format('%i', i)
        if i == 0 then
            text = 'GO'
        elseif i < 0 then
            if param.onComplete then
                param.onComplete()
            end
            return
        end
        local number = ez:newLabel{
            text = text,
            align = ui.TEXT_ALIGN_CENTER,
            color = ccc3(222, 0, 0),
            size = 160,
            x = display.cx,
            y = param.y or display.height - 140
        }
        self:addChild(number)
        number:setZOrder(11)
        number:setScale(5)

        transition.execute(number, CCScaleTo:create(1, 1), {
            easing = 'elasticOut',
            onComplete = function()
                number:removeFromParent()
                countDown(i - 1)
            end
        })
    end

    countDown(param.from)
end

function GameScene:onExit()
    display.removeSpriteFramesWithFile("image/game_scene.plist")
end

return GameScene
