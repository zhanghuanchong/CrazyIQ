local BaseQuestion = import('.BaseQuestion')
local TimeCounter = import('app.ui.TimeCounter')

local PuzzleQuestion = class('PuzzleQuestion', function()
    return BaseQuestion.new()
end)

function PuzzleQuestion:ctor()
    self:setTip("拼图时间！")
    self.question = ez.gameScene.currentQuestion

    self.timeCounter = TimeCounter.new{
        total = self.question.timeout,
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

    display.addSpriteFramesWithFile("image/puzzle_"..self.question.picture..".plist", "image/puzzle_"..self.question.picture..".png")

    local frame = display.newSprite('image/puzzle_frame_'..self.question.grid..'.png')
    frame:setPosition(ccp(display.width / 2, baseHeight + height / 2))
    self:addChild(frame, self.question.grid + 1)

    local lines = math.sqrt(self.question.grid)
    local radius = frame:getContentSize().width / (lines * 2)
    local left = display.width / 2 - radius * lines
    local bottom = baseHeight + height / 2 - radius * lines

    self.cells = {}
    for i = 1, self.question.grid do
        local zero = ''
        if i <= 9 then
            zero = '0'
        end
        local cell = display.newSprite('#'..self.question.picture..'_'.. zero .. i .. '.png')
        cell:setPosition(ccp(left + radius * (1 + 2 * ((i - 1) % lines)), bottom + radius * (1 + 2 * math.floor((self.question.grid - i) / lines))))
        self:addChild(cell, i)
        self.cells[i] = cell

        cell:setTouchEnabled(true)
        cell:addTouchEventListener(function()
            if cell.rotating then
                return
            end
            cell.rotating = true
            transition.execute(cell, CCRotateBy:create(0.2, 90), {
                onComplete = function()
                    cell.rotating = false
                    if self:checkResult() then
                        self:gotoNextQuestion()
                    end
                end
            })
        end)
    end
end

function PuzzleQuestion:start()
    local rotates = ez:randomNumber(4, self.question.grid)

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
    display.removeSpriteFramesWithFile("image/puzzle_"..self.question.picture..".plist")
end

return PuzzleQuestion