local BaseQuestion = import('.BaseQuestion')
local TimeCounter = import('app.ui.TimeCounter')

local MemoryCloseQuestion = class('MemoryCloseQuestion', function()
    return BaseQuestion.new()
end)

function MemoryCloseQuestion:ctor()
    self:setTip("记忆时间！")

    self.count = 8

    display.addSpriteFramesWithFile("image/flags.plist", "image/flags.png")

    self.timeCounter = TimeCounter.new{
        total = 3,
        listener = function()
            self.timeCounter:setVisible(false)

            self.target = math.random(1, self.count)
            self.cells[self.target]:setVisible(false)
            self:hideTip(true, function()
                self:setTip('消失的旗帜是哪个？')
                self:showTip(true)
            end)

            transition.execute(self.pad, CCMoveTo:create(0.3, ccp(display.cx, 100)), {
                easing = 'backOut',
                onComplete = function()
                    local index = self.items[self.target]
                    local news = {index}
                    for i = 2, 4 do
                        news[i] = self.items[self.count + i - 1]
                    end
                    local answerIndex = ez:randomSequence(4)
                    self.answers = {}
                    local count = 4
                    local width = 90
                    local areaWidth = 500
                    for i = 1, 4 do
                        local x = (i - 1) % count
                        local cx = (640 - areaWidth) / 2 + (areaWidth - count * width) / (count + 1) * (1 + x) + (width / 2) * (1 + 2 * x)

                        local answer = display.newSprite("#flag_mini_" .. news[answerIndex[i]] .. '.png')
                        answer:setPosition(ccp(cx, 120))
                        answer:setScale(0.1)
                        answer.index = news[answerIndex[i]]
                        answer:setTouchEnabled(true)
                        answer:addTouchEventListener(function()
                            jumpAnimate(answer, function()
                                if answer.index == index then
                                    self:gotoNextQuestion()
                                else
                                    self:alertError(function()
                                        self:restart()
                                    end)
                                end
                            end)
                        end)
                        self:addChild(answer, 101)
                        self.answers[i] = answer

                        transition.execute(answer, CCScaleTo:create(0.2, 1), {
                            easing = 'backOut'
                        })
                    end
                end
            })
        end
    }
    self.timeCounter:setPosition(ccp(display.cx, 80))
    self:addChild(self.timeCounter, 1)

    self:build()

    self.pad = display.newSprite('#pad.png')
    self.pad:setPosition(ccp(display.cx, -self.pad:getContentSize().height / 2))
    self:addChild(self.pad, 100)
end

function MemoryCloseQuestion:build()
    self.cells = {}
    self.items = ez:randomSequence(100)
    local count = self.count
    local width = 90
    local column = 4
    local areaWidth = 500
    local areaHeight = 200
    local baseHeight = self.timeCounter:getContentSize().height / 2 + 90
    local height = self:getAvailableHeight() - baseHeight
    for i = 1, self.count do
        local x = (i - 1) % column
        local y = math.floor((count - i) / column)

        local cx = (640 - areaWidth) / 2 + (areaWidth - column * width) / (column + 1) * (1 + x) + (width / 2) * (1 + 2 * x)
        local dis = (areaHeight - width * math.ceil(count / column)) / (math.ceil(count / column) + 1)
        local cy = baseHeight + (height - areaHeight) / 2 + dis * (1 + y) + (width / 2) * (1 + 2 * y)

        local cell = display.newSprite('#flag_mini_' .. self.items[i] .. '.png')
        cell:setPosition(ccp(cx, cy))
        self:addChild(cell)
        self.cells[i] = cell
    end
end

function MemoryCloseQuestion:restart()
    self:hideTip(true, function()
        self:setTip('记忆时间！')
        self:showTip(true)
    end)

    for k, v in pairs(self.answers) do
        transition.execute(v, CCScaleTo:create(0.2, 0.1), {
            easing = 'backIn',
            onComplete = function()
                v:removeFromParentAndCleanup()
            end
        })
    end

    transition.execute(self.pad, CCMoveTo:create(0.3, ccp(display.cx,  -self.pad:getContentSize().height / 2)), {
        easing = 'backIn',
        delay = 0.2,
        onComplete = function()
            for k, v in pairs(self.cells) do
                v:removeFromParentAndCleanup()
            end

            self:build()

            self.timeCounter:setVisible(true)
            self.timeCounter:start()
        end
    })
end

function MemoryCloseQuestion:onEnterTransitionFinish()
    self:showTip(true)

    self.timeCounter:start()
end

function MemoryCloseQuestion:onExit()
    display.removeSpriteFramesWithFile("image/flags.plist")
end

return MemoryCloseQuestion