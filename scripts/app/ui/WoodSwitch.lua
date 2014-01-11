local WoodSwitch = class('WoodSwitch', function()
    return CCControlSwitch:create(
        display.newSprite('image/switchMask.png'),
        display.newSprite('image/switchOn.png'),
        display.newSprite('image/switchOff.png'),
        display.newSprite('image/switchThumb.png'),
        ez:newLabel{
            text = "开",
            color = ccc3(0, 160, 0)
        },
        ez:newLabel{
            text = "关",
            color = ccc3(255, 0, 0)
        }
    )
end)

function WoodSwitch:setHandler(listener)
    self:addHandleOfControlEvent(function()
        listener()
        if self:isOn() then
            ez.playEffect("sound/on.mp3")
        else
            ez.playEffect("sound/off.mp3")
        end
    end, CCControlEventValueChanged)
end

return WoodSwitch