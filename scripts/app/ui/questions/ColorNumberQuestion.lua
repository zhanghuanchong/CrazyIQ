local BaseQuestion = import('.BaseQuestion')
local TimeCounter = import('app.ui.TimeCounter')
local CrystalButton = import('app.ui.CrystalButton')

local ColorNumberQuestion = class('ColorNumberQuestion', function()
    return BaseQuestion.new()
end)

function ColorNumberQuestion:ctor()
    self.colors = {'green', 'orange', 'purple', 'red', 'blue', 'yellow', 'white', 'lightblue'}
    self.colorNames = {'绿色', '橙色', '紫色', '红色', '蓝色', '黄色', '白色', '浅蓝'}
    local count = 6
    self.randoms = ez:randomSequence(count)
    self.randoms2 = ez:randomSequence(count)

    self:setTip("仔细观察这些按钮。")
    self.tipHeight = self.tip:getContentSize().height
    self.buttons = {}
    self.positions = {}

    self.timeCounter = TimeCounter.new{
        total = 10,
        listener = function()
            self.timeCounter:setVisible(false)
            self.randoms3 = ez:randomSequence(count)
            for i = 1, count do
                self.buttons[i]:setTitleVisible(false)
                transition.execute(self.buttons[i], CCMoveTo:create(1, self.positions[self.randoms3[i]]), {
                    easing = 'backInOut'
                })
            end
            self.target = math.random(1, count)
            self:hideTip(true, function()
                self:setTip('数字' .. self.target .. '对应的按钮是哪个？')
                self:showTip(true)
            end)
        end
    }
    self.timeCounter:setPosition(ccp(display.cx, 80))
    self:addChild(self.timeCounter)

    local baseHeight = self.timeCounter:getContentSize().height / 2 + 90
    local height = self:getAvailableHeight() - baseHeight

    display.addSpriteFramesWithFile("image/crystal_btns.plist", "image/crystal_btns.png")

    for i = 1, count do
        local x = (i - 1) % 3
        local y = math.floor((count - i) / 3)

        local cx = (640 - 3 * 120) / (3 + 1) * (1 + x) + 60 * (1 + 2 * x)
        local dis = (height - 120 * math.ceil(count / 3)) / (math.ceil(count / 3) + 1)
        local cy = baseHeight + dis * (1 + y) + 60 * (1 + 2 * y)

        local item = CrystalButton.new({
            color = self.colors[self.randoms[i]],
            title = '' .. self.randoms2[i],
            titleSize = 80,
            scale = 1.3,
            x = cx,
            y = cy,
            mini = true,
            listener = function()
                if self.target then
                    if self.randoms2[i] == self.target then
                        self:gotoNextQuestion()
                    else
                        self:alertError()
                    end
                end
            end
        })
        self.buttons[i] = item
        self.positions[i] = ccp(cx, cy)
        self:addChild(item)
    end
end

function ColorNumberQuestion:onEnterTransitionFinish()
    self:showTip(true)

    self.timeCounter:start()
end

function ColorNumberQuestion:onExit()
   display.removeSpriteFramesWithFile("image/crystal_btns.plist")
end

return ColorNumberQuestion