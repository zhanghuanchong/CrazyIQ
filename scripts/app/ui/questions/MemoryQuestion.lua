local BaseQuestion = import('.BaseQuestion')
local TimeCounter = import('app.ui.TimeCounter')

local MemoryQuestion = class('MemoryQuestion', function()
    return BaseQuestion.new()
end)

function MemoryQuestion:ctor()
    self:setTip("记住他们！")

    self.items = ez:randomSequence(16)
    self.count = 8
    self.interval = 1

    local height = self:getAvailableHeight()

    display.addSpriteFramesWithFile("image/memory_animals.plist", "image/memory_animals.png")

    self.cells = {}
    for i = 1, self.count do
        local cell = display.newSprite('#animal_' .. self.items[i] .. '.png')
        cell:setPosition(ccp(display.cx, height / 2))
        cell.index = i
        cell:setVisible(false)
        self:addChild(cell)
        self.cells[i] = cell
    end
end

function MemoryQuestion:showCell(index)
    local cell = self.cells[index]
    cell:setVisible(true)
    cell:setScale(0.1)
    transition.execute(cell, CCScaleTo:create(0.3, 1.5), {
        easing = 'backOut'
    })
end

function MemoryQuestion:switchCell(index)
    local lastCell = self.cells[index - 1]
    transition.execute(lastCell, CCScaleTo:create(0.3, 0.1), {
        easing = 'backIn',
        onComplete = function()
            lastCell:setVisible(false)

            self:showCell(index)
        end
    })
end

function MemoryQuestion:onEnterTransitionFinish()
    self:showTip(true)

    local index = 1
    self:showCell(index)
    self.handle = scheduler.scheduleGlobal(function()
        if index >= self.count then
            scheduler.unscheduleGlobal(self.handle)

            local answer = math.random(1, self.count)

            self:hideTip(true, function()
                self:setTip("第" .. answer .. "个是？")
                self:showTip(true)
            end)

            local height = self:getAvailableHeight()

            local split = 2
            local scale = 1
            if self.count > 6 then
                split = 3
                scale = 0.7
            end

            local randoms = ez:randomSequence(self.count)
            for i = 1, self.count do
                local cell = self.cells[randoms[i]]
                cell:setScale(.9)

                local x = (i - 1) % split
                local y = math.floor((self.count - i) / split)

                local cx = (640 - split * 120) / (split + 1) * (1 + x) + 60 * (1 + 2 * x)
                local dis = (height - 120 * math.ceil(self.count / split)) / (math.ceil(self.count / split) + 1)
                local cy = dis * (1 + y) + 60 * (1 + 2 * y)
                cell:setPosition(ccp(cx, cy))
                cell:setVisible(true)
                cell:setScale(scale)

                cell:setTouchEnabled(true)
                cell:addTouchEventListener(function()
                    jumpAnimate(cell, function()
                        if cell.index == answer then
                            self:gotoNextQuestion()
                        else
                            self:alertError()
                        end
                    end, false)
                end)
            end
        else
            index = index + 1
            self:switchCell(index)
        end
    end, self.interval)
end

function MemoryQuestion:onExit()
    display.removeSpriteFramesWithFile("image/puzzle_frame.plist")
end

return MemoryQuestion