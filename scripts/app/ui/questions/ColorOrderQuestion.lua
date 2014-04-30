local BaseQuestion = import('.BaseQuestion')

local ColorOrderQuestion = class('ColorOrderQuestion', function()
    return BaseQuestion.new()
end)

function ColorOrderQuestion:ctor()
    local colors = {'green', 'orange', 'purple', 'red', 'blue', 'yellow'}
    local colorNames = {'绿色', '橙色', '紫色', '红色', '蓝色', '黄色'}
    local count = #colors
    local randoms = ez:randomSequence(count)

    local targetNames = {}
    self.targets = {}
    for i = 1, 3 do
    	local index = randoms[i]
    	targetNames[i] = colorNames[index]
    	self.targets[i] = colors[index]
    end
    self.currentIndex = 1

    self:setTip("稍候请依次点击\n" .. table.concat(targetNames, '、') .. "按钮。")
    self.tipHeight = self.tip:getContentSize().height

    local height = self:getAvailableHeight()

    display.addSpriteFramesWithFile("image/rect_btn.plist", "image/rect_btn.png")

    self.buttons = {}
    for i,color in ipairs(colors) do
        local btn = display.newSprite('#rect_btn_'..color..'.png')
        local pos = ccp(display.width * (((i + 1) % 2) * 2 + 1) / 4, height * 0.3 + height * 0.7 / (count / 2) * math.floor((i - 1) / 2))
        btn:setPosition(pos)
        btn.color = color
        btn:setTouchEnabled(true)
        btn:addTouchEventListener(function()
    		if btn.color == self.targets[self.currentIndex] then
    			transition.execute(btn, CCScaleTo:create(0.3, 0.1), {
	                easing = "backIn",
	                onComplete = function()
	                    btn:removeFromParent()
                        if self.currentIndex == #self.targets then
                            self:gotoNextQuestion()
                        else
	                        self.currentIndex = self.currentIndex + 1
                        end
	                end
	            })
	        else
	        	jumpAnimate(btn)
	            self:alertError()
    		end
        end)
        self.buttons[i] = btn
        self:addChild(btn)
    end
    self:setButtonEnabled(false)
end

function ColorOrderQuestion:onEnterTransitionFinish()
    self:showTip(true)

    local seq = transition.sequence({
        CCDelayTime:create(4),
        CCCallFunc:create(function()
            self:setTip('', nil, self.tipHeight)
            ez.gameScene:showCountDown{
                from = 0,
                y = self.tip:getPositionY() - self.tipHeight / 2 + 10,
                onComplete = function()
                    self:setButtonEnabled(true)
                	self:hideTip()
                end
            }
        end)
    })
    self:runAction(seq)
end

function ColorOrderQuestion:onExit()
   display.removeSpriteFramesWithFile("image/rect_btn.plist")
end

return ColorOrderQuestion