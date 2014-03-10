local TimeCounter = import('app.ui.TimeCounter')
local BaseQuestion = import('.BaseQuestion')
local Checkbox = import('app.ui.Checkbox')

local ColorTextQuestion = class('ColorTextQuestion', function()
    return BaseQuestion.new()
end)

function ColorTextQuestion:ctor()
    self:setTip("按照指示点击相应的按钮。\n必须选对三次哦！")
    self.tipHeight = self.tip:getContentSize().height

    local timeCounter = TimeCounter.new{
        total = 10
    }
    timeCounter:setPosition(ccp(display.cx, 80))
    self:addChild(timeCounter)
    self.timeCounter = timeCounter

    local baseHeight = timeCounter:getContentSize().height / 2 + 90
    local height = self:getAvailableHeight() - baseHeight

    for i = 1, 3 do
        local checkbox = Checkbox.new()
        checkbox:setPosition(ccp(display.cx - (3 / 2.0 + 0.5 - i) * 70, baseHeight + height * 0.8))
        self:addChild(checkbox)
    end

    display.addSpriteFramesWithFile("image/rect_btn.plist", "image/rect_btn.png")

    local colors = {'green', 'yellow', 'blue', 'red' }
    for i = 1, #colors do
        local color = colors[i]
        local btn = display.newSprite('#rect_btn_'..color..'.png')
        btn:setPosition(ccp(display.width * ((i % 2) * 2 + 1) / 4, baseHeight + height * (math.floor(i / 3) + 1) * 0.25))
        btn:setTouchEnabled(true)
        btn:addTouchEventListener(function()
            jumpAnimate(btn)
        end)
        self:addChild(btn)
    end

    self.modal = self:newModalLayer()
    self:addChild(self.modal)
end

function ColorTextQuestion:onEnterTransitionFinish()
    self:showTip(true)

    local seq = transition.sequence({
        CCDelayTime:create(5),
        CCCallFunc:create(function()
            self:setTip("", nil, self.tipHeight)

            ez.gameScene:showCountDown{
                from = 3,
                y = self.tip:getPositionY() - self.tipHeight / 2,
                onComplete = function()
                    self.modal:removeFromParent()

                    self:setTip("红色按钮", 60, self.tipHeight)
                end
            }
        end),
    })
    self:runAction(seq)
end

function ColorTextQuestion:onExit()
    display.removeSpriteFramesWithFile("image/rect_btn.plist")
end

return ColorTextQuestion