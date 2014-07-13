local BaseQuestion = import('.BaseQuestion')
local TimeCounter = import('app.ui.TimeCounter')

local ColorAreaQuestion = class('ColorAreaQuestion', function()
    return BaseQuestion.new()
end)

function ColorAreaQuestion:ctor()
    self.count = 15
    self.colors = {
        display.COLOR_WHITE,
        display.COLOR_BLACK,
        ccc3(255, 0, 0),
        ccc3(0, 255, 0),
        ccc3(0, 0, 255),
        ccc3(128, 128, 128),
        ccc3(255, 128, 0),
        ccc3(128, 0, 128),
        ccc3(255, 255, 0)
    }
    self.colorNames = {'白', '黑', '红', '绿', '蓝', '灰', '橘', '紫', '黄'}

    self.timeCounter = TimeCounter.new{
        total = 3,
        listener = function()
            self:alertError(function()
                self:restart()
            end)
        end
    }
    self.timeCounter:setPosition(ccp(display.cx, 220))
    self:addChild(self.timeCounter, 1)

    self.pad = display.newSprite('#pad.png')
    self.pad:setPosition(ccp(display.cx, 0))
    self:addChild(self.pad, 100)
end

function ColorAreaQuestion:build(method)
    self.cells = {}
    self.colorIndex = ez:randomSequence(#self.colors)
    local colors = {}
    for i = 1, 4 do
        colors[i] = self.colors[self.colorIndex[i]]
    end
    self.items = ez:randomNumber(4, self.count)

    local counts = {}
    for i = 1, 4 do
        counts[i] = {}
    end

    for i = 1, self.count do
        local v = self.items[i]
        counts[v][#counts[v] + 1] = i
    end

    local found = false
    if method == 1 then
        local max = 0
        for i = 1, 4 do
            if #counts[i] > max then
                max = #counts[i]
            end
        end

        for i = 1, 4 do
            if #counts[i] == max then
                if found ~= false then
                    self.items[counts[i][#counts[i]]] = found
                    break
                end
                found = i
            end
        end
    else
        local min = self.count
        for i = 1, 4 do
            if #counts[i] < min then
                min = #counts[i]
            end
        end

        local max = 0
        local maxIndex = 0
        if min == 1 then
            for i = 1, 4 do
                if #counts[i] > max then
                    maxIndex = i
                    max = #counts[i]
                end
            end
        end

        for i = 1, 4 do
            if #counts[i] == min then
                if found ~= false then
                    if min > 1 then
                        self.items[counts[found][#counts[found]]] = i
                        break
                    else
                        self.items[counts[maxIndex][max]] = i
                        max = max - 1
                    end
                end
                found = i
            end
        end
    end

    local counts = {}
    for i = 1, 4 do
        counts[i] = {}
    end

    for i = 1, self.count do
        local v = self.items[i]
        counts[v][#counts[v] + 1] = i
    end

    local count = self.count
    local width = 90
    local column = 5
    local areaWidth = column * width
    local areaHeight = count / column * width
    local baseHeight = self.timeCounter:getContentSize().height / 2 + 190
    local height = self:getAvailableHeight() - baseHeight
    for i = 1, self.count do
        local x = (i - 1) % column
        local y = math.floor((count - i) / column)

        local cx = (640 - areaWidth) / 2 + (width / 2) * 2 * x
        local cy = baseHeight + (height - areaHeight) / 2 + (width / 2) * 2 * y

        local cell = CCLayerColor:create(ccc4(0, 0, 0, 255), 90, 90)
        cell:setColor(colors[self.items[i]])
        cell:setPosition(ccp(cx, cy))
        self:addChild(cell)
        self.cells[i] = cell
    end

    self.answers = {}
    local areaWidth = 500
    for i = 1, 4 do
        local cx = (640 - areaWidth) / 2 + (areaWidth - 4 * width) * (i - 1) + width / 2 + i

        local answer = ez:newLabel{
            text = self.colorNames[self.colorIndex[i]],
            color = display.COLOR_WHITE,
            size = 60
        }
        answer:setPosition(ccp(cx, 80))
        answer:setTouchEnabled(true)
        answer:addTouchEventListener(function()
            self.timeCounter:stop()
            jumpAnimate(answer, function()
                if found == i then
                    self:gotoNextQuestion()
                else
                    self:alertError(function()
                        self:restart()
                    end)
                end
            end)
        end)
        self:addChild(answer, 101)
        self.answers[i] = answer
    end
end

function ColorAreaQuestion:restart()
    local method = math.random(1, 2)
    local methodNames = {'大', '小'}

    self:hideTip(false, function()
        self:setTip('颜色面积最' .. methodNames[method] ..  '的是')
        self:showTip(true)
    end)

    if self.cells then
        for k, v in pairs(self.cells) do
            v:removeFromParentAndCleanup()
        end
    end

    if self.answers then
        for k, v in pairs(self.answers) do
            v:removeFromParentAndCleanup()
        end
    end

    self:build(method)
    self.timeCounter:start()
end

function ColorAreaQuestion:onEnterTransitionFinish()
    self:restart()
end

return ColorAreaQuestion