local WoodSquare = class('WoodSquare', function(params)
    params.image = params.image or "#woodSquare.png"
    params.imageActive = params.imageActive or "#woodSquareActive.png"
    local imageNormal = display.newSprite(params.image)
    local imageSelected = display.newSprite(params.imageActive)
    local item = MenuItemSpriteExtension:create(imageNormal, imageSelected)
    CCSpriteExtend.extend(item)
    return item
end)

-- create bubble button
-- params: title, listener
function WoodSquare:ctor(params)
    params.sound = 'sound/click.mp3'

    local listener = params.listener
    local button = self

    params.listener = function(tag)
        if params.prepare then
            params.prepare()
        end

        button:getParent():setEnabled(false)
        jumpAnimate(button, function()
            button:getParent():setEnabled(true)
            listener(tag)
        end)
    end

    self:registerScriptTapHandler(function(tag)
        if params.sound then ez:playEffect(params.sound) end
        params.listener(tag)
    end)

    local x, y = params.x, params.y
    local tag = params.tag
    if x and y then self:setPosition(x, y) end
    if tag then self:setTag(tag) end

    if params.title then
        local pos = button:getContentSize()
        local label = ez:newLabel({
            text = params.title,
            align = ui.TEXT_ALIGN_CENTER,
            x = pos.width * 0.5,
            y = pos.height * 0.5
        }, params.clear or null)
        button:addChild(label)
        self.label = label
    end
end

return WoodSquare
