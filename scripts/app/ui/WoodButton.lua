local WoodButton = {}

-- create bubble button
function WoodButton.new(params)
    params.image = 'image/btn.png'
    params.imageSelected = 'image/btnActive.png'
    params.imageDisabled = params.imageSelected
    params.sound = 'sound/click.mp3'

    local listener = params.listener
    local button -- pre-reference

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

    button = ui.newImageMenuItem(params)
    if params.title then
        local pos = button:getContentSize()
        local label = ui.newTTFLabel{
            text = params.title,
            font = 'HOPE',
            size = 45,
            color = ez.COLOR_BROWN,
            textAlign = ui.TEXT_ALIGN_CENTER,
            x = pos.x * 0.5,
            y = pos.y * 0.5
        }
        button:addChild(label)
    end
    return button
end

return WoodButton
