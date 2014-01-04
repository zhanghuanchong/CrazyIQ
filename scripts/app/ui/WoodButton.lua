local WoodButton = class('WoodButton', function()
    return CCMenuItemSprite:create()
end)

-- create bubble button
-- params: title, listener
function WoodButton:ctor(params)
    params.image = 'image/btn.png'
    params.imageSelected = 'image/btnActive.png'
    params.imageDisabled = params.imageSelected
    params.sound = 'sound/click.mp3'

    local listener = params.listener
    local button = self

    params.listener = function(tag)
        if params.prepare then
            params.prepare()
        end

        local function zoom1(offset, time, onComplete)
            local x, y = button:getPosition()
            local size = button:getContentSize()

            local scaleX = button:getScaleX() * (size.width + offset) / size.width
            local scaleY = button:getScaleY() * (size.height - offset) / size.height

            transition.moveTo(button, {y = y - offset, time = time})
            transition.scaleTo(button, {
                scaleX     = scaleX,
                scaleY     = scaleY,
                time       = time,
                onComplete = onComplete,
            })
        end

        local function zoom2(offset, time, onComplete)
            local x, y = button:getPosition()
            local size = button:getContentSize()

            transition.moveTo(button, {y = y + offset, time = time / 2})
            transition.scaleTo(button, {
                scaleX     = 1.0,
                scaleY     = 1.0,
                time       = time,
                onComplete = onComplete,
            })
        end

        button:getParent():setEnabled(false)

        zoom1(40, 0.08, function()
            zoom2(40, 0.09, function()
                zoom1(20, 0.10, function()
                    zoom2(20, 0.11, function()
                        button:getParent():setEnabled(true)
                        listener(tag)
                    end)
                end)
            end)
        end)
    end

    if params.title then
        local pos = button:getContentSize()
        local label = ui.newTTFLabel{
            text = params.title,
            font = 'HOPE',
            size = 45,
            color = ez.COLOR_BROWN,
            align = ui.TEXT_ALIGN_CENTER,
            x = pos.width * 0.5,
            y = pos.height * 0.55
        }
        button:addChild(label)
        self.label = label
    end
end

function WoodButton:selected()
    self.label:setPositionY(pos.height * 0.5)
end

function WoodButton:unselected()
    self.label:setPositionY(pos.height * 0.55)
end

return WoodButton
