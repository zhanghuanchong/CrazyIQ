local BaseQuestion = import('.BaseQuestion')

local ClickSmallestBtnQuestion = class('ClickSmallestBtnQuestion', function()
    return BaseQuestion.new()
end)

function ClickSmallestBtnQuestion:ctor()
    self:setTip("请点击最小的绿色　　按钮。")

    local height = self:getAvailableHeight()

    display.addSpriteFramesWithFile("image/buttons.plist", "image/buttons.png")

    local btnGreen = display.newSprite('#btn_continue.png')
    btnGreen:setTouchEnabled(true)
    btnGreen:setPosition(ccp(435, height + 40))
    btnGreen:setScale(0.2)
    btnGreen:addTouchEventListener(function()
        jumpAnimate(btnGreen, function()
            self:gotoNextQuestion()
        end, false)
    end)
    self:addChild(btnGreen)

    local positions = {
        {x = 130,  y = 330},
        {x = 550, y = 150},
        {x = 300, y = 450},
        {x = 150,  y = 600},
        {x = 490, y = 700}
    }
    local sizes = {
        .35, .8, 1, .7, .5
    }

    for i = 1, #positions do
        local btnGreen = display.newSprite('#btn_continue.png')
        btnGreen:setTouchEnabled(true)
        btnGreen:setPosition(ccp(positions[i]['x'], positions[i]['y']))
        btnGreen:setScale(sizes[i])
        btnGreen:addTouchEventListener(function()
            jumpAnimate(btnGreen, function()
                self:alertError()
            end, false)
        end)
        self:addChild(btnGreen)
    end
end

function ClickSmallestBtnQuestion:onExit()
    display.removeSpriteFramesWithFile("image/buttons.plist")
end

return ClickSmallestBtnQuestion