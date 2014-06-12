local BaseQuestion = import('.BaseQuestion')

local ColorOrderRepeatQuestion = class('ColorOrderRepeatQuestion', function()
    return BaseQuestion.new()
end)

function ColorOrderRepeatQuestion:ctor()
    self.colors = {'blue', 'green', 'red', 'yellow', 'orange', 'purple'}
    self.positions = {
        {105 + 215 / 2, 468 + 100}, 
        {320 + 215 / 2, 468 + 100}, 
        {408 + 80, 297 + 122}, 
        {320 + 215 / 2, 168 + 100}, 
        {105 + 215 / 2, 168 + 100}, 
        {72 + 80, 297 + 122}
    }

    self:setTip("请按照顺序\n点击相应的按钮。")
    self.tipHeight = self.tip:getContentSize().height

    self.orderIndexByUser = 1

    display.addSpriteFramesWithFile("image/round_btns.plist", "image/round_btns.png")

    self.buttons = {}
    self.frames = {}
    self.activeFrames = {}
    local count = #self.colors
    for i,color in ipairs(self.colors) do
        local btn = display.newSprite('#' .. color .. '.png')
        local pos = self.positions[i]
        btn:setPosition(ccp(pos[1], pos[2] + 30))
        btn.color = color
        btn:addTouchEventListener(function(event)
            if event == 'began' then
                self:resetButtons()
                btn:setDisplayFrame(self.activeFrames[i])
                if (i ~= self.orderTarget[self.orderIndexByUser]) then
                    self:alertError()
                else
                    self.orderIndexByUser = self.orderIndexByUser + 1
                    if self.orderIndexByUser > #self.orderTarget then
                        self:gotoNextQuestion()
                    end
                end
            end
            return true
        end)
        self.buttons[i] = btn
        self:addChild(btn)

        self.frames[i] = display.newSpriteFrame(color .. '.png')
        self.activeFrames[i] = display.newSpriteFrame(color .. 'Active.png')
    end
    self:setButtonEnabled(false)
end

function ColorOrderRepeatQuestion:resetButtons()
    for i,btn in ipairs(self.buttons) do
        btn:setDisplayFrame(self.frames[i])
    end
end

function ColorOrderRepeatQuestion:onEnterTransitionFinish()
    self:showTip(true)

    local max = #self.colors
    local randoms = ez:randomSequence(max)
    print('==== randoms: ' .. table.concat(randoms) .. ' ====')
    local seq = {}
    self.orderTarget = randoms
    for i,v in ipairs(randoms) do
        table.insert(seq, CCCallFunc:create(function()
            self:resetButtons()
            self.buttons[v]:setDisplayFrame(self.activeFrames[v])
        end))
        table.insert(seq, CCDelayTime:create(1))
    end
    table.insert(seq, CCCallFunc:create(function()
        self:resetButtons()
        self:setTip('', nil, self.tipHeight)
        ez.gameScene:showCountDown{
            from = 0,
            y = self.tip:getPositionY() - self.tipHeight / 2 + 10,
            onComplete = function()
                self:setButtonEnabled(true)
            end
        }
    end))
    self:runAction(transition.sequence(seq))
end

function ColorOrderRepeatQuestion:onExit()
   display.removeSpriteFramesWithFile("image/round_btns.plist")
end

return ColorOrderRepeatQuestion