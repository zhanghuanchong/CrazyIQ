local WoodSwitch = require('app.ui.WoodSwitch')

local SettingNode = class('SettingNode', function()
    return display.newNode()
end)

function SettingNode:ctor()
    local label = ez:newLabel({
        text = '音乐',
        x = -200,
        y = -50
    })
    self:addChild(label)

    local switch = WoodSwitch.new()
    switch:setOn(ez.isBgMusicEnabled)
    switch:setHandler(function()
        local isOn = switch:isOn()
        ez.userDefault:setBoolForKey("bgMusic", isOn)
        ez.isBgMusicEnabled = isOn
        if isOn then
            ez.playBackgroundMusic("sound/bg.mp3", true)
        else
            audio.stopBackgroundMusic("sound/bg.mp3")
        end
    end)
    switch:setPosition(ccp(45, -50))
    self:addChild(switch)

    label = ez:newLabel({
        text = '音效',
        x = -200,
        y = -170
    })
    self:addChild(label)

    local switch = WoodSwitch.new()
    switch:setOn(ez.isEffectEnabled)
    switch:setHandler(function()
        local isOn = switch:isOn()
        ez.userDefault:setBoolForKey("effect", isOn)
        ez.isEffectEnabled = isOn
    end)
    switch:setPosition(ccp(45, -170))
    self:addChild(switch)
end

return SettingNode