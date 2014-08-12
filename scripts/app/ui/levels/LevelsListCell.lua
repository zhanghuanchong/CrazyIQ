local Levels = import("app.data.Levels")
local ScrollViewCell = import(".ScrollViewCell")
local LevelsListCell = class("LevelsListCell", ScrollViewCell)

function LevelsListCell:ctor(size, levelIndex, title)
    local currentLevel = ez:getCurrentLevel()
    local disable = currentLevel < levelIndex

    local function gotoLevel()
        if disable then
            return
        end
        disable = true
        jumpAnimate(self.levelIcon, function()
            print('level' .. levelIndex)
            ez.level = levelIndex
            app:enterGameScene()
        end)
    end

    local imageSuffix = ''
    if disable then
       imageSuffix = '_locked'
    end

    self.levelIcon = display.newSprite("#level_" .. levelIndex .. imageSuffix .. ".png", display.cx, display.height * .65)
    self.levelIcon:setTouchEnabled(true)
    self.levelIcon:addTouchEventListener(gotoLevel)
    self:addChild(self.levelIcon)

    self.levelTitle = ez:newLabel{
        text = title,
        align = ui.TEXT_ALIGN_CENTER,
        x = display.cx,
        y = display.height * 0.45,
        size = 60
    }
    self.levelTitle:setTouchEnabled(true)
    self.levelTitle:addTouchEventListener(gotoLevel)
    self:addChild(self.levelTitle)

    local scoreText = '尚未解锁'
    if currentLevel == levelIndex then
        scoreText = '最高智商： ' .. ez:getBestScore()
    elseif currentLevel > levelIndex then
        scoreText = '顺利过关！ 智商 + ' .. Levels:levelScore(levelIndex)
    end

    local fontColor = ez.COLOR_BROWN
    if currentLevel >= levelIndex then
        self.scoreBg = display.newSprite('#scoreLabel.png')
        self.scoreBg:setPosition(ccp(display.cx, display.height * .26))
        self:addChild(self.scoreBg, 1)
    else
        fontColor = ccc3(128, 128, 128)
    end

    self.scoreLabel = ez:newLabel{
        font = 'HOPE',
        text = scoreText,
        color = fontColor,
        align = ui.TEXT_ALIGN_CENTER,
        x = display.cx,
        y = display.height * .25
    }
    self:addChild(self.scoreLabel, 2)
end

return LevelsListCell
