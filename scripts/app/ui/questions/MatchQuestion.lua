local BaseQuestion = import('.BaseQuestion')
local TimeCounter = import('app.ui.TimeCounter')

local MatchQuestion = class('MatchQuestion', function()
    return BaseQuestion.new()
end)

function MatchQuestion:ctor()
    local maxTime = 30
    self:setTip(maxTime .. "秒内记住它们的位置！")

    self.timeCounter = TimeCounter.new{
        total = maxTime,
        listener = function()
            self.timeCounter:setVisible(false)
            for i = 1, #self.cells do
                transition.execute(self.cells[i], CCOrbitCamera:create(.5, 1, 0, 0, 90, 0, 0), {
                    easing = 'backIn',
                    onComplete = function()
                        self.cells[i]:setVisible(false)
                        self.covers[i]:setVisible(true)
                        transition.execute(self.covers[i], CCOrbitCamera:create(.5, 1, 0, -90, 90, 0, 0), {
                            easing = 'backOut',
                            onComplete = function()
                            end
                        })
                    end
                })
            end
        end
    }
    self.timeCounter:setPosition(ccp(display.cx, 80))
    self:addChild(self.timeCounter)

    local baseHeight = self.timeCounter:getContentSize().height / 2 + 90
    local height = self:getAvailableHeight() - baseHeight

    display.addSpriteFramesWithFile("image/crystal_btns.plist", "image/crystal_btns.png")

    self.cells = {}
    self.covers = {}
    local randoms_1 = ez:randomSequence(8)
    local randoms_2 = ez:randomSequence(8)
    local randoms = {}
    for i = 1, #randoms_1 do
        randoms[2 * i - 1] = randoms_1[i]
        randoms[2 * i] = randoms_2[i]
    end

    local colors = {'blue', 'green', 'purple', 'red', 'white', 'yellow', 'orange', 'lightblue' }

    for i = 1, 16 do
        local x = (i - 1) % 4
        local y = math.floor((16 - i) / 4)

        local cx = 32 * (1 + x) + 60 * (1 + 2 * x)
        local dis = (height - 480) / 5
        local cy = baseHeight + dis * (1 + y) + 60 * (1 + 2 * y)

        local cell = display.newNode()
        cell:setPosition(ccp(cx, cy))
        self:addChild(cell)
        self.cells[i] = cell

        local bg = display.newSprite("#match_bg.png")
        cell:addChild(bg, 0)

        local btn = display.newSprite("#crystal_mini_" .. colors[randoms[i]] .. '.png')
        cell.index = randoms[i]
        cell:addChild(btn, 1)

        cell:setTouchEnabled(true)
        cell:addTouchEventListener(function()
            transition.execute(cell, CCOrbitCamera:create(0.1, 1, 0, 0, 90, 0, 0), {
                onComplete = function()
                    cell:setVisible(false)
                    self.covers[i]:setVisible(true)
                    transition.execute(self.covers[i], CCOrbitCamera:create(0.1, 1, 0, -90, 90, 0, 0))
                end
            })
        end)

        local cover = display.newSprite("#match_cover.png")
        cover:setPosition(ccp(cx, cy))
        cover:setVisible(false)
        cover:setTouchEnabled(true)
        cover:addTouchEventListener(function()
            transition.execute(cover, CCOrbitCamera:create(0.1, 1, 0, 0, 90, 0, 0), {
                onComplete = function()
                    cover:setVisible(false)
                    cell:setVisible(true)
                    transition.execute(cell, CCOrbitCamera:create(0.1, 1, 0, -90, 90, 0, 0), {
                        onComplete = function()
                            local bFound = 0
                            local bMatch = false
                            for j = 1, #self.cells do
                                if i ~= j and self.cells[j]:isVisible() then
                                    bFound = j
                                    if self.cells[j].index == cell.index then
                                        bMatch = true
                                    end
                                end
                            end
                            if bFound > 0 then
                                if bMatch then
                                    showAnimate(cell, false)
                                    showAnimate(self.cells[bFound], false, function()
                                        bFound = false
                                        for j = 1, #self.cells do
                                            if self.cells[j]:isVisible() or self.covers[j]:isVisible() then
                                                bFound = true
                                                break
                                            end
                                        end
                                        if bFound == false then
                                            self:gotoNextQuestion()
                                        end
                                    end)
                                else
                                    transition.execute(cell, CCOrbitCamera:create(0.1, 1, 0, 0, 90, 0, 0), {
                                        onComplete = function()
                                            cell:setVisible(false)
                                            cover:setVisible(true)
                                            transition.execute(cover, CCOrbitCamera:create(0.1, 1, 0, -90, 90, 0, 0))
                                        end
                                    })
                                    transition.execute(self.cells[bFound], CCOrbitCamera:create(0.1, 1, 0, 0, 90, 0, 0), {
                                        onComplete = function()
                                            self.cells[bFound]:setVisible(false)
                                            self.covers[bFound]:setVisible(true)
                                            transition.execute(self.covers[bFound], CCOrbitCamera:create(0.1, 1, 0, -90, 90, 0, 0))
                                        end
                                    })
                                    self:alertError()
                                end
                            end
                        end
                    })
                end
            })
        end)
        self:addChild(cover)
        self.covers[i] = cover
    end
end

function MatchQuestion:onEnterTransitionFinish()
    self:showTip(true)
    self.timeCounter:start()
end

function MatchQuestion:onExit()
    display.removeSpriteFramesWithFile("image/crystal_btns.plist")
end

return MatchQuestion