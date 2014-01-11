local WoodButton = class('WoodButton', function()
    local imageNormal = display.newSprite('image/btn.png')
    local imageSelected = display.newSprite('image/btnActive.png')
    local item = MenuItemSpriteExtension:create(imageNormal, imageSelected)
    CCSpriteExtend.extend(item)
    return item
end)

-- create bubble button
-- params: title, listener
function WoodButton:ctor(params)
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

    self:registerScriptTapHandler(function(tag)
        if params.sound then ez.playEffect(params.sound) end
        params.listener(tag)
    end)

    local x, y = params.x, params.y
    local tag = params.tag
    if x and y then item:setPosition(x, y) end
    if tag then item:setTag(tag) end

    if params.title then
        local pos = button:getContentSize()
        local label = ez:newLabel{
            text = params.title,
            align = ui.TEXT_ALIGN_CENTER,
            x = pos.width * 0.5,
            y = pos.height * 0.55
        }
        button:addChild(label)
        self.label = label

        button:setSelectedCallback(function()
            label:setPositionY(pos.height * 0.5)
        end);

        button:setUnselectedCallback(function()
            label:setPositionY(pos.height * 0.55)
        end)
    end
end

return WoodButton
