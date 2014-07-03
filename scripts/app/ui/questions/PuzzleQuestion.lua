local BaseQuestion = import('.BaseQuestion')
local TimeCounter = import('app.ui.TimeCounter')

local PuzzleQuestion = class('PuzzleQuestion', function()
    return BaseQuestion.new()
end)

function PuzzleQuestion:ctor()
    self:setTip("拼图时间！")

    self.timeCounter = TimeCounter.new{
        total = 60,
        listener = function()
            if self:checkResult() == false then
                self:alertError(function()
                    self:start()
                end)
            end
        end
    }
    self.timeCounter:setPosition(ccp(display.cx, 80))
    self:addChild(self.timeCounter)

    local baseHeight = self.timeCounter:getContentSize().height / 2 + 90
    local height = self:getAvailableHeight() - baseHeight

    display.addSpriteFramesWithFile("image/puzzle_frame.plist", "image/puzzle_frame.png")
    display.addSpriteFramesWithFile("image/puzzle_icon.plist", "image/puzzle_icon.png")

    local frame = display.newSprite('#frame.png')
    frame:setPosition(ccp(display.width / 2, baseHeight + height / 2))
    self:addChild(frame, 10)

    local radius = frame:getContentSize().width / 6
    local left = display.width / 2 - radius * 3
    local bottom = baseHeight + height / 2 - radius * 3

    self.cells = {}
    for i = 1, 9 do
        local cell = display.newSprite('#frame_0' .. i .. '.png')
        cell:setPosition(ccp(left + radius * (1 + 2 * ((i - 1) % 3)), bottom + radius * (1 + 2 * math.floor((9 - i) / 3))))
        self:addChild(cell, i)
        self.cells[i] = cell

        cell:setTouchEnabled(true)
        cell:addTouchEventListener(function()
            transition.execute(cell, CCRotateBy:create(0.2, 90), {
                onComplete = function()
                    if self:checkResult() then
                        self:gotoNextQuestion()
                    end
                end
            })
        end)
    end
end

function PuzzleQuestion:start()
    local rotates = ez:randomNumber(4, 9)

    for i = 1, #self.cells do
        local cell = self.cells[i]
        cell:setRotation(90 * rotates[i])
    end

    self.timeCounter:start()
end

function PuzzleQuestion:checkResult()
    for i = 1, #self.cells do
        local cell = self.cells[i]
        if cell:getRotation() % 360 ~= 0 then
            return false
        end
    end
    return true
end

function PuzzleQuestion:onEnterTransitionFinish()
    self:showTip(true)

    self:start()
end

function PuzzleQuestion:onExit()
    display.removeSpriteFramesWithFile("image/puzzle_frame.plist")
    display.removeSpriteFramesWithFile("image/puzzle_icon.plist")
end

return PuzzleQuestion