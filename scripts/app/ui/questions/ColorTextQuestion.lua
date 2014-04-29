local TimeCounter = import('app.ui.TimeCounter')
local BaseQuestion = import('.BaseQuestion')
local Checkbox = import('app.ui.Checkbox')

local ColorTextQuestion = class('ColorTextQuestion', function()
    return BaseQuestion.new()
end)

function ColorTextQuestion:ctor()
    self:setTip("按照指示点击相应的按钮。\n必须选对三次哦！")
    self.tipHeight = self.tip:getContentSize().height

    self.timeCounter = TimeCounter.new{
        total = 10
    }
    self.timeCounter:setPosition(ccp(display.cx, 80))
    self:addChild(self.timeCounter)

    local baseHeight = self.timeCounter:getContentSize().height / 2 + 90
    local height = self:getAvailableHeight() - baseHeight

    self.checkboxes = {}
    for i = 1, 3 do
        local checkbox = Checkbox.new()
        checkbox:setPosition(ccp(display.cx - (3 / 2.0 + 0.5 - i) * 70, baseHeight + height * 0.8))
        self:addChild(checkbox)
        self.checkboxes[i] = checkbox
    end
    self.level = 1

    display.addSpriteFramesWithFile("image/rect_btn.plist", "image/rect_btn.png")

    self.buttons = {}
    self.buttonPosition = {}
    local colors = {'green', 'yellow', 'blue', 'red' }
    local buttonText = {'绿色', '黄色', '蓝色', '红色'}
    self.buttonText = buttonText
    self.colors = colors
    for i = 1, #colors do
        local color = colors[i]
        local btn = display.newSprite('#rect_btn_'..color..'.png')
        local pos = ccp(display.width * (((i + 1) % 2) * 2 + 1) / 4, baseHeight + height * (math.floor((5 - i) / 3) + 1) * 0.25)
        btn:setPosition(pos)
        self.buttonPosition[i] = pos
        btn.color = color
        btn.index = i
        btn:setTouchEnabled(true)
        btn:addTouchEventListener(function()
            local t = self.randomTargetType
            local pass = (t == 1 and btn.index == self.randomIndex)
                    or (t == 2 and btn.label.randomIndex == self.randomIndex)
            if pass then
                self.timeCounter:reset()
            end
            jumpAnimate(btn, function()
                if pass then
                    -- self:passLevel()
                    print("RIGHT")
                    self:newLevel()
                else
                    print("WRONG XXXXXX")
                    -- self:alertError(function()
                    --     self:newLevel()
                    -- end)
                end
            end)
        end)
        self.buttons[i] = btn
        self:addChild(btn, 1)

        local size = btn:getContentSize()

        local label = ez:newLabel{
            text = buttonText[i],
            color = ccc3(0, 0, 0),
            align = ui.TEXT_ALIGN_CENTER,
            valign = ui.TEXT_VALIGN_CENTER,
            dimensions = size,
            x = size.width / 2,
            y = size.height / 2 + 3
        }
        btn.label = label
        btn:addChild(label, 2)
    end

    self.targetType = {'按钮', '文字'}

    self.modal = self:newModalLayer()
    self:addChild(self.modal)
end

function ColorTextQuestion:resetButtons()
    local max = table.getn(self.colors)
    local positions = ez:randomSequence(max)
    local positions2 = ez:randomSequence(max)
    for i, btn in ipairs(self.buttons) do
        local index = positions[i]
        btn:setPosition(self.buttonPosition[index])
        index = positions2[i]
        btn.label.randomIndex = index
        btn.label:setString(self.buttonText[index])
    end
end

function ColorTextQuestion:newLevel()
    local max = table.getn(self.colors)
    local random = math.random(max)
    self.randomIndex = random
    local color = self.buttonText[random]

    local randomTargetType = math.random(1, 2)
    self.randomTargetType = randomTargetType
    local targetType = self.targetType[randomTargetType]
    local target = color .. targetType 
    self:setTip(target, 60, self.tipHeight)

    self:resetButtons()

    self.timeCounter:start()
end

function ColorTextQuestion:passLevel()
    local checkbox = self.checkboxes[self.level]
    checkbox:setChecked(true)

    self.level = self.level + 1
    if self.level > #self.checkboxes then
        self:gotoNextQuestion()
    else
        self:newLevel()
    end
end

function ColorTextQuestion:onEnterTransitionFinish()
    self:showTip(true)

    local seq = transition.sequence({
        CCDelayTime:create(0),
        -- for test
        -- CCDelayTime:create(4),
        CCCallFunc:create(function()
            self:hideTip(true, function()
                self:setTip('', nil, self.tipHeight)
                self:showTip(true, function()
                    ez.gameScene:showCountDown{
                        from = 0,
                        -- for test
                        -- from = 3,
                        y = self.tip:getPositionY() - self.tipHeight / 2 + 10,
                        onComplete = function()
                            self:hideTip(true, function()
                                self:setTip('', nil, self.tipHeight)
                                self:showTip(true, function()
                                    self.modal:removeFromParent()
                                    self:newLevel()
                                end)
                            end)
                        end
                    }
                end)
            end)
        end)
    })
    self:runAction(seq)
end

function ColorTextQuestion:onExit()
    display.removeSpriteFramesWithFile("image/rect_btn.plist")
end

return ColorTextQuestion