local BaseQuestion = import('.BaseQuestion')
local CrystalButton = import('app.ui.CrystalButton')

local ClickCharQuestion = class('ClickCharQuestion', function()
    return BaseQuestion.new()
end)

function ClickCharQuestion:ctor()
    self:setTip("点击红色\"5\"两次。")

    local height = self:getAvailableHeight()

    display.addSpriteFramesWithFile("image/crystal_btns.plist", "image/crystal_btns.png")
    self.positions = {
        {
            { x = 391, y = 429 },
            { x = 235, y = 190 },
            { x = 144, y = 590 },
            { x = 467, y = 673 },
            { x = 486, y = 192 },
            { x = 115, y = 334 }
        },
        {
            { x = 450, y = 200 },
            { x = 200, y = 390 },
            { x = 420, y = 590 },
            { x = 320, y = 280 },
            { x = 115, y = 192 },
            { x = 144, y = 634 }
        }
    }
    self.colors = {'blue', 'green', 'purple', 'red', 'white', 'yellow' }
    self.titleColors = {
        display.COLOR_WHITE,
        display.COLOR_BLACK,
        display.COLOR_WHITE,
        display.COLOR_WHITE,
        ccc3(255, 0, 0),
        display.COLOR_BLACK,
    }

    self.currentIndex = 1
    self.buttons = {}
    self:buildLayout()
end

function ClickCharQuestion:buildLayout()
    for i = 1, #self.buttons do
        self.buttons[i]:removeFromParent()
    end
    self.buttons = {}

    local scales = ez:randomNumber(10, 6, 4)
    for i = 1, 6 do
        local title = '' .. i
        if i == 4 then
            title = '5'
        end
        local position = self.positions[self.currentIndex][i]
        local item = CrystalButton.new({
            color = self.colors[i],
            title = title,
            titleColor = self.titleColors[i],
            scale = scales[i] / 10.0,
            x = position.x,
            y = position.y,
            listener = function()
                if i == 5 then
                    self.currentIndex = self.currentIndex + 1
                    if self.currentIndex > 2 then
                        self:gotoNextQuestion()
                    else
                        self:buildLayout()
                    end
                else
                    self:alertError()
                end
            end
        })
        self.buttons[i] = item
        self:addChild(item)
    end
end

function ClickCharQuestion:onExit()
    display.removeSpriteFramesWithFile("image/crystal_btns.plist")
end

return ClickCharQuestion