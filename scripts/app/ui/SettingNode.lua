local WoodSwitch = require('app.ui.WoodSwitch')

local SettingNode = class('SettingNode', function()
    return display.newNode()
end)

function SettingNode:ctor()
    local label = ez:newLabel({
        text = '音乐',
        x = -200,
        y = 0
    })
    self:addChild(label)

    local switch = WoodSwitch:create(function()
    end)
    switch:setPosition(ccp(45, 0))
    self:addChild(switch)

    label = ez:newLabel({
        text = '音效',
        x = -200,
        y = -120
    })
    self:addChild(label)
end

return SettingNode