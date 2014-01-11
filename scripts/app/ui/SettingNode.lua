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
    switch:setPosition(ccp(45, -50))
    self:addChild(switch)

    label = ez:newLabel({
        text = '音效',
        x = -200,
        y = -170
    })
    self:addChild(label)

    local switch = WoodSwitch.new()
    switch:setPosition(ccp(45, -170))
    self:addChild(switch)
end

return SettingNode