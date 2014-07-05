local BaseQuestion = import('.BaseQuestion')
local TimeCounter = import('app.ui.TimeCounter')

local MemoryQuestion = class('MemoryQuestion', function()
    return BaseQuestion.new()
end)

function MemoryQuestion:ctor()
    self:setTip("记住他们！")

    self.items = ez:randomSequence(16)
    self.count = 5
    self.interval = 2

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
            local positions = {
                {x = display.width * .25, y = height * .75},
                {x = display.width * .75, y = height * .75},
                {x = display.width * .5, y = height * .5},
                {x = display.width * .25, y = height * .25},
                {x = display.width * .75, y = height * .25}
            }

            local randoms = ez:randomSequence(self.count)
            for i = 1, self.count do
                local cell = self.cells[randoms[i]]
                cell:setScale(.9)
                cell:setPosition(ccp(positions[i].x, positions[i].y))
                cell:setVisible(true)

                cell:setTouchEnabled(true)
                cell:addTouchEventListener(function()
                    jumpAnimate(cell, function()
                        if cell.index == answer then
                            self:gotoNextQuestion()
                        else
                            self:alertError()
                        end
                    end)
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