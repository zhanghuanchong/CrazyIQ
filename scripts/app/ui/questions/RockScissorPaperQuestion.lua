local BaseQuestion = import('.BaseQuestion')
local TimeCounter = import('app.ui.TimeCounter')
local Checkbox = import('app.ui.Checkbox')

local RockScissorPaperQuestion = class('RockScissorPaperQuestion', function()
    return BaseQuestion.new()
end)

function RockScissorPaperQuestion:ctor()
    self:setTip("石头、剪子、布！")
    self.tipHeight = self.tip:getContentSize().height

    self.timeCounter = TimeCounter.new{
        total = ez.gameScene.currentQuestion.timeout,
        listener = function()
            if self.clickable then
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

    self.checkboxes = {}
    for i = 1, 3 do
        local checkbox = Checkbox.new()
        checkbox:setPosition(ccp(display.cx - (3 / 2.0 + 0.5 - i) * 70, baseHeight + height * 0.9))
        self:addChild(checkbox)
        self.checkboxes[i] = checkbox
    end
    self.level = 1

    display.addSpriteFramesWithFile("image/rock_scissor_paper.plist", "image/rock_scissor_paper.png")

    local btns = {'scissor', 'rock', 'paper' }
    self.targets = {}
    for i = 1, #btns do
        local btn = display.newSprite("#" .. btns[i] .. '.png')
        btn:setPosition(ccp(display.width * i / 4, baseHeight + btn:getContentSize().height))
        btn:setTouchEnabled(true)
        btn:addTouchEventListener(function()
            if self.answer <= 0 then
                return
            end
            if self.clickable then
                self.clickable = false
                jumpAnimate(btn, function()
                    if self:checkResult(i) then
                        self.checkboxes[self.level]:setChecked(true)
                        self.level = self.level + 1
                        if self.level > #self.checkboxes then
                            self:gotoNextQuestion()
                        else
                            self:start()
                        end
                    else
                        self:alertError(function()
                            self:start()
                        end)
                    end
                end)
            end
        end)
        self:addChild(btn)

        local target = display.newSprite("#" .. btns[i] .. '.png')
        target:setPosition(ccp(display.cx, baseHeight + height / 2))
        target:setRotation(180)
        target:setVisible(false)
        self:addChild(target)
        self.targets[i] = target
    end

    self.question_mark = display.newSprite('#question_mark.png')
    self.question_mark:setPosition(ccp(display.cx, baseHeight + height / 2))
    self.question_mark:setScale(1.5)
    self:addChild(self.question_mark)

    self.answer = 0
end

function RockScissorPaperQuestion:checkResult(i)
    if self.answer == 1 then
        return i - self.enemy == 1 or i - self.enemy == -2
    elseif self.answer == 2 then
        return self.enemy == i
    else
        return self.enemy - i == 1 or self.enemy - i == -2
    end
end

function RockScissorPaperQuestion:start()
    for i = 1, #self.targets do
        self.targets[i]:setVisible(false)
    end
    self.question_mark:setScale(1.5)
    self.question_mark:setVisible(true)

    self.timeCounter:reset()

    self:hideTip(true, function()
        self:setTip('', nil, self.tipHeight)
        self:showTip(true, function()
            ez.gameScene:showCountDown{
                from = 0,
                y = self.tip:getPositionY() - self.tipHeight / 2 + 10,
                onComplete = function()
                    transition.execute(self.question_mark, CCScaleTo:create(0.3, 0.1), {
                        easing = 'backIn',
                        onComplete = function()
                            self.question_mark:setVisible(false)
                            self.enemy = math.random(1, #self.targets)
                            self.targets[self.enemy]:setScale(0.1)
                            self.targets[self.enemy]:setVisible(true)

                            self.answer = math.random(1, 3)
                            self.clickable = true
                            self.answerText = {'要赢我！', '要平局！', '要输给我！' }
                            self:setTip(self.answerText[self.answer])
                            self.timeCounter:start()

                            transition.execute(self.targets[self.enemy], CCScaleTo:create(0.3, 2), {
                                easing = 'backOut'
                            })
                        end
                    })
                end
            }
        end)
    end)
end

function RockScissorPaperQuestion:onEnterTransitionFinish()
    self:showTip(true)

    scheduler.performWithDelayGlobal(function()
        self:start()
    end, 2)
end

function RockScissorPaperQuestion:onExit()
    display.removeSpriteFramesWithFile("image/rock_scissor_paper.plist")
end

return RockScissorPaperQuestion