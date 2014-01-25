
local LevelsListCell = import(".LevelsListCell")
local Levels = import("app.data.Levels")

local PageControl = import("app.ui.levels.PageControl")
local LevelsList = class("LevelsList", PageControl)

LevelsList.INDICATOR_MARGIN = 46

function LevelsList:ctor(rect)
    LevelsList.super.ctor(self, rect, PageControl.DIRECTION_HORIZONTAL)

    local numPages = #Levels

    for levelIndex = 1, numPages do
        local cell = LevelsListCell.new(CCSize(display.width, rect.size.height), levelIndex, Levels[levelIndex].title)
        self:addCell(cell)
    end

    -- add indicators
    local x = (self:getClippingRect().size.width - LevelsList.INDICATOR_MARGIN * (numPages - 1)) / 2
    local y = self:getClippingRect().origin.y + 20

    self.indicator_ = display.newSprite("image/LevelIndicatorSelected.png")
    self.indicator_:setPosition(x, y)
    self.indicator_.firstX_ = x

    for pageIndex = 1, numPages do
        local icon = display.newSprite("image/LevelIndicator.png")
        icon:setPosition(x, y)
        self:addChild(icon)
        x = x + LevelsList.INDICATOR_MARGIN
    end

    self:addChild(self.indicator_)
end

function LevelsList:scrollToCell(index, animated, time)
    LevelsList.super.scrollToCell(self, index, animated, time)

    transition.stopTarget(self.indicator_)
    local x = self.indicator_.firstX_ + (self:getCurrentIndex() - 1) * LevelsList.INDICATOR_MARGIN
    if animated then
        time = time or self.defaultAnimateTime
        transition.moveTo(self.indicator_, {x = x, time = time / 2})
    else
        self.indicator_:setPositionX(x)
    end
end

return LevelsList
