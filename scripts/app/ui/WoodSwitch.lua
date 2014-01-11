local WoodSwitch = class('WoodSwitch', function()
    return CCControlSwitch.create(
        display.newSprite('image/switchMask.png'),
        display.newSprite('image/switchOn.png'),
        display.newSprite('image/switchOff.png'),
        display.newSprite('image/switchThumb.png'),
        ez:newLabel{
            text = "开",
            color = ccGREEN
        },
        ez:newLabel{
            text = "关",
            color = ccRED
        }
    )
end)

function WoodSwitch:ctor()
    
end

return WoodSwitch