local TimeCounter = import('app.ui.TimeCounter')
local BaseQuestion = import('.BaseQuestion')
local Checkbox = import('app.ui.Checkbox')
local WoodSquare = import('app.ui.WoodSquare')
local WoodButton = import('app.ui.WoodButton')

local MathQuestion = class('MathQuestion', function()
    return BaseQuestion.new()
end)

function MathQuestion:ctor()
    self.question = ez.gameScene.currentQuestion
    self:setTip("计算算式的结果！")
    self.tipHeight = self.tip:getContentSize().height

    self.timeCounter = TimeCounter.new{
        total = self.question.timeout,
        listener = function()
            if self.menuEnabled then
                self.menuEnabled = false
                self:alertError(function()
                    self:newLevel()
                end)
            end
        end
    }
    self.timeCounter:setPosition(ccp(display.cx, 80))
    self:addChild(self.timeCounter)

    local baseHeight = self.timeCounter:getContentSize().height / 2 + 90
    local height = self:getAvailableHeight() - baseHeight

    self.checkboxes = {}
    for i = 1, self.question.count do
        local checkbox = Checkbox.new()
        checkbox:setPosition(ccp(display.cx - (self.question.count / 2.0 + 0.5 - i) * 70, baseHeight + height))
        self:addChild(checkbox)
        checkbox:setVisible(false)
        self.checkboxes[i] = checkbox
    end
    self.level = 1

    local buttons = {}
    for i = 1, 12 do
        local r = 80
        local dis = (display.width - 6 * r) / 7
        local title = (i - 1)
        if i == 11 then
            title = '+/-'
        elseif i == 12 then
            title = '←'
        end
        local btn = WoodSquare.new{
            title = title,
            clear = true,
            listener = function()
                if self.menuEnabled ~= true then
                    return
                end
                if i == 11 then
                    if self.answerInput then
                        local s = string.sub(self.answerInput, 1, 1)
                        print(s)
                        if s == '-' then
                            self.answerInput = string.sub(self.answerInput, 2, string.len(self.answerInput))
                        else
                            self.answerInput = '-' .. self.answerInput
                        end
                    end
                elseif i == 12 then
                    if string.len(self.answerInput) >= 1 then
                        self.answerInput = string.sub(self.answerInput, 1, string.len(self.answerInput) - 1)
                    end
                elseif string.len(self.answerInput) < 4 then
                    self.answerInput = self.answerInput .. (i - 1)
                end
                self.labelAnswer:setString(self.answerInput)

                if self.answerInput == self.answer then
                    self.menuEnabled = false
                    ez:playEffect('sound/success.mp3')
                    scheduler.performWithDelayGlobal(function()
                        self:passLevel()
                    end, 0.5)
                end
            end,
            disableParent = false,
            disableAnimation = true,
            x = ((i - 1) % 6 * 2 + 1) * r / 2 + ((i - 1) % 6 + 1) * dis,
            y = (3.5 - math.ceil(i / 6) * 1.2) * r + baseHeight
        }
        buttons[i] = btn
    end
    self.menu = ui.newMenu(buttons)
    self.menu:setPosition(ccp(0, 0))
    self:addChild(self.menu)

    self.menuEnabled = false
end

function MathQuestion:newLevel()
    self.timeCounter:reset()

    if self.labelQuestion then
        self.labelQuestion:removeFromParent()
    end
    if self.labelAnswer then
        self.labelAnswer:removeFromParent()
    end

    self.answerInput = ''
    self.labelAnswer = ez:newLabel({
        text = self.answerInput,
        x = display.cx + 200,
        y = display.height * 0.6,
        align = ui.TEXT_ALIGN_LEFT,
        size = 110
    }, true)
    self:addChild(self.labelAnswer)

    local numbers = ez:randomNumber(99, 2, 1)
    local x = '+'
    self.answer = numbers[1] + numbers[2]
    if ez:randomNumber(2, 1)[1] == 1 then
        x = '-'
        self.answer = numbers[1] - numbers[2]
    end
    self.answer = '' .. self.answer
    self.labelQuestion = ez:newLabel({
        text = numbers[1] .. x .. numbers[2] .. '= ',
        x = display.cx - 80,
        y = display.height * 0.6,
        align = ui.TEXT_ALIGN_CENTER,
        size = 110
    }, true)
    self:addChild(self.labelQuestion)

    self.menuEnabled = true

    self.timeCounter:start()
end

function MathQuestion:passLevel()
    local checkbox = self.checkboxes[self.level]
    checkbox:setChecked(true)

    self.level = self.level + 1
    if self.level > #self.checkboxes then
        self:gotoNextQuestion()
    else
        self:newLevel()
    end
end

function MathQuestion:onEnterTransitionFinish()
    self:showTip(false)
    scheduler.performWithDelayGlobal(function()
        self:hideTip(true, function()
            self:setTip('', nil, self.tipHeight)
            self:showTip(true, function()
                ez.gameScene:showCountDown{
                    from = 0,
                    y = self.tip:getPositionY() - self.tipHeight / 2 + 10,
                    onComplete = function()
                        self:hideTip(false, function()
                            for k, v in pairs(self.checkboxes) do
                                v:setVisible(true)
                            end
                            self:newLevel()
                        end)
                    end
                }
            end)
        end)
    end, 2)
end

return MathQuestion